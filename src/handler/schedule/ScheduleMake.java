package handler.schedule;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import schedule.ScheduleDao;
import schedule.ScheduleDataBean;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;
import spec.SpecDao;
import spec.SpecDataBean;
import workout.WorkoutDao;
import workout.WorkoutDataBean;


public class ScheduleMake {

	ScheduleListDao scheduleListDao;
	ScheduleDao scheduleDao;
	SpecDao specDao;
	WorkoutDao workoutDao;
	
	//나이-성별별 체지방률 단계 (각 4개씩 연령별: 1.10-20대, 2.30대 , 3.40대, 4.50대 이상)
	//0~15 : 남자 
	//16~31: 여자
	double fatGenderAge[]={ 11, 15.3, 20, 24,
			15, 18.8, 21.8, 25.6,
			18, 21, 24, 28.2,
			20, 23, 26, 29,
			19, 22, 25, 29.6,
			20.2, 23.2, 25.9, 31,
			23, 26, 30, 33.5,
			26.6, 29.7, 33.1, 36.2 };
	
	//스케줄 생성자 입력 데이터
	float weight;
	float height;
	float muscle;
	float fat;
	int age;
	int gender;
	int date_lately;
	int weekly_ex_num;
	int goal;
	Timestamp startday;
	String user_id;
	
	//메소드로 생성시켜야 하는 값
	int bmi;
	float fatPercent;
	float muscleAverage;
	//운동난이도를 만드는 요소들
	int fatGrade=0;
	boolean muscleBetter=false;
	
	Random r=new Random();
	
	public ScheduleMake(int weight,int height,float muscle,float fat,int age,int gender,
						int date_lately, int weekly_ex_num,
						int goal, Timestamp startday, String user_id,
						ScheduleListDao scheduleListDao,ScheduleDao scheduleDao,SpecDao specDao,WorkoutDao workoutDao){
		this.weight=weight;
		this.height=height;
		this.muscle=muscle;
		this.fat=fat;
		this.age=age;
		this.gender=gender;
		this.date_lately=date_lately;
		this.weekly_ex_num=weekly_ex_num;
		this.goal=goal;
		this.startday=startday;
		this.user_id=user_id;
		this.scheduleListDao=scheduleListDao;
		this.scheduleDao=scheduleDao;
		this.specDao=specDao;
		this.workoutDao=workoutDao;
	}
	//BMI 지수 뽑기
	public void makeBMI(){
		double tmpBMI = weight / (height*height);
		if(tmpBMI<18.5){//저체중
			bmi=0;
		}else if(tmpBMI<23){//정상
			bmi=1;
		}else if(tmpBMI<25){//과체중
			bmi=2;
		}else if(tmpBMI<30){//비만
			bmi=3;
		}else{//고도비만
			bmi=4;
		}
	}
	
	//체지방률 지수 뽑기
	public void makeFatPercent(){
		fatPercent = fat / weight;
	}
	
	//체지방률 단계 뽑기
	//1: 남자, 2: 여자
	//나이 1: 10-20대, 2: 30대, 3: 40대, 4: 50대이상 
	public void checkFatPercentOnAgeChart(){
		int start=16*(gender-1) + 4*(age-1);
		
		if(fatPercent <= fatGenderAge[start]){//선수급
			fatGrade=4;
		}else if(fatPercent <= fatGenderAge[start+1]){//우수
			fatGrade=3;
		}else if(fatPercent <= fatGenderAge[start+2]){//일반인
			fatGrade=2;
		}else if(fatPercent <= fatGenderAge[start+3]){//체지방감량 필요
			fatGrade=1;
		}else if(fatPercent > fatGenderAge[start+3]){//체지방 너무너무많아... 다이어트해야해
			fatGrade=0;
		}
	}
	
	//표준 근육량 - > 체지방률 대비 근육정도가 높은지 낮은지
	public void makeMuscleAverage(){
		float value=gender==1?(float)1.05:(float)0.9;
		
		muscleAverage = (weight-fatPercent)*value;
	}
	
	//근육량이 표준보다 낮은지 높은지 체크
	public void checkMuscleHigherAverage(){
		muscleBetter = muscle > muscleAverage ? true : false;
	}
	
	public int getRandom(int max, int min){
		
		return (int)r.nextInt(max)+min;
	}
	//스케줄 생성
	public void makeSchedule(){
		/*
		 <스케줄 알고리즘 ^^ >
		 date_lately이  3이상인 경우 모두 적응운동 루틴
		 아닌데 fatGrade이 2이하인 경우 향상 운동부터
		 fatGrade이 1이상의 경우 유지운동 -> goal이 3 일 경우 향상 운동
		 
		 스케줄을 4주단위로!
		 
		 weekly_ex_num이  1 일 경우 3회로 최대한 맞춤
		 주별 운동 > 상체/하체 번갈아가며, weekly_ex_num이 3이상 일때 일 수가 5일 이상인 경우 Burn운동
		 일별 운동 > 시작 운동 Stretch - 본 운동 - 마침 운동 Stretch(workout_name이 like %스트래칭%)
		 
		 Burn 운동의 경우 최소 20분 이상
		 
		 BMI 3일경우 Burn운동,Multi운동 추가, BMI 4일 경우 goal이 3아니면 Burn 운동 위주
		 */
		int burnTime=0; //오늘의 운동 유산소 운동 시간 체크 20분이상
		boolean continueSche=true; //상세스케줄 생성 멈춤
		
		int scheType=1; // 적응운동1, 향상운동2, 유지운동3
		if(date_lately>2){
			scheType=1;
		}else{
			if(fatGrade<3){
				scheType=2;
			}else{
				scheType = goal==3?2:3;
			}
		}
		
		//가장최신 스펙데이터로 스케줄을 만듬
		SpecDataBean specDto=specDao.getLatelySpec(user_id);
		int insertResult;//삽입성공했는지 아닌지

		//i가  weekly_ex_num  1)10:2-3, 2)14:3-4, 3)18:4-5, 4)22:5-6
		//startday의 요일
		Calendar cal = Calendar.getInstance();
		cal.setTime(startday);
		int dayOfWeekNum = cal.get(java.util.Calendar.DAY_OF_WEEK);//일요일1 : 토요일7
		
		//첫번째 시작하는 주가 한 주 필요할 일보다 작으면 //첫주가 부족해서 마지막주에 추가함
		int extendedExNum=7-dayOfWeekNum < weekly_ex_num ? weekly_ex_num-(7-dayOfWeekNum) : 0;
		int weekCount=extendedExNum==0?4 : 5;//첫주가 부족하면 5주, 아니면 4주
		
		//필요한 운동들을 가져온다.
		WorkoutDataBean workoutDto=new WorkoutDataBean();
		//준비운동
		List<WorkoutDataBean> workout_start= workoutDao.getStartWorkout();	
		//본운동-유산소
		workoutDto.setWorkout_type("Burn");
		List<WorkoutDataBean> workout_Burn= workoutDao.getAutoScheWorkout(workoutDto);
		System.out.println("[scheMake]workout_Burn : "+workout_Burn.size());
		//본운동-전체
		workoutDto.setWorkout_type("Multi");
		List<WorkoutDataBean> workout_Multi=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_type("Pump");
		List<WorkoutDataBean> workout_Pump=
				workoutDao.getAutoScheWorkout(workoutDto);
		
		//본운동-무산소:상체
		workoutDto.setWorkout_type(null);
		workoutDto.setWorkout_part("CHEST");
		List<WorkoutDataBean> workout_CHEST=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_part("BACK");
		List<WorkoutDataBean> workout_BACK=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_part("CORE");
		List<WorkoutDataBean> workout_CORE=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_part("ARM");
		List<WorkoutDataBean> workout_ARM=
				workoutDao.getAutoScheWorkout(workoutDto);
		
		//본운동-무산소:하체
		workoutDto.setWorkout_part("BUTT");
		List<WorkoutDataBean> workout_BUTT=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_part("HIP");
		List<WorkoutDataBean> workout_HIP=
				workoutDao.getAutoScheWorkout(workoutDto);
		workoutDto.setWorkout_part("LEG");
		List<WorkoutDataBean> workout_LEG=
				workoutDao.getAutoScheWorkout(workoutDto);
		
		//마침운동
		List<WorkoutDataBean> workout_end= workoutDao.getEndWorkout();
		
		int sche_level=5;//일별 스케줄 난이도
		if(scheType==1){
			sche_level=5;//자동조절될난이도
		}else if(scheType==2){
			sche_level=7;//자동조절될난이도
		}else{
			sche_level=6;//자동조절될난이도
		}
		
		int pastpart=2;//저번운동부위 상하체
		for(int i=0;i<weekCount;i++){//4주
			//홀수 주, 짝수 주 
			int thisWeekDayNum=0;
			if(weekCount==5 && i==0){//추가 주, 첫번째주
				thisWeekDayNum= weekly_ex_num+1-extendedExNum;
			}else if(weekCount==5 && i==weekCount-1){//추가 주, 마지막주
				thisWeekDayNum= extendedExNum;
			}else{//나머지 주
				thisWeekDayNum= i%2==0? weekly_ex_num+1 : weekly_ex_num+2;
			}	
			
			/*일별 운동스케줄 운동타입 알고리즘
			 * 적응운동,향상,유지 :scheType=1,2,3
			 * 
			 * scheType==1 --살빼기위주    하
			 * scheType==2 --근육운동       상
			 * scheType==3 --근육,Multi 중
			 * 
			 * 운동목표=1,2,3 -> Burn,Multi,Pump배율
			 * 
			 * fatGrade=4~1, muscleBetter=true -> 근력운동 SET 횟수
			 * 
			 * weekly_ex_num=1,2,3,4 ->1-휴식일 아예없음,2-휴식일1일,3-휴식일-2일,4-휴식일-2일
			 */	
						
			for(int j=0;j<thisWeekDayNum;j++){//주별 일 스케줄생성
				continueSche=true;
				int scheNum=0;//현재 상세 스케줄 갯수
				
				int part=0;//0-ALL, 1-TOP, 2-BOTTOM
				if(j%2==0){//저번에 상체했으면 하체한다
					part=pastpart==2?1:2;
					pastpart=pastpart==2?1:2;
				}else{//격횟수로 전체운동함
					part=0;
				}
				int startWorkout_MAX=3;//불변
				int endWorkout_MAX=3;//불변
				
				int burnWorkout_MAX=3; //유산소 운동 갯수
				int multiWorkout_MAX=5; //복합 운동 갯수
				int pumpWorkout_MAX=5; //무산소 운동 갯수
				int partWorkout_MAX=part==0?0:6; //상하체 운동 갯수
				
				if(goal==3 && fatGrade>1){//몸좋고 상체하체 나눠서
					burnWorkout_MAX=3;
					//향상운동이거나 유지운동일때
					multiWorkout_MAX=scheType>1 ? 2 :7;
					pumpWorkout_MAX=scheType>1 ? 15 : 10;

				}else{//ALL, 하체위주
					pumpWorkout_MAX=5;
					//향상운동이거나 유지운동일때
					burnWorkout_MAX=scheType>1 ?3:6;
					multiWorkout_MAX=scheType>1 ?12:9;
				}

				//전체운동
				ArrayList<WorkoutDataBean> workout_Array=new ArrayList<WorkoutDataBean>();
				
				for(int a=0;a<startWorkout_MAX;a++){
					workout_Array.add(workout_start.get(getRandom(workout_start.size(), 0)));
				}
				for(int a=0;a<burnWorkout_MAX;a++){
					workout_Array.add(workout_Burn.get(getRandom(workout_Burn.size(), 0)));
				}
				for(int a=0;a<multiWorkout_MAX;a++){
					workout_Array.add(workout_Multi.get(getRandom(workout_Multi.size(), 0)));
				}
				for(int a=0;a<pumpWorkout_MAX;a++){
					workout_Array.add(workout_Pump.get(getRandom(workout_Pump.size(), 0)));
				}
				List<WorkoutDataBean> workout_Part;
				if(partWorkout_MAX!=0){
					if(part==1){//본운동-무산소:상체workout_CHEST;workout_BACK;workout_CORE;workout_ARM;
						workout_Part=workout_CHEST;
						workout_Part.addAll(workout_BACK);
						workout_Part.addAll(workout_CORE);
						workout_Part.addAll(workout_ARM);
					}else{//본운동-무산소:하체workout_BUTT;workout_HIP;workout_LEG;
						workout_Part=workout_BUTT;
						workout_Part.addAll(workout_HIP);
						workout_Part.addAll(workout_LEG);
					}
					for(int a=0;a<partWorkout_MAX;a++){
						workout_Array.add(workout_Part.get(getRandom(workout_Part.size()-1, 0)));
					}
				}
				for(int a=0;a<endWorkout_MAX;a++){
					workout_Array.add(workout_end.get(getRandom(workout_end.size()-1, 0)));
				}

				
				ScheduleListDataBean scheduleListDto=new ScheduleListDataBean();
				
				scheduleListDto.setSche_date(startday);
				scheduleListDto.setSpec_date(specDto.getSpec_date());
				scheduleListDto.setUser_id(user_id);
				scheduleListDto.setSche_level(sche_level);
				System.out.println("[insertList] ScheduleList date: "+scheduleListDto.getSche_date());
				insertResult=scheduleListDao.insertScheduleList(scheduleListDto);
				
				if(insertResult>0){//일 스케줄리스트 삽입 성공했으면
					while(continueSche){//상세스케줄
						//===============고정
						ScheduleDataBean scheduleDto=new ScheduleDataBean();
						scheduleDto.setSche_date(scheduleListDto.getSche_date());
						scheduleDto.setSpec_date(scheduleListDto.getSpec_date());
						scheduleDto.setUser_id(scheduleListDto.getUser_id());
						scheduleDto.setSche_num(scheNum);
						scheduleDto.setComplete(0);//당연히 수행안했지 + not null
						//===============고정
						
						WorkoutDataBean workTmp=workout_Array.get(scheNum);
						int set=30;
						int setNum=3;
						
						//운동 횟수!! 알고리즘
						String w_name=workTmp.getWorkout_name();
						if(workTmp.getWorkout_type().equals("Stretch")){
							//스트래칭 운동이면 시작할 때 1분 씩, 끝날 때 2분 씩
							if(w_name.indexOf("스트레") == -1 && w_name.indexOf("스트래")== -1){//시작하는 운동
								int w_sec = workTmp.getSec();
								set=60/w_sec;
								setNum=1;
							}else{//끝나는운동
								int w_sec = workTmp.getSec();
								set=120/w_sec;
								setNum=1;
							}
						}else{
							switch(workTmp.getGrade()){
							case "high": set=fatGrade+2;setNum=5; break;
							case "mid": set=fatGrade+2;setNum=1+fatGrade; break;
							case "low": set=fatGrade+4;setNum=2+fatGrade; break;
							}
						}
						
						scheduleDto.setSche_set(set);
						scheduleDto.setSet_num(setNum);
						scheduleDto.setWorkout_name(workTmp.getWorkout_name());
						
						insertResult=scheduleDao.insertSchedule(scheduleDto);
						
						scheNum++;//스케줄번호증가
						continueSche=scheNum<workout_Array.size()?true:false;
						if(insertResult<=0)break;
					}//end of while
				}//end of if(일별스케줄리스트 삽입성공했을때)
				
				if(insertResult>0){//test용 하루만 증가함
					cal.setTime(startday);
					dayOfWeekNum = cal.get(java.util.Calendar.DAY_OF_WEEK);//일요일1 : 토요일7
					int thisweekNeed = i%2==0?weekly_ex_num+1:weekly_ex_num+2;//이번주 수행해야하는 운동일수
					thisweekNeed= extendedExNum==0 ?thisweekNeed:extendedExNum;
					int thisweekSpend = thisWeekDayNum-j-1;//이번주 수행한 운동일수
					
					int nextDay;
					if(thisweekSpend>0&&thisweekSpend==7-dayOfWeekNum){//남은 일하고 필요한 일하고 같으면
						nextDay = 1;
					}else if(thisweekSpend>0){//아직 이번주 일 수가 안끝났으면
						nextDay = 2;
					}else{//이번주 일 수가 끝났으면, 다음주 월로 보낸다.
						nextDay = 7-dayOfWeekNum+2;
					}
					
					cal.add(Calendar.DATE, nextDay);
					//Calendar string:Sat Jul 01 
					//			00:00:00 KST 2017		
					SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
					String formatted = format1.format(cal.getTime());
					
					String addDayTmp= formatted + " 00:00:00.0";
					System.out.println("[insertList] add day on startday: "+addDayTmp);
					startday=Timestamp.valueOf(addDayTmp);
				}//end of if(adding day)	
			}//end of for j		
		}//end of for i
	}
	public void remakeSchedule(int level, int achieve){
		//난이도 상승 기준
		/* 기준: 성취도가 level-2 미만일경우 수정
		 * 날짜: 내일부터 마치는 날까지바꾸고
		 * 운동: 1,2- 운동을 바꿈 ,3- 스트래칭 제외! 운동횟수를 2회씩 늘린다.
		 */
		//난이도 하락 기준
		/* 기준: 성취도가 level+1 초과일경우 수정
		 * 날짜: 내일부터 마치는 날까지바꾸고
		 * 운동: 8- 스트래칭 제외! 운동횟수를 1회씩 줄인다. , 
		 * 		9- 운동자체를 아예 바꿈
		 */
		if(achieve>level+1){//넘어려웡 ㅠㅠㅠㅠ
			switch(achieve){
			case 8: System.out.println("[scheRemake] achieve : 8"); scheduleDao.updateReduceOne(user_id); break;
			case 9: System.out.println("[scheRemake] achieve : 9"); updateSchedule(false); break;
			}
		}else if(achieve<level-2){//넘쉽다 ... 이거뭐임 ....?
			switch(achieve){
			case 1: System.out.println("[scheRemake] achieve : 1");
			case 2: System.out.println("[scheRemake] achieve : 2"); updateSchedule(true); break;
			case 3: System.out.println("[scheRemake] achieve : 3"); scheduleDao.updateAddTwo(user_id); break;
			}
		}
	}
	public void updateSchedule(boolean isUpgrade){
		List<ScheduleListDataBean> scheListListTmp=scheduleListDao.getScheduleListListForRemake(user_id);
		List<WorkoutDataBean> workoutListForRemake=null;
		int result=0;
		for(int i=0;i<scheListListTmp.size();i++){
			ScheduleListDataBean scheduleListDto=scheListListTmp.get(i);
			List<ScheduleDataBean> scheForDay = scheduleDao.getScheduleList(scheduleListDto);
			for(int j=0;j<scheForDay.size();j++){
				ScheduleDataBean scheduleDto = scheForDay.get(j);
				String workout_name = scheduleDto.getWorkout_name();
				System.out.println("[scheRemake] workout_name : "+ workout_name);
				WorkoutDataBean workoutTmp2 = workoutDao.getWorkoutWithName(workout_name);
				WorkoutDataBean workoutTmp = new WorkoutDataBean();
				System.out.println("[scheRemake] workoutTmp2 workout_name : "+workoutTmp2.getWorkout_name());
				System.out.println("[scheRemake] workoutTmp2 grade : "+workoutTmp2.getGrade());
				if(isUpgrade && !workoutTmp2.getGrade().equals("high")){//난이도 높히구 운동이 최고난이도가 아니면
					if(workoutTmp2.getGrade().equals("mid")){
						workoutTmp.setGrade("high");
					}else{
						workoutTmp.setGrade("mid");
					}
					workoutListForRemake=workoutDao.getAutoScheWorkout(workoutTmp);
					System.out.println("[scheRemake] get ListForRemake SIZE:"+workoutListForRemake.size());
					if(workoutListForRemake.size() > 0){
						WorkoutDataBean workoutDtoForUpgrade = workoutListForRemake.get(getRandom(workoutListForRemake.size(), 0));
						System.out.println("[scheRemake] get Random HIGH grade workout : "+workoutDtoForUpgrade.getWorkout_name());
						scheduleDto.setWorkout_name(workoutDtoForUpgrade.getWorkout_name());
						if(scheduleDto.getSche_set() < 8 ){
							scheduleDto.setSche_set(scheduleDto.getSche_set()+1);
						}
					}else{
						scheduleDto.setSche_set(scheduleDto.getSche_set()+1);
					}
				}else if(isUpgrade && workoutTmp2.getGrade().equals("high")){//난이도를 높히구 운동이 최고난이도면
					scheduleDto.setSche_set(scheduleDto.getSche_set()+1);
				}else if(!isUpgrade && workoutTmp2.getGrade().equals("high")){//난이도 낮힐거고 운동이 난이도가 최고면
					workoutTmp.setGrade("mid");
					workoutListForRemake=workoutDao.getAutoScheWorkout(workoutTmp);
					System.out.println("[scheRemake] get ListForRemake SIZE:"+workoutListForRemake.size());
					if(workoutListForRemake.size()>0){
						WorkoutDataBean workoutDtoForUpgrade = workoutListForRemake.get(getRandom(workoutListForRemake.size(), 0));
						System.out.println("[scheRemake] get Random LOW grade workout : "+workoutDtoForUpgrade.getWorkout_name());
						scheduleDto.setWorkout_name(workoutDtoForUpgrade.getWorkout_name());
						if(scheduleDto.getSche_set() > 8 ){
							scheduleDto.setSche_set(scheduleDto.getSche_set()-2);
						}
					}else{
						scheduleDto.setSche_set(scheduleDto.getSche_set()-2);
					}
				}//end of if and else "high"?
				result=scheduleDao.updateScheOne(scheduleDto);
				System.out.println("[scheRemake] UPDATE and UPGRADE sche! result: "+result);
			}//end of for j	
		}//end for for i
	}//end of updateSchedule()
}//end of class

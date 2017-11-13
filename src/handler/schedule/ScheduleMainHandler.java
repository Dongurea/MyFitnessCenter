package handler.schedule;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import schedule.ScheduleDao;
import schedule.ScheduleDataBean;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;
import spec.SpecDao;
import spec.SpecDataBean;
import spec.SpecStringDataBean;
import workout.WorkoutDao;
import workout.WorkoutDataBean;

@Controller
public class ScheduleMainHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@Resource(name="specDao")
	SpecDao specDao;
	
	@Resource(name="workoutDao")
	WorkoutDao workoutDao;
	
	@RequestMapping( "/scheduleMain" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("memId");
		int result=scheduleListDao.check(user_id);
		String page=request.getParameter("page");
		String made=request.getParameter("made");
		String remake=request.getParameter("remake");
		
		System.out.println("[ScheduleMain] got result: "+result);
		System.out.println("[ScheduleMain] got page: "+page);
		System.out.println("[ScheduleMain] got made: "+made);
		
		if(page!=null){
			int pageInt=Integer.valueOf(page);
			if(pageInt>1){
				List<WorkoutDataBean> workouts=null;
				if(pageInt==2){//모든운동보기
					workouts=workoutDao.getAllWorkout();
				}else if(pageInt==3){//low
					workouts=workoutDao.getGradeWorkout("low");
				}else if(pageInt==4){//mid
					workouts=workoutDao.getGradeWorkout("mid");
				}else if(pageInt==5){//high
					workouts=workoutDao.getGradeWorkout("high");
				}
				request.setAttribute("workouts", workouts);
			}
		}
		//스캐줄이 없을때
		if(result<=0)request.setAttribute("result", "0");
		else{//스케줄이 있을때
			request.setAttribute("result", "1");
			//가장 최신 스펙,스케줄을 가져온다(스펙,스케줄DTO 보내기)
			SpecDataBean specLately = specDao.getLatelySpec(user_id);
			
		
			List<ScheduleListDataBean> scheListList=
					scheduleListDao.getScheduleListList(user_id);
			
			int maxScheListNum=scheListList.size();
			//int maxScheNum=5;
			HashMap<ScheduleListDataBean,List<ScheduleDataBean>> scheLists=
					new HashMap<ScheduleListDataBean,List<ScheduleDataBean>>();
			
			for(int i=0;i<maxScheListNum;i++){
				ScheduleListDataBean tmpScheList=scheListList.get(i);
				
				List<ScheduleDataBean> sche= 
						scheduleDao.getScheduleList(tmpScheList);
				scheLists.put(tmpScheList,sche);
			}
			int isExistAfterToday=scheduleListDao.checkIsExistAfterToday(user_id);
			if(isExistAfterToday==0){//오늘 이후로 진행될 스케줄이 없다면
				request.setAttribute("noMoreSche",0);
			}
			ScheduleListDataBean scheTodayTmp=scheduleListDao.getTodayScheduleList(user_id);
			if(scheTodayTmp !=null && scheTodayTmp.getAchieve()!=0){//수행 했으면
				request.setAttribute("todayDidSche",1);
			}
			
			Float fat=specLately.getFat();
			Float muscle=specLately.getMuscle();
			
			SpecStringDataBean specString=new
					SpecStringDataBean(specLately.getGender(),
							specLately.getAge(), specLately.getGoal(),
							specLately.getWeekly_ex_num(),
							specLately.getDate_lately(),specLately.getHeight(),
							specLately.getWeight(),
							fat, muscle);
			
			request.setAttribute("spec", specLately);
			request.setAttribute("specString", specString);
			request.setAttribute("schedule", scheLists);
			request.setAttribute("scheduleList", scheListList);
			
			if(made!=null){//스케줄을 바로 막 만들었을경우
				request.setAttribute("made", "1");
			}
			if(remake!=null){
				request.setAttribute("remake", "1");
			}
		}
		request.setAttribute("page", page);
		return new ModelAndView( "schedule/main" );
	}
}
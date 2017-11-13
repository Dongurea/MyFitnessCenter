package spec;

public class SpecStringDataBean {
	String gender;
	String age;
	String goal;
	String weekly_ex_num;
	String date_lately;
	String fat;
	String muscle;
	/*
	성별
	1: 남자, 2: 여자
	나이
	1: 10-20대, 2: 30대, 3: 40대, 4: 50대이상 
	운동목표
	1: 체중감량, 2: 밸런스웨이트, 3: 근육량증가
	주별운동횟수
	1: 2-3회, 2: 3-4회, 3: 4-5회, 4: 5-6회
	최근운동날짜
	1: 1주일안, 2: 1개월이상, 3: 3개월이상, 4: 6개월이상
	*/
	public SpecStringDataBean(){}
	public SpecStringDataBean(int gender,int age, int goal, int weekly_ex_num,
						int date_lately, int height, int weight,
						Float fat, Float muscle){
		if(gender==1) this.gender="남";
		else this.gender="여";
		
		if(age==1) this.age="10-20대";
		else if(age==2) this.age="30대";
		else if(age==3) this.age="40대";
		else if(age==4) this.age="50대이상";

		if(goal==1) this.goal="체중감량";
		else if(goal==2) this.goal="밸런스웨이트";
		else if(goal==3) this.goal="근육량증가";
		
		if(weekly_ex_num==1) this.weekly_ex_num="2-3회";
		else if(weekly_ex_num==2) this.weekly_ex_num="3-4회";
		else if(weekly_ex_num==3) this.weekly_ex_num="4-5회";
		else if(weekly_ex_num==4) this.weekly_ex_num="5-6회";
		
		if(date_lately==1) this.date_lately="1주일안";
		else if(date_lately==2) this.date_lately="1개월이상";
		else if(date_lately==3) this.date_lately="3개월이상";
		else if(date_lately==4) this.date_lately="6개월이상";
		
		if(fat!=0){
			if(weight/height==1){
				this.fat="높음";
				this.muscle="높음";
			}
		}
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getGoal() {
		return goal;
	}
	public void setGoal(String goal) {
		this.goal = goal;
	}
	public String getWeekly_ex_num() {
		return weekly_ex_num;
	}
	public void setWeekly_ex_num(String weekly_ex_num) {
		this.weekly_ex_num = weekly_ex_num;
	}
	public String getDate_lately() {
		return date_lately;
	}
	public void setDate_lately(String date_lately) {
		this.date_lately = date_lately;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public String getMuscle() {
		return muscle;
	}
	public void setMuscle(String muscle) {
		this.muscle = muscle;
	}
}

package workout;

public class WorkoutDataBean{
	String workout_name =null;
	String link=null;
	Integer sec=null;
	String grade=null;
	String workout_part=null;
	String workout_type=null;
	Integer routine_step=100;
	Integer fat_grade=100;
	Integer bmi_grade=100;
	
	public int getRoutine_step() {
		return routine_step;
	}
	public void setRoutine_step(int routine_step) {
		this.routine_step = routine_step;
	}
	public int getFat_grade() {
		return fat_grade;
	}
	public void setFat_grade(int fat_grade) {
		this.fat_grade = fat_grade;
	}
	public int getBmi_grade() {
		return bmi_grade;
	}
	public void setBmi_grade(int bmi_grade) {
		this.bmi_grade = bmi_grade;
	}
	public String getWorkout_name() {
		return workout_name;
	}
	public void setWorkout_name(String workout_name) {
		this.workout_name = workout_name;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getSec() {
		return sec;
	}
	public void setSec(int sec) {
		this.sec = sec;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getWorkout_part() {
		return workout_part;
	}
	public void setWorkout_part(String workout_part) {
		this.workout_part = workout_part;
	}
	public String getWorkout_type() {
		return workout_type;
	}
	public void setWorkout_type(String workout_type) {
		this.workout_type = workout_type;
	}
	
	
}

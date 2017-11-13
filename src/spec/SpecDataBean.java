package spec;

import java.sql.Timestamp;

public class SpecDataBean {
	Timestamp spec_date;
	int gender;
	int age;
	String user_id;
	int height;
	int weight;
	int goal;
	int weekly_ex_num;
	int date_lately;
	Float fat;
	Float muscle;
	public Timestamp getSpec_date() {
		return spec_date;
	}
	public void setSpec_date(Timestamp spec_date) {
		this.spec_date = spec_date;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public int getGoal() {
		return goal;
	}
	public void setGoal(int goal) {
		this.goal = goal;
	}
	public int getWeekly_ex_num() {
		return weekly_ex_num;
	}
	public void setWeekly_ex_num(int weekly_ex_num) {
		this.weekly_ex_num = weekly_ex_num;
	}
	public int getDate_lately() {
		return date_lately;
	}
	public void setDate_lately(int date_lately) {
		this.date_lately = date_lately;
	}
	public float getFat() {
		return fat;
	}
	public void setFat(float fat) {
		this.fat = fat;
	}
	public float getMuscle() {
		return muscle;
	}
	public void setMuscle(float muscle) {
		this.muscle = muscle;
	}
	
}

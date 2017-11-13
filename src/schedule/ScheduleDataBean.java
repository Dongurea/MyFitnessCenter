package schedule;

import java.sql.Timestamp;

public class ScheduleDataBean {
	Timestamp sche_date;//NOT NULL TIMESTAMP(6)
	Timestamp spec_date;//NOT NULL TIMESTAMP(6)
	String user_id;//NOT NULL VARCHAR2(20)
	int sche_num;//NOT NULL NUMBER
	String workout_name;//NOT NULL VARCHAR2(60)
	int sche_set;//NOT NULL NUMBER
	int set_num;//NOT NULL NUMBER
	int complete;       //number(1)
	String gadget_num;     //VARCHAR2(20)
	public Timestamp getSche_date() {
		return sche_date;
	}
	public void setSche_date(Timestamp sche_date) {
		this.sche_date = sche_date;
	}
	public Timestamp getSpec_date() {
		return spec_date;
	}
	public void setSpec_date(Timestamp spec_date) {
		this.spec_date = spec_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSche_num() {
		return sche_num;
	}
	public void setSche_num(int sche_num) {
		this.sche_num = sche_num;
	}
	public String getWorkout_name() {
		return workout_name;
	}
	public void setWorkout_name(String workout_name) {
		this.workout_name = workout_name;
	}
	public int getSche_set() {
		return sche_set;
	}
	public void setSche_set(int sche_set) {
		this.sche_set = sche_set;
	}
	public int getSet_num() {
		return set_num;
	}
	public void setSet_num(int set_num) {
		this.set_num = set_num;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public String getGadget_num() {
		return gadget_num;
	}
	public void setGadget_num(String gadget_num) {
		this.gadget_num = gadget_num;
	}
}

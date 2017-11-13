package schedulelist;

import java.sql.Timestamp;

public class ScheduleListDataBean {
	int walk;
	Timestamp sche_date;//NOT NULL
	int achieve;
	Timestamp spec_date;//NOT NULL
	String user_id;  //NOT NULL
	int sche_level;
	
	public int getSche_level() {
		return sche_level;
	}
	public void setSche_level(int sche_level) {
		this.sche_level = sche_level;
	}
	public int getWalk() {
		return walk;
	}
	public void setWalk(int walk) {
		this.walk = walk;
	}
	public Timestamp getSche_date() {
		return sche_date;
	}
	public void setSche_date(Timestamp sche_date) {
		this.sche_date = sche_date;
	}
	public int getAchieve() {
		return achieve;
	}
	public void setAchieve(int achieve) {
		this.achieve = achieve;
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
	
}

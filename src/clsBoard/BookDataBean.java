package clsBoard;

import java.util.Date;

public class BookDataBean {
	private int cla_list_num;
	private String user_id;
	private String classname;
	private Date month;
	public int getCla_list_num() {
		return cla_list_num;
	}
	public void setCla_list_num(int cla_list_num) {
		this.cla_list_num = cla_list_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public Date getMonth() {
		return month;
	}
	public void setMonth(Date month) {
		this.month = month;
	}
	
	
}

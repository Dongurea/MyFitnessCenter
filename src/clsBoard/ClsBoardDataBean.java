package clsBoard;

import java.sql.Date;

public class ClsBoardDataBean {
	private String classname;
	private String class_time;
	private String class_day;
	private String class_intro;
	private int tuition;
	private int max_stu;
	private int cur_stu;
	private String ins_name;
	private Date classdate;
	private String link;
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getClass_time() {
		return class_time;
	}
	public void setClass_time(String class_time) {
		this.class_time = class_time;
	}
	public String getClass_intro() {
		return class_intro;
	}
	public void setClass_intro(String class_intro) {
		this.class_intro = class_intro;
	}
	public int getTuition() {
		return tuition;
	}
	public void setTuition(int tuition) {
		this.tuition = tuition;
	}
	public int getMax_stu() {
		return max_stu;
	}
	public void setMax_stu(int max_stu) {
		this.max_stu = max_stu;
	}
	public int getCur_stu() {
		return cur_stu;
	}
	public void setCur_stu(int cur_stu) {
		this.cur_stu = cur_stu;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	public Date getClassdate() {
		return classdate;
	}
	public void setClassdate(Date classdate) {
		this.classdate = classdate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getClass_day() {
		return class_day;
	}
	public void setClass_day(String class_day) {
		this.class_day = class_day;
	}
	
}

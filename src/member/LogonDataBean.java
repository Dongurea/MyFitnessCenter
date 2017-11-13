package member;

import java.sql.Timestamp;

public class LogonDataBean {
	private String user_id;//*
	private String passwd;//*
	private String email;//*
	private String tel;//*
	private String expert;//*
	private int career;//*
	private Timestamp expire_date;
	private String alarm;//*
	private String gadget_num;
	private Timestamp reg_date;//*
	private String name;//*
	private String msgCheck;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getExpert() {
		return expert;
	}
	public void setExpert(String expert) {
		this.expert = expert;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public Timestamp getExpire_date() {
		return expire_date;
	}
	public void setExpire_date(Timestamp expiredate) {
		this.expire_date = expiredate;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getGadget_num() {
		return gadget_num;
	}
	public void setGadget_num(String gadget_num) {
		this.gadget_num = gadget_num;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMsgCheck() {
		return msgCheck;
	}
	public void setMsgCheck(String msgCheck) {
		this.msgCheck = msgCheck;
	}	
}

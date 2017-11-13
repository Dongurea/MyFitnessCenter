package chat;

import java.sql.Timestamp;

public class ChatDataBean {
	private int num;
	private String user_id;
	private String manager_id;
	private String text;
	private Timestamp texttime;
	private String fromtext;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Timestamp getTexttime() {
		return texttime;
	}
	public void setTexttime(Timestamp texttime) {
		this.texttime = texttime;
	}
	public String getFromtext() {
		return fromtext;
	}
	public void setFromtext(String fromtext) {
		this.fromtext = fromtext;
	}
	
	
}

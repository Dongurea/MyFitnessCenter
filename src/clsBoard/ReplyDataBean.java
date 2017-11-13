package clsBoard;

import java.util.Date;

public class ReplyDataBean {
	private int reply_num;
	private String classname;
	private String text;
	private String user_id;
	private Date classdate;
	public int getReply_num() {
		return reply_num;
	}
	public void setReply_num(int reply_num) {
		this.reply_num = reply_num;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getClassdate() {
		return classdate;
	}
	public void setClassdate(Date classdate) {
		this.classdate = classdate;
	}

}

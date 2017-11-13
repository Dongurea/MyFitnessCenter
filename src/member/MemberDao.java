package member;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	public int insertMember( LogonDataBean memberDto );
	public LogonDataBean getMember( String user_id );
	public int check( String user_id );
	public int check( String user_id, String passwd ); 
	public int deleteMember( String user_id );
	public int updateMember( LogonDataBean memberDto );
	public int alarmNum(String msg_check);
	public int restDay(Map<String,String> map);
	public int updateMsgCheck(Map<String,String> map);
	public List<LogonDataBean> alarmUsers(String msg_check);
	
	
	public List<String> updateMsgList(Map<String,String> map);
}

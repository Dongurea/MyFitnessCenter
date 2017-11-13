package member;


import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class LogonDBBean implements MemberDao {
	
	public int insertMember( LogonDataBean memberDto ) {			
		return SqlMapClient.getSqlSession().insert( "Member.insertMember", memberDto );
	}

	public LogonDataBean getMember( String user_id ) {
		return SqlMapClient.getSqlSession().selectOne( "Member.getMember", user_id );
	}
		
	public int check( String user_id ) {
		int result = 0;		
		int cnt = SqlMapClient.getSqlSession().selectOne( "Member.checkId", user_id );
		if( cnt > 0 ) {
			// 아이디가 있다
			result = 1;
		} else {
			// 아이디가 없다
			result = 0;
		}
		return result;
	}
		
	public int check( String user_id, String passwd){
		int result = 0;		
		if( check( user_id ) > 0  ) {
			// 아이디가 있다			
			LogonDataBean memberDto = getMember( user_id );
			if( memberDto.getPasswd().equals( passwd ) ){
				// 비밀번호가 같다
				result = 1;
			} else {
				// 비밀번호가 다르다
				result = -1;
			}
		} else {
			// 아이디가 없다.
			result = 0;
		}
		return result;
	}
	
	public int deleteMember( String user_id ) {			
		return SqlMapClient.getSqlSession().delete( "Member.deleteMember", user_id );
	}
	
	public int updateMember( LogonDataBean memberDto ) {
		return SqlMapClient.getSqlSession().update( "Member.updateMember", memberDto ); 
	}
	public int alarmNum(String msg_check) {
		return SqlMapClient.getSqlSession().selectOne( "Member.alarmNum", msg_check);
	}
	public int restDay(Map<String,String> map) {
		return SqlMapClient.getSqlSession().update( "Member.restDay", map);
	}
	public int updateMsgCheck(Map<String,String> map){
		return SqlMapClient.getSqlSession().update( "Member.updateMsgCheck", map ); 
		
	}
	public List<LogonDataBean> alarmUsers(String msg_check) {
		return SqlMapClient.getSqlSession().selectList( "Member.alarmUsers", msg_check);
	}
	public List<String> updateMsgList(Map<String,String> map){
		return SqlMapClient.getSqlSession().selectList( "Member.updateMsgList", map);
	}
	
		

} // class




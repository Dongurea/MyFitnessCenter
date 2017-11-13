package manager;


import db.SqlMapClient;

public class ManagerDBBean implements ManagerDao {
	public int check( String manager_id ) {
		int result = 0;		
		int cnt = SqlMapClient.getSqlSession().selectOne( "Manager.checkId", manager_id );
		if( cnt > 0 ) {
			// 아이디가 있다
			result = 1;
		} else {
			// 아이디가 없다
			result = 0;
		}
		return result;
	}
		
	public int check( String manager_id, String passwd){
		int result = 0;		
		if( check( manager_id ) > 0  ) {
			// 아이디가 있다			
			String passwdCheck=SqlMapClient.getSqlSession().selectOne( "Manager.getPasswd", manager_id );
			if( passwdCheck.equals( passwd ) ){
				// 비밀번호가 같다
				result = 1;
			} else {
				// 비밀번호가 다르다
				result = -1;
			}
		}
		
		return result;
	}
} // class




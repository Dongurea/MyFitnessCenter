package manager;

public interface ManagerDao {
	//public int insertMember( ManagerDataBean memberDto );
	public int check( String user_id );
	public int check( String user_id, String passwd ); 
	//public int deleteMember( String user_id );
	//public int updateMember( ManagerDataBean memberDto );
}

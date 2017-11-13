package spec;

import java.util.List;
import java.util.Map;

import db.SqlMapClient;

public class SpecDBBean implements SpecDao{

	public int insertSpec( SpecDataBean specDto ){
		return SqlMapClient.getSqlSession().insert( "Spec.insertSpec", specDto );
	}
	public int updateTodaySpec( SpecDataBean specDto ){
		return SqlMapClient.getSqlSession().update( "Spec.updateTodaySpec", specDto );
	}
	public SpecDataBean getLatelySpec( String user_id ){
		return SqlMapClient.getSqlSession().selectOne( "Spec.getLatelySpec", user_id);
	}
	@Override
	public int checkTodaySpec(String user_id) {
		return SqlMapClient.getSqlSession().selectOne( "Spec.checkTodaySpec", user_id);
	}
	public int checkSpecExist(String user_id) {
		return SqlMapClient.getSqlSession().selectOne( "Spec.checkSpecExist", user_id);
	}
	//public SpecDataBean getSpec( String user_id ){};
	public int deleteSpec( String user_id ){
		return SqlMapClient.getSqlSession().delete( "Spec.deleteSpec", user_id );
	};
	//public int updateSpec( SpecDataBean specDto ){};
	
	public List<UsersSetDataBean> getUsersSpec(Map<String, Integer> map  ){
		return SqlMapClient.getSqlSession().selectList( "Spec.getUsersSpec", map );
	}
	public UsersSetDataBean getUserSpec(String user_id){
		return SqlMapClient.getSqlSession().selectOne( "Spec.getUserSpec", user_id);	
	}

	public int getCount(){
		return SqlMapClient.getSqlSession().selectOne( "Spec.getCount" );	
	}
	public int updateUserSpec( UsersSetDataBean userSpec ){
		return SqlMapClient.getSqlSession().update("Spec.updateUserSpec", userSpec);
		
	}
	public SpecDataBean selectUserSpec(String user_id ){
		return SqlMapClient.getSqlSession().selectOne("Spec.selectUserSpec", user_id);
		
	}
	
	public int insertUserSpec(UsersSetDataBean userSpec ){
		return SqlMapClient.getSqlSession().insert("Spec.insertUserSpec", userSpec);
	}
	public int addMonth(Map<String, String> map  ){
		return SqlMapClient.getSqlSession().update( "Spec.addMonth", map );
	}
	public int cancelMem(String user_id  ){
		return SqlMapClient.getSqlSession().update( "Spec.cancelMem",user_id );
	}

	public int signMem(String user_id  ){
		return SqlMapClient.getSqlSession().update( "Spec.signMem", user_id );
	}

	
	public List<UsersSetDataBean> UserSearch(String name){
		return SqlMapClient.getSqlSession().selectList( "Spec.UserSearch", name);
	}
	
	@Override
	public List<SpecDataBean> getAllSpec(String user_id) {
		return SqlMapClient.getSqlSession().selectList( "Spec.getAllSpec", user_id);
	}
}

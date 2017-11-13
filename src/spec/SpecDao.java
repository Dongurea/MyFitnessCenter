package spec;

import java.util.List;
import java.util.Map;

public interface SpecDao {
	public int insertSpec( SpecDataBean specDto );
	public int updateTodaySpec( SpecDataBean specDto );
	public SpecDataBean getLatelySpec( String user_id );
	public int checkTodaySpec( String user_id );
	public int checkSpecExist(String user_id);
	public List<SpecDataBean> getAllSpec(String user_id);
	
	public int deleteSpec( String user_id );
	public List<UsersSetDataBean> getUsersSpec( Map<String, Integer> map   );
	
	public UsersSetDataBean getUserSpec(String user_id);
	public int updateUserSpec( UsersSetDataBean userSpec );
	public SpecDataBean selectUserSpec( String user_id );
	
	public int insertUserSpec(UsersSetDataBean userSpec);
	
	public int getCount();
	public int addMonth(Map<String, String> map  );
	public int signMem(String user_id  );
	public int cancelMem(String user_id  );
	public List<UsersSetDataBean> UserSearch(String name);

}

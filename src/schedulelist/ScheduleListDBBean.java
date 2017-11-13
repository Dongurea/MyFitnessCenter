package schedulelist;

import java.util.List;

import db.SqlMapClient;

public class ScheduleListDBBean implements ScheduleListDao{


	@Override
	public int insertScheduleList(ScheduleListDataBean scheduleListDto) {
		return SqlMapClient.getSqlSession().insert( "ScheduleList.insertScheduleList", scheduleListDto );
	}

	@Override
	public int check(String user_id) {
		return SqlMapClient.getSqlSession().selectOne( "ScheduleList.check", user_id );
	}

	@Override
	public List<ScheduleListDataBean> getScheduleListList(String user_id) {
		return SqlMapClient.getSqlSession().selectList( "ScheduleList.getScheduleListList", user_id);
	}
	
	@Override
	public List<ScheduleListDataBean> weekScheList(ScheduleListDataBean scheduleListDto) {
		return SqlMapClient.getSqlSession().selectList( "ScheduleList.weekScheList", scheduleListDto );
	}

	@Override
	public int deleteScheList(ScheduleListDataBean scheduleListDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete( "ScheduleList.deleteScheList", scheduleListDto );
	}

	@Override
	public int checkOneScheduleList(ScheduleListDataBean scheduleListDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne( "ScheduleList.checkOneScheduleList", scheduleListDto );
	}

	@Override
	public ScheduleListDataBean getOneScheduleList(ScheduleListDataBean scheduleListDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne( "ScheduleList.getOneScheduleList", scheduleListDto );
	}

	@Override
	public int updateAchieve(ScheduleListDataBean scheduleListDto) {
		return SqlMapClient.getSqlSession().update( "ScheduleList.updateAchieve", scheduleListDto );
	}

	@Override
	public int checkIsExistAfterToday(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne( "ScheduleList.checkIsExistAfterToday", user_id );
	}

	@Override
	public int deleteScheListAll(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete( "ScheduleList.deleteScheListAll", user_id );
	}

	@Override
	public ScheduleListDataBean getTodayScheduleList(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectOne( "ScheduleList.getTodayScheduleList", user_id );
	}

	@Override
	public List<ScheduleListDataBean> getScheduleListListForRemake(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "ScheduleList.getScheduleListListForRemake", user_id);
	}


}

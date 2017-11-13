package schedule;

import java.sql.Timestamp;
import java.util.List;

import db.SqlMapClient;
import schedulelist.ScheduleListDataBean;

public class ScheduleDBBean implements ScheduleDao{
	public int insertSchedule( ScheduleDataBean scheduleDto ){
		return SqlMapClient.getSqlSession().insert( "Schedule.insertSchedule", scheduleDto );
	}

	@Override
	public List<ScheduleDataBean> getScheduleList(ScheduleListDataBean scheduleListDto) {
		return SqlMapClient.getSqlSession().selectList( "Schedule.getScheduleList", scheduleListDto );
	}

	@Override
	public List<ScheduleDataBean> todayScheList(String user_id) {
		return SqlMapClient.getSqlSession().selectList( "Schedule.todayScheList", user_id );
	}

	@Override
	public int dayScheCompleteOrNot(ScheduleDataBean scheduleDto) {
		return SqlMapClient.getSqlSession().selectOne( "Schedule.dayScheCompleteOrNot", scheduleDto );
	}

	@Override
	public int deleteSche(ScheduleDataBean scheduleDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete( "Schedule.deleteSche", scheduleDto );
	}

	@Override
	public int updateComplete(ScheduleDataBean scheduleDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update( "Schedule.updateComplete", scheduleDto );
	}

	@Override
	public List<ScheduleAndWorkoutDataBean> getWorkoutTypeComplete(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().selectList( "Schedule.getWorkoutTypeComplete", user_id );
	}

	@Override
	public int deleteScheAll(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().delete( "Schedule.deleteScheAll", user_id );
	}

	@Override
	public int updateReduceOne(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update( "Schedule.updateReduceOne", user_id );
	}

	@Override
	public int updateAddTwo(String user_id) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update( "Schedule.updateAddTwo", user_id );
	}

	@Override
	public int updateScheOne(ScheduleDataBean scheduleDto) {
		// TODO Auto-generated method stub
		return SqlMapClient.getSqlSession().update( "Schedule.updateScheOne", scheduleDto );
	}
}

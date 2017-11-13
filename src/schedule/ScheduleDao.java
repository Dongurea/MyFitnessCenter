package schedule;

import java.sql.Timestamp;
import java.util.List;

import schedulelist.ScheduleListDataBean;

public interface ScheduleDao {
	public int insertSchedule( ScheduleDataBean scheduleDto );
	public List<ScheduleDataBean> getScheduleList( ScheduleListDataBean scheduleListDto);
	public List<ScheduleDataBean> todayScheList( String user_id);
	public int dayScheCompleteOrNot( ScheduleDataBean scheduleDto);
	public int deleteSche(ScheduleDataBean scheduleDto);
	public int deleteScheAll(String user_id);
	public int updateScheOne(ScheduleDataBean scheduleDto);
	public int updateComplete(ScheduleDataBean scheduleDto);
	public int updateReduceOne(String user_id);
	public int updateAddTwo(String user_id);
	public List<ScheduleAndWorkoutDataBean> getWorkoutTypeComplete (String user_id);
}

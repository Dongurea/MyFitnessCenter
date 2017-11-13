package schedulelist;

import java.util.List;

public interface ScheduleListDao {
	public int insertScheduleList( ScheduleListDataBean scheduleListDto );
	public int check(String user_id);
	public int checkOneScheduleList(ScheduleListDataBean scheduleListDto);
	public int checkIsExistAfterToday(String user_id);
	public ScheduleListDataBean getOneScheduleList(ScheduleListDataBean scheduleListDto);
	public ScheduleListDataBean getTodayScheduleList(String user_id);
	public List<ScheduleListDataBean> getScheduleListList( String user_id );
	public List<ScheduleListDataBean> getScheduleListListForRemake( String user_id );
	public List<ScheduleListDataBean> weekScheList( ScheduleListDataBean scheduleListDto );
	public int deleteScheList( ScheduleListDataBean scheduleListDto );
	public int deleteScheListAll( String user_id );
	public int updateAchieve( ScheduleListDataBean scheduleListDto );

}

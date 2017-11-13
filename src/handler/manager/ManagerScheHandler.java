package handler.manager;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import member.MemberDao;
import schedule.ScheduleDao;
import schedule.ScheduleDataBean;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;
import spec.SpecDao;
import workout.WorkoutDao;
import workout.WorkoutDataBean;

@Controller
public class ManagerScheHandler implements CommandHandler{
	@Resource(name="memberDao")
	MemberDao memberDao;
	
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@Resource(name="workoutDao")
	WorkoutDao workoutDao;
	
	@RequestMapping( "/managerSche" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//관리자- 스케줄 수정
		//전체 보여주기 애바... -
		//처음부터 끝까지 보여주고
		//오늘부터 보여줌<오늘,내일,모레>
		//처음,다음,그다음>
		String user_id=request.getParameter("user_id");
		
		List<ScheduleListDataBean> scheListList = 
				scheduleListDao.getScheduleListList( user_id );
		if(scheListList!=null){//회원에게 스케줄목록이 있으면
			//스케줄당 상세스케줄을 가져온다
			HashMap<Timestamp,List<ScheduleDataBean>> scheList=
					new HashMap<Timestamp,List<ScheduleDataBean>>();
			
			for(int i=0;i<scheListList.size();i++){
				ScheduleListDataBean scheListTmp=scheListList.get(i);
				List<ScheduleDataBean> scheTmp=
						scheduleDao.getScheduleList(scheListTmp);
				
				scheList.put(scheListTmp.getSche_date(), scheTmp);
			}
			//scheList:스케줄리스트 sche_date별 상세스케줄
			//scheListList:회원의 전체 스케줄리스트
			request.setAttribute("scheList", scheList);
			request.setAttribute("scheListList", scheListList);
			
		}//end of scheListList is not null	
		List<WorkoutDataBean> workoutList= workoutDao.getAllWorkout();
		request.setAttribute("workoutList",workoutList);
		System.out.println("[ManagerSche] got workoutList : "+workoutList);
		
		//request.setAttribute("workoutAll", );
		request.setAttribute("user_id", user_id);
		return new ModelAndView("manager/managerSche");
	}
}

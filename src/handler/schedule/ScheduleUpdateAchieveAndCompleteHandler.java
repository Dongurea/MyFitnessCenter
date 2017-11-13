package handler.schedule;

import java.sql.Timestamp;
import java.util.Calendar;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import schedule.ScheduleDao;
import schedule.ScheduleDataBean;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;

@Controller
public class ScheduleUpdateAchieveAndCompleteHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/updateAchieveAndComplete" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		//complete -> 수행한 운동갯수
		//유저아이디
		String comp=request.getParameter("complete");
		int achieve=Integer.valueOf(request.getParameter("achieve"));
		String user_id=(String)request.getSession().getAttribute("memId");
		
		Calendar cal=Calendar.getInstance();
		String today=cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH)+1)+"-"+cal.get(Calendar.DATE)+" 00:00:00.0";
		Timestamp sche_date=Timestamp.valueOf(today);
		
		int complete=Integer.valueOf(comp);
		ScheduleDataBean scheduleDto=new ScheduleDataBean();
		ScheduleListDataBean scheduleListDto=new ScheduleListDataBean();
		
		System.out.println("[updateAchieve] got complete : "+complete);
		System.out.println("[updateAchieve] got user : "+user_id);
		System.out.println("[updateAchieve] got achieve : "+achieve);
		
		scheduleListDto.setUser_id(user_id);
		scheduleDto.setUser_id(user_id);
		scheduleListDto.setSche_date(sche_date);
		scheduleDto.setSche_date(sche_date);
		
		int result=0;
		for(int i=0;i<complete;i++){
			scheduleDto.setSche_num(i);
			result=scheduleDao.updateComplete(scheduleDto);
		}
		if(result>0){
			
			scheduleListDto.setAchieve(achieve);
			result=scheduleListDao.updateAchieve(scheduleListDto);
			if(result<1) result=-1;
			else{//성취도까지 업데이트 다 됬으면, 성취도를 하루 성취도 체크를 해서
				//크거나 작으면 리메이크 해야함.
				ScheduleListDataBean scheToday=scheduleListDao.getTodayScheduleList(user_id);
				int level=scheToday.getSche_level();
				System.out.println("[scheUpdate] REMAKE check! :"+level);
				if(achieve > level+1 || achieve < level-2){
					//성취도가 난이도+1보다 높거나, 성취도가 난이도-2보다 낮으면 조정
					int remake=1;
					request.setAttribute("remake", remake);
					request.setAttribute("today_achieve", achieve);
					request.setAttribute("today_level", level);
				}
			}
		}
		request.setAttribute("result", result);
		return new ModelAndView("schedule/updateAchieveAndComplete");
	}

}

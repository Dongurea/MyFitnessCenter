package handler.schedule;

import java.sql.Timestamp;

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
public class ScheduleDeleteScheProHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/deleteSchePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=request.getParameter("user_id");
		Timestamp sche_date=Timestamp.valueOf(request.getParameter("sche_date"));
		ScheduleDataBean scheduleDto=new ScheduleDataBean();
		ScheduleListDataBean scheduleListDto=new ScheduleListDataBean();
		scheduleDto.setUser_id(user_id);
		scheduleListDto.setUser_id(user_id);
		scheduleDto.setSche_date(sche_date);
		scheduleListDto.setSche_date(sche_date);
		
		int result =scheduleDao.deleteSche(scheduleDto);
		if(result>0){
			result =scheduleListDao.deleteScheList(scheduleListDto);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("user_id", user_id);
		return new ModelAndView("schedule/deleteSchePro");
	}
}

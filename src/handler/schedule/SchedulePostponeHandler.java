package handler.schedule;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import schedule.ScheduleDao;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;

@Controller
public class SchedulePostponeHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/schedulePostpone" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String past=request.getParameter("past");//mypage,
		String val=request.getParameter("val");//1하루,2일주일,3한달
		String user_id=request.getParameter("user_id");
		
		if(val!=null && past!=null){
			int valInt=Integer.parseInt(val);
			ScheduleListDataBean scheduleListDto=new ScheduleListDataBean();
			if(valInt==1){//하루
				Calendar c=Calendar.getInstance();
				Timestamp sche_date=Timestamp.valueOf(//오늘
						c.get(Calendar.YEAR)+"-"+(c.get(Calendar.MONTH)+1)+"-"+
						c.get(Calendar.DATE)+" 00:00:00.0");

			}else if(valInt==2){//일주일
				
			}else if(valInt==3){//한달
				
			}
		}
		return new ModelAndView("schedule/schedulePostpone");
	}
}

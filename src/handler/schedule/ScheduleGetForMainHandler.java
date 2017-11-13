package handler.schedule;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
@Controller
public class ScheduleGetForMainHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/scheduleGetForMain" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("memId");
		//오늘스케줄, 목록으로 보내고
		//없으면 다른 운동들을 살펴볼까용 ? 꺄룩
		List<ScheduleDataBean> sche = 
				scheduleDao.todayScheList(user_id);
		System.out.println("[ScheGetForMain] today sche : "+sche);
		Date date=new Date();
		SimpleDateFormat format= new SimpleDateFormat ( "yyyy-MM-dd");
		String today=format.format(date)+" 00:00:00";
		System.out.println("[ScheGetForMain] got today : "+today);
		Timestamp sche_date=Timestamp.valueOf(today);
		ScheduleDataBean scheduleDto=new ScheduleDataBean();
		scheduleDto.setSche_date(sche_date);
		scheduleDto.setUser_id(user_id);
		//1이면 아직 미수행 0이면 수행
		int result=scheduleDao.dayScheCompleteOrNot(scheduleDto);
		if(result>0){
			request.setAttribute("result", result);
			request.setAttribute("schedules", sche);
			request.setAttribute("user_id", user_id);
		}

		return new ModelAndView( "schedule/scheduleGetForMain" );
	}
}

package handler.schedule;

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
import spec.SpecDao;
import spec.SpecDataBean;

@Controller
public class ScheduleInsertSpecHandler implements CommandHandler{
	@Resource(name="specDao")
	SpecDao specDao;
	
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/scheduleInsertSpec" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=(String)request.getSession().getAttribute("memId");
		String onlyspec=request.getParameter("onlyspec");
		String noMoreSche=request.getParameter("noMoreSche");
		if(onlyspec!=null && onlyspec.equals("1")){
			/*스펙과 스케줄
			 * 1.스펙이 없고 스케줄이 없을때: 스펙입력받고 바로 스케줄생성
			 * 2.스펙이 있고 스케줄이 없을때: 스펙입력받기만 가능
			 * 3.스펙이있고 스케줄이 있을때: 스펙만 입력받기
			 * */							
			request.setAttribute("onlyspec", "1");
		}else if(noMoreSche!=null&&noMoreSche.equals("0")){//스케줄이 모두 끝나서 새로생성해야하는거
			//기존 스케줄 다지우기
			scheduleDao.deleteScheAll(user_id);
			scheduleListDao.deleteScheListAll(user_id);
			System.out.println("[insertSpec] remove All Sche user_id = "+user_id);
		}
		int result=specDao.checkSpecExist(user_id);
				
		//스펙있으면 1, 없으면 0
		if(result>0){
			SpecDataBean specDto=specDao.getLatelySpec( user_id );
			request.setAttribute("latelyspec",specDto);
			request.setAttribute("result", "1");
			
		}else request.setAttribute("result", "0");
	
		return new ModelAndView( "schedule/insertSpec" );
	}
}

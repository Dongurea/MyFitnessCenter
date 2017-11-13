package handler.schedule;

import java.sql.Timestamp;
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
import schedulelist.ScheduleListDataBean;
import spec.SpecDataBean;

@Controller
public class ScheduleInsertNewScheHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/insertNewSche" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String user_id=request.getParameter("user_id");
		String workout_name=request.getParameter("workout_name");
		String sche_dateString=request.getParameter("sche_date");
		String sche_set=request.getParameter("sche_set");
		String set_num=request.getParameter("set_num");
		
		
		Timestamp sche_date=Timestamp.valueOf(sche_dateString+" 00:00:00.0");
		
		ScheduleListDataBean scheduleListDto= new ScheduleListDataBean();
		ScheduleDataBean scheduleDto=new ScheduleDataBean();
		//회원스펙이 없으면 못넣게 막아야함
		//스펙이 있을때 ,회원스케줄이 하나도없으면 스케줄에 최근스펙을 넣고
		//스펙이 있을때 , 회원스케줄이 하나라도 있으면 다른스케줄 스펙을 넣음
	    List<ScheduleListDataBean> scheListList=scheduleListDao.getScheduleListList(user_id);
		List<ScheduleDataBean> scheList;
		scheduleListDto.setUser_id(user_id);
		scheduleListDto.setSche_date(sche_date);
		//회원스케줄이 하나라도 있으면 다른스케줄 스펙을 넣음
		scheduleListDto.setSpec_date(scheListList.get(0).getSpec_date());
		
		//스케줄 추가결과
		int result=0;
		//스케줄리스트가 해당날짜에 없으면 만들고
		int isExist=scheduleListDao.checkOneScheduleList(scheduleListDto);
		if(isExist>0){//해당날짜스케줄있음
			scheduleListDto=scheduleListDao.getOneScheduleList(scheduleListDto);
			scheList=scheduleDao.getScheduleList(scheduleListDto);
			scheduleDto.setSche_num(scheList.size());
			result=1;
		}else{//해당날짜스케줄없음
			scheduleListDto.setSche_level(6);
			result=scheduleListDao.insertScheduleList(scheduleListDto);
			scheduleDto.setSche_num(0);
		}
		if(result>0){
			scheduleDto.setUser_id(user_id);
			scheduleDto.setSche_date(scheduleListDto.getSche_date());
			scheduleDto.setSpec_date(scheduleListDto.getSpec_date());
			scheduleDto.setWorkout_name(workout_name);

			scheduleDto.setComplete(0);//not null
			scheduleDto.setSche_set(Integer.valueOf(sche_set));//test
			scheduleDto.setSet_num(Integer.valueOf(set_num));//test
			
			result=scheduleDao.insertSchedule(scheduleDto);
			if(result<1)result=-1;
		}
		request.setAttribute("result",result);
		request.setAttribute("user_id", user_id);
		return new ModelAndView("schedule/insertNewSche");
	}
}

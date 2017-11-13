package handler.schedule;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import schedulelist.ScheduleListDao;
import spec.SpecDao;
import spec.SpecDataBean;

@Controller
public class ScheduleInsertSpecProHandler implements CommandHandler{
	@Resource(name="specDao")
	private SpecDao specDao;
	@Resource(name="scheduleListDao")
	private ScheduleListDao scheduleListDao;
	
	@RequestMapping( "/scheduleInsertSpecPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		/*
		 스케줄을 처리하는 클래스에서 스케줄을 처리함(스케줄DB입력)
		 */
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String user_id=(String)request.getSession().getAttribute("memId");
		String startdayExist=request.getParameter("startday");
		Boolean startdayIsNotNull=false;
		Timestamp startday=null;
		//startday가 없으면 스펙이 이미있고 업데이트하는과정
		if(startdayExist!=null&&!startdayExist.equals("")) startdayIsNotNull=true;
		if(startdayIsNotNull){
			startday=Timestamp.valueOf(startdayExist+" 00:00:00");
			System.out.println("[insertSpecPro] got startday : "+startday);
			request.setAttribute("startday", String.valueOf(startday));
		}
		
		SpecDataBean specDto=new SpecDataBean();
		specDto.setAge(Integer.parseInt(request.getParameter("age")));
		specDto.setWeekly_ex_num(Integer.parseInt(request.getParameter("weekly_ex_num")));
		specDto.setDate_lately(Integer.parseInt(request.getParameter("date_lately")));
		specDto.setGender(Integer.parseInt(request.getParameter("gender")));
		specDto.setGoal(Integer.parseInt(request.getParameter("goal")));
		specDto.setHeight(Integer.parseInt(request.getParameter("height")));
		specDto.setWeight(Integer.parseInt(request.getParameter("weight")));
		specDto.setSpec_date(new Timestamp( System.currentTimeMillis() ));
		specDto.setUser_id((String)request.getSession().getAttribute("memId"));
		//지방률이 있음 근육량도 있다.
		if(request.getParameter("fat")!=null){
			specDto.setFat(Float.parseFloat(request.getParameter("fat")));
			specDto.setMuscle(Float.parseFloat(request.getParameter("muscle")));
		}
		int result=0;
		if(startdayIsNotNull){
			int todaySpecExist=specDao.checkTodaySpec(user_id);//오늘자스펙이있으면
			if(todaySpecExist>0){//있으면 업데이트한다.
				result=specDao.updateTodaySpec(specDto);
				System.out.println("[insertSpecPro] update Today spec!");
			}else{
				result=specDao.insertSpec(specDto);
				System.out.println("[insertSpecPro] insert New spec!");
			}
		}else{
			result=specDao.insertSpec(specDto);
			System.out.println("[insertSpecPro] insert New spec!");
		}

		if(result>0) {
			request.setAttribute("result", "1");
			if(startdayIsNotNull){
			}else{
				request.setAttribute("onlyspec", 1);
			}
		}
		return new ModelAndView( "schedule/insertSpecPro" );
	}
}
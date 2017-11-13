package handler.schedule;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
import spec.SpecDao;
import spec.SpecDataBean;
import workout.WorkoutDao;

@Controller
public class ScheduleInsertListHandler implements CommandHandler{
	@Resource(name="specDao")
	SpecDao specDao;
	
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@Resource(name="workoutDao")
	WorkoutDao workoutDao;
	
	@RequestMapping( "/scheduleInsertList" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		/*
		스케줄 리스트 날짜에 맞게 넣고,
		-->알고리즘값에 맞게 스케줄 상세 만듬.
		 LIST_NUM                                  NOT NULL NUMBER
		 WALK                                               NUMBER
		 SCHE_DATE                                 NOT NULL TIMESTAMP(6)
		 ACHIEVE                                            NUMBER
		 SPEC_DATE                                 NOT NULL TIMESTAMP(6)
		 USER_ID                                   NOT NULL VARCHAR2(20)
		*/
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String user_id=(String)request.getSession().getAttribute("memId");
		String startdayTmp=request.getParameter("startday");
		Timestamp startday=startdayTmp!=null ? Timestamp.valueOf(startdayTmp) : null;
		String remake=request.getParameter("remake");
		SpecDataBean specDto=specDao.getLatelySpec(user_id);
		ScheduleMake scheMake;
		
		System.out.println("[insertList] got startday : "+startdayTmp);
		
		scheMake=new ScheduleMake(specDto.getWeight(), specDto.getHeight(), specDto.getMuscle(), specDto.getFat(), specDto.getAge(), specDto.getGender(), specDto.getDate_lately(), specDto.getWeekly_ex_num(), specDto.getGoal(), startday, user_id
				,scheduleListDao,scheduleDao,specDao,workoutDao);
		
		if(remake!=null){
			System.out.println("[insertList] start remake schedules!! value : "+remake);
			int today_achieve=Integer.valueOf(request.getParameter("today_achieve"));
			int today_level=Integer.valueOf(request.getParameter("today_level"));
			System.out.println("[insertList] got today_achieve : "+today_achieve);
			System.out.println("[insertList] got today_level : "+today_level);
			
			//startday is null !! 스케줄 난이도를 재 조정합니다.
			scheMake.remakeSchedule(today_level, today_achieve);
			request.setAttribute("result", 1);
			request.setAttribute("remake", 1);
		}else{	
			System.out.println("[InsertSche] making SpecData... ");
			scheMake.makeBMI();
			scheMake.makeFatPercent();
			scheMake.checkFatPercentOnAgeChart();
			scheMake.makeMuscleAverage();
			scheMake.checkMuscleHigherAverage();
			System.out.println("[InsertSche] be about to make Schedules... ");
			try{
				scheMake.makeSchedule();
				request.setAttribute("result", 1);
			}catch(Exception e){
				request.setAttribute("result", 0);
			}
		}
		
		return new ModelAndView( "schedule/insertList" );
	}//end of process();
}//end of class

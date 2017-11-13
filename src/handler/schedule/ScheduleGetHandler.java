package handler.schedule;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
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

@Controller
public class ScheduleGetHandler implements CommandHandler{
	@Resource(name="scheduleListDao")
	ScheduleListDao scheduleListDao;
	
	@Resource(name="scheduleDao")
	ScheduleDao scheduleDao;
	
	@RequestMapping( "/scheduleGet" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int page=Integer.parseInt(request.getParameter("page"));
		String allPage=request.getParameter("all");
		int all=1;
		if(page==2&&allPage!=null){
			all=Integer.parseInt( allPage );
			System.out.println("[ScheGet] got allPge : "+all);
		}
		String user_id=request.getParameter("user_id");
		
		System.out.println("[ScheGet] got page : "+page);
		System.out.println("[ScheGet] got user_id : "+user_id);
		
		int result=scheduleListDao.check(user_id);
		if(result>0){//스케줄이 있을때
			if(page==0){//today		
				
				List<ScheduleDataBean> sche = 
						scheduleDao.todayScheList(user_id);
				System.out.println("[ScheGet] today sche : "+sche);
				if(sche.size()!=0){
					request.setAttribute("schedules", sche);
					System.out.println("send!");
				}
			
				
			}else if(page==1){//weekly
				Calendar c = Calendar.getInstance(); 
				int year=c.get(Calendar.YEAR);
				int month=c.get(Calendar.MONTH)+1;
				int day=c.get(Calendar.DAY_OF_MONTH);
				ScheduleListDataBean scheListDto=new ScheduleListDataBean();
				scheListDto.setUser_id(user_id);
				scheListDto.setSche_date(Timestamp.valueOf(
							year+"-"+month+"-"+day+" 00:00:00.0"
						));
				//날짜추가가능성
				List<ScheduleListDataBean> scheList = 
						scheduleListDao.weekScheList(scheListDto);
				System.out.println("[ScheGet] week sche : "+scheList);
				if(scheList.size()!=0){
					request.setAttribute("schedules", scheList);
					
				}
				

			}else if(page==2){//all
				int allMax=7;
				int allStart=(all-1)*allMax;
				int allEnd=(all-1)*allMax+allMax;
				List<ScheduleListDataBean> scheListAll = 
						scheduleListDao.getScheduleListList( user_id );
				
				if(scheListAll!=null){
					List<ScheduleListDataBean> scheList=
							new ArrayList<ScheduleListDataBean>();
					
					int totalPage=scheListAll.size()/allMax;
					
					if(scheListAll.size()%allMax>0){//7보다 개체가 적은 페이지가 있으면
						totalPage+=1;
						if(all==totalPage){//그게 지금페이지면
							allEnd=allStart+(scheListAll.size()%allMax);
						}
					}
					
					for(int i=allStart;i<allEnd;i++){
						scheList.add(scheListAll.get(i));
					}
					System.out.println("[ScheGet] got sche : "+scheList);
					if(scheList.size()!=0){
						request.setAttribute("schedules", scheList);
						
					}
					
					request.setAttribute("allThisPage", all);
					request.setAttribute("totalPage", totalPage);
				}//end of scheAll is not null				
			}//end of page==2
		}//end of result>0
		
		request.setAttribute("page", page);
		request.setAttribute("user_id", user_id);

		return new ModelAndView( "schedule/scheduleGet" );
	}
}


/*
 today: select * from schedules where sche_date=to_char(sysdate,'yyyy/mm/dd');
 weekly: 
 		1.
 		select sche_date from schedulelists where user_id='aaa' and sche_date between
 		(
 		select to_date(20170706,'yyyymmdd')-to_char(to_date(20170706,'yyyymmdd'),'D')+1 startdate from dual
 		) and (
 		select to_date(20170706,'yyyymmdd')-to_char(to_date(20170706,'yyyymmdd'),'D')+7 enddate from dual
 		);
 		select to_date(20170701,'yyyymmdd')-to_char(to_date(20170701,'yyyymmdd'),'D')+1 startdate,
 		to_date(20170701,'yyyymmdd')-to_char(to_date(20170701,'yyyymmdd'),'D')+7 enddate from dual;
 		
 		select s.sche_date-to_char(s.sche_date,'D')+1 from dual, schedulelists s;
 		
 		2.
 		select * from schedulelists where user_id=#{user_id} and sche_date in (
		SELECT TO_CHAR( sysdate+LEVEL, 'YYYY/MM/DD' ) sche_date FROM DUAL CONNECT BY LEVEL &lt;= 7-to_char(sysdate, 'D') UNION 
		SELECT TO_CHAR( sysdate-LEVEL, 'YYYY/MM/DD' ) sche_date FROM DUAL CONNECT BY LEVEL &lt;= to_char(sysdate, 'D')-1 UNION 
		select to_char(sysdate, 'YYYY/MM/DD') sche_date from dual
		)
 
 (1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토)

 */


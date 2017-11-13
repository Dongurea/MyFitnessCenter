package handler.member;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClasslistDataBean;
import clsBoard.ClsBoardDao;
import handler.CommandHandler;
import handler.HandlerException;
import member.LogonDataBean;
import member.MemberDao;
import schedule.ScheduleAndWorkoutDataBean;
import schedule.ScheduleDao;
import schedule.ScheduleDataBean;
import schedulelist.ScheduleListDao;
import schedulelist.ScheduleListDataBean;
import spec.SpecDao;
import spec.SpecDataBean;

@Controller
public class MemberMypageHandler implements CommandHandler{
		@Resource(name="memberDao")
		MemberDao memberDao;
		
		@Resource(name="scheduleListDao")
		ScheduleListDao scheduleListDao;
		
		@Resource(name="scheduleDao")
		ScheduleDao scheduleDao;
		
		@Resource(name="specDao")
		SpecDao specDao;
		
		@Resource(name="clsBoardDao")
		ClsBoardDao clsBoardDao;
		
		@RequestMapping( "/memberMypage" )
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
			String page=request.getParameter("page");
			String user_id=(String)request.getSession().getAttribute("memId");
			if(page!=null){
				int pageInt=Integer.parseInt(page);
				LogonDataBean memberDto=memberDao.getMember(user_id);
				System.out.println("[Mypage] got expire_date from memberDto :" +memberDto.getExpire_date());
				if(memberDto.getExpire_date()!=null){
					Calendar c=Calendar.getInstance();
					Timestamp expire_t=memberDto.getExpire_date();
					Timestamp today_t=new Timestamp(System.currentTimeMillis());
					Date expire=new Date(expire_t.getTime());
					Date today=new Date(today_t.getTime());
					long diff = expire.getTime() - today.getTime();
				    long diffDays = diff / (24 * 60 * 60 * 1000);
					String expire_date;
					request.setAttribute("expire_date", diffDays);
					System.out.println("[Mypage] got expire_date for Days:" +diffDays);
				}
				if(pageInt==0){//메인페이지 - 회원권
				}else if(pageInt==1){//회원정보수정
					
				}else if(pageInt==2){//프로그램 - 경하끝나고
					List<ClasslistDataBean> classlist = clsBoardDao.selectClasslist(user_id);
					request.setAttribute("classlist", classlist);
				}else if(pageInt==3){//운동관련 상세데이터 , 스케줄 전체보기
					//운동데이터 계산
					//스케줄 성취도
					//몸무게 데이터-라벨(날짜)과 데이터
					//스케줄비율
					//근육지방- 라벨(날짜)과 데이터
					int ache=0;
					int nonAche=0;
					//int acheMid=0;
					int result=specDao.checkSpecExist(user_id);
					List<SpecDataBean> specList;
					if(result>0){
						specList= specDao.getAllSpec(user_id);
						request.setAttribute("specList", specList);
						System.out.println("[mypage:3] got specList : "+specList);
					}
					List<ScheduleAndWorkoutDataBean> scheWorkList=
							scheduleDao.getWorkoutTypeComplete(user_id);
					int multi=0;
					int burn=0;
					int pump=0;
					int multi_r=0;
					int burn_r=0;
					int pump_r=0;
					if(scheWorkList!=null){
						for(int i=0;i<scheWorkList.size();i++){
							ScheduleAndWorkoutDataBean scheWorkTmp=
									scheWorkList.get(i);
							switch(scheWorkTmp.getWorkout_type()){
							case "Burn": burn++;if(scheWorkTmp.getComplete()==1){burn_r++;}break;
							case "Multi": multi++;if(scheWorkTmp.getComplete()==1){multi_r++;}break;
							case "Pump": pump++;if(scheWorkTmp.getComplete()==1){pump_r++;}break;
							}
						}
						request.setAttribute("multi", multi);
						request.setAttribute("burn", burn);
						request.setAttribute("pump", pump);
						request.setAttribute("multi_r", multi_r);
						request.setAttribute("burn_r", burn_r);
						request.setAttribute("pump_r", pump_r);
						System.out.println("[mypage:3] got scheWorkList : "+scheWorkList);
					}
					
					//------------------
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
							if(scheListTmp.getAchieve()>0){
								ache++;
							}else{
								nonAche++;
							}
							scheList.put(scheListTmp.getSche_date(), scheTmp);
						}
						//scheList:스케줄리스트 sche_date별 상세스케줄
						//scheListList:회원의 전체 스케줄리스트
						request.setAttribute("ache", ache);
						request.setAttribute("nonAche", nonAche);
						request.setAttribute("scheList", scheList);
						request.setAttribute("scheListList", scheListList);
						
					}//end of scheListList is not null	
				}
				request.setAttribute("memberDto", memberDto);
			}else{
				LogonDataBean memberDto=memberDao.getMember(user_id);
				if(memberDto.getExpire_date()!=null){
					Calendar c=Calendar.getInstance();
					Timestamp expire_t=memberDto.getExpire_date();
					Timestamp today_t=new Timestamp(System.currentTimeMillis());
					Date expire=new Date(expire_t.getTime());
					Date today=new Date(today_t.getTime());
					long diff = expire.getTime() - today.getTime();
				    long diffDays = diff / (24 * 60 * 60 * 1000);
					String expire_date;
					request.setAttribute("expire_date", diffDays);
					System.out.println("[Mypage] got expire_date for Days:" +diffDays);
				}
			}
			request.setAttribute("page", page);
			return new ModelAndView( "member/mypage" );
		}
}

package bean;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.mvc.method.annotation.JsonViewRequestBodyAdvice;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import board.BoardDBBean;
import board.BoardDao;
import chat.ChatDBBean;
import chat.ChatDao;
import clsBoard.ClsBoardDBBean;
import clsBoard.ClsBoardDao;
import manager.ManagerDBBean;
import manager.ManagerDao;
import member.LogonDBBean;
import member.MemberDao;
import schedule.ScheduleDBBean;
import schedule.ScheduleDao;
import schedulelist.ScheduleListDBBean;
import schedulelist.ScheduleListDao;
import spec.SpecDBBean;
import spec.SpecDao;
import workout.WorkoutDBBean;
import workout.WorkoutDao;
import workout.WorkoutDataBean;

@Configuration
public class CreateBean {
	@Bean
	public MemberDao memberDao() {
		return new LogonDBBean();
	}
	
	@Bean
	public ManagerDao managerDao() {
		return new ManagerDBBean();
	}
	
	@Bean
	public BoardDao boardDao() {
		return new BoardDBBean();
	}
	
	@Bean
	public SpecDao specDao() {
		return new SpecDBBean();
	}
	
	@Bean
	public ScheduleListDao scheduleListDao() {
		return new ScheduleListDBBean();
	}
	
	@Bean
	public ScheduleDao scheduleDao() {
		return new ScheduleDBBean();
	}
	
	@Bean
	public WorkoutDao workoutDao(){
		return new WorkoutDBBean();
	}
	
	@Bean
	public ViewResolver viewResolver() {
		UrlBasedViewResolver viewResolver = new UrlBasedViewResolver();
		viewResolver.setViewClass( JstlView.class );
		viewResolver.setPrefix( "/" );
		viewResolver.setSuffix( ".jsp" );
		return viewResolver;
	}
	
	@Bean
	public ClsBoardDao clsBoardDao(){
		return new ClsBoardDBBean();
	}
	
	@Bean
	public ChatDao chatDao(){
		return new ChatDBBean();
	}
	
}













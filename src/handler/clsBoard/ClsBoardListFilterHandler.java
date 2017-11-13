package handler.clsBoard;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import clsBoard.ClsBoardDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller

public class ClsBoardListFilterHandler implements CommandHandler{
	@Resource( name="clsBoardDao")
	private ClsBoardDao clsBoardDao; 
	@SuppressWarnings("deprecation")
	@RequestMapping("/clsBoardListFilter")
	@Override 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String subject[] = request.getParameterValues("subject");
	    String classtime[] = request.getParameterValues("classtime");
	    String classdays[] = request.getParameterValues("classday");

	       if(subject!=null){
	            for(int i=0;i<subject.length;i++){
	               switch(subject[i]){
	                  case "%수영%" : subject[i] = "%수영%"  ; break;
	                  case "%PT%" : subject[i] = "%PT%"; break;
	                  case "%스피닝%" : subject[i] = "%스피닝%"; break;
	                  case "%필라테스%" : subject[i] = "%필라테스%"; break;
	                  case "%요가%" : subject[i] = "%요가%"; break;
	               }
	            }
	         }
	         
	         if(classtime!=null){
	            for(int i=0;i<classtime.length;i++){
	               switch(classtime[i]){
	                  case "%9%" : classtime[i] = "9"; break;
	                  case "%10%" : classtime[i] = "10"; break;
	                  case "%11%" : classtime[i] = "11"; break;
	                  case "%17%" : classtime[i] = "17"; break;
	                  case "%19%" : classtime[i] = "19"; break;
	               }
	            }
	         }
	         
	         if(classdays!=null){
	               for(int i=0;i<classdays.length;i++){
	                  switch(classdays[i]){
	                     case "%월%" : classdays[i] = "%월%"; break;
	                     case "%화%" : classdays[i] = "%화%"; break;
	                     case "%수%" : classdays[i] = "%수%"; break;
	                     case "%목%" : classdays[i] = "%목%"; break;
	                     case "%금%" : classdays[i] = "%금%"; break;
	                     case "%토%" : classdays[i] = "%토%"; break;
	                     case "%일%" : classdays[i] = "%일%"; break;
	                     
	                  }
	               }
	        }
	      
	      
	      
	      Date todaydate = new Date();
	      todaydate.setDate(1);
	      todaydate.setMonth(todaydate.getMonth()+1);
	      todaydate.setHours(0);
	      todaydate.setMinutes(0);
	      todaydate.setSeconds(0);
	     
	      HashMap<String, Object> map = new HashMap<String, Object>();
	      map.put("subjects", subject);
	      map.put("classtimes", classtime);
	      map.put("classdate", todaydate);
	      map.put("classday", classdays);
	      
	      List<ClsBoardDataBean> classes =  clsBoardDao.selectClasses(map);
	      request.setAttribute("classes", classes);
	      return new ModelAndView("clsBoard/clsBoardListprogram");
	   }

}

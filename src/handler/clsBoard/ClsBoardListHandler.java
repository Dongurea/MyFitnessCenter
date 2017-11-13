package handler.clsBoard;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class ClsBoardListHandler implements CommandHandler{
	@Resource( name="clsBoardDao")
	private ClsBoardDao clsBoardDao; 
	@SuppressWarnings("deprecation")
	@RequestMapping("/clsBoardList")
	@Override 
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
				
		Date todaydate = new Date();
		todaydate.setDate(1);
		todaydate.setMonth(todaydate.getMonth()+1);
		todaydate.setHours(0);
		todaydate.setMinutes(0);
		todaydate.setSeconds(0);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classdate", todaydate);

		List<ClsBoardDataBean> classes =  clsBoardDao.selectClasses(map);
		request.setAttribute("classes", classes);
		return new ModelAndView("clsBoard/clsBoardList");
	}

}

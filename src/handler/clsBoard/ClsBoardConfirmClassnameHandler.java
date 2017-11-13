package handler.clsBoard;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardConfirmClassnameHandler implements CommandHandler{
	@Resource(name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/clsBoardConfirmClassname")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String day = dateFormat.format(new java.util.Date());
        
		Date today = Date.valueOf(day);
		
		today.setMonth(today.getMonth()+1);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter("classname"));
		map.put("classdate", today);
		System.out.println(map);
		int result=clsBoardDao.selectClassnames(map);
		
		request.setAttribute("result", result);
		request.setAttribute("classname", request.getParameter("classname"));
		
		return new ModelAndView("clsBoard/clsBoardConfirmClassname");
	}
	
}

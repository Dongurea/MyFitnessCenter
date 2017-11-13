package handler.clsBoard;

import java.util.HashMap;

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
public class ClsBoardModifyFormHandler implements CommandHandler{
	@Resource(name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/clsBoardModifyForm")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter( "classname" ));
		map.put("classdate", request.getParameter("classdate"));	
		ClsBoardDataBean oneclass=clsBoardDao.selectClass(map);
		request.setAttribute("oneclass", oneclass);
		return new ModelAndView("clsBoard/clsBoardModifyForm");
	}
	
	
	
	
}

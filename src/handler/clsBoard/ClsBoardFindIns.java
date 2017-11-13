package handler.clsBoard;

import java.util.List;

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
public class ClsBoardFindIns implements CommandHandler{
	@Resource(name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/findInsPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		List<String> insnames = clsBoardDao.selectInstructors(); 
		request.setAttribute("insnames", insnames);
		request.setAttribute("formname", request.getParameter("formname"));
		return new ModelAndView("clsBoard/clsBoardFindIns");
	}
	
	
	
}

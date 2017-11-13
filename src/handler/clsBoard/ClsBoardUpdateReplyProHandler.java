package handler.clsBoard;

import java.io.UnsupportedEncodingException;

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
public class ClsBoardUpdateReplyProHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("clsUpdateReplyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		int result=clsBoardDao.updateReply(request.getParameter("user_id"), request.getParameter("classname"), request.getParameter("modifyReplyText"));
		request.setAttribute("result", result);
		request.setAttribute("classname", request.getParameter("classname"));
		request.setAttribute("classdate", request.getParameter("classdate"));
		
		return new ModelAndView("clsBoard/clsBoardUpdateReplyPro");
	}
	
}

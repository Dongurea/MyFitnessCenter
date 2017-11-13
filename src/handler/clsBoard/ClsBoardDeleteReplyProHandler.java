package handler.clsBoard;

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
public class ClsBoardDeleteReplyProHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("clsDeleteReplyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		int result = clsBoardDao.deleteReply(request.getParameter("user_id"), request.getParameter("classname"));
		if(result==1){
			result=clsBoardDao.updateRepliesNum(request.getParameter("classname"), Integer.parseInt(request.getParameter("replynum")));
		}
		
		request.setAttribute("result", result);
		request.setAttribute("classname", request.getParameter("classname"));
		request.setAttribute("classdate", request.getParameter("classdate"));
		return new ModelAndView("clsBoard/clsBoardDeleteReplyPro");
	}
	
}

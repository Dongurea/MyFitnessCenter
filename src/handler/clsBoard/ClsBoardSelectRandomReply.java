package handler.clsBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import clsBoard.ReplyDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardSelectRandomReply implements CommandHandler{
	@Resource( name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/selectRandomReply")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		List<ReplyDataBean> replyDto = clsBoardDao.selectRandomReply();
		request.setAttribute("replyDto", replyDto);
		return new ModelAndView("clsBoard/randomReply");
	}
	
}

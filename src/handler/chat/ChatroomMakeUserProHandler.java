package handler.chat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chat.ChatDao;
import chat.ChatDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ChatroomMakeUserProHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	@RequestMapping("/chatroomMakeUserPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		int chatroomnum=Integer.parseInt(request.getParameter("chatroomnum"));
		ChatDataBean chatDto = chatDao.selectChatroomChatroomnum(chatroomnum);
		request.setAttribute("chatDto", chatDto);
		
		return new ModelAndView("chat/chatroomUser");
	}
}

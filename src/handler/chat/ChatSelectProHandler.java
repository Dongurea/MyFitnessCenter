package handler.chat;

import java.util.HashMap;
import java.util.List;

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
public class ChatSelectProHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	@RequestMapping("chatSelectPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		//채팅내용 가져오는 핸들러
		String user_id=request.getParameter("user_id");
		String manager_id=request.getParameter("manager_id");
		String starttime=request.getParameter("starttime");

		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("user_id", user_id);
		map.put("manager_id", manager_id);
		map.put("starttime", starttime);
		List<ChatDataBean> chat = chatDao.selectChat(map);

		request.setAttribute("chat", chat);
		
		return new ModelAndView("chat/selectChat");
	}
}

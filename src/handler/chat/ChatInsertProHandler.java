package handler.chat;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import chat.ChatDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ChatInsertProHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	
	@RequestMapping("/chatInsertPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		//채팅내용 넣는 핸들러
		
		String user_id=request.getParameter("user_id");
		String manager_id=request.getParameter("manager_id");
		String text= request.getParameter("text");
		String fromtext=request.getParameter("fromtext");
		System.out.println(text);
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("user_id", user_id);
		map.put("manager_id", manager_id);
		map.put("text", text);
		map.put("fromtext", fromtext);
		
		int result = chatDao.insertChat(map);
		
		request.setAttribute("result", result);
		return null;
	}
}

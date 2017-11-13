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
public class ChatroomFindProHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	@RequestMapping("chatroomFindPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		//사용자가 채팅방 찾는 핸들러
		String user_id=(String)request.getSession().getAttribute("memId");
		int result=chatDao.selectChatrooms();
		if(result>0){
			//상담 가능
			int result2=chatDao.selectChatroomnum();
			HashMap<String, Object> map = new HashMap<String,Object>();
			map.put("user_id", user_id);
			map.put("num", result2);
			
			int result3=chatDao.updateChatroom(map);
			
			request.setAttribute("result3", result3);
			request.setAttribute("num", result2);
			
		}
		
		request.setAttribute("result", result);
		
		
		return new ModelAndView("chat/chatroomFindPro");
	}
}

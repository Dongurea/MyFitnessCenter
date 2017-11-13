package handler.chat;

import java.io.IOException;
import java.io.PrintWriter;

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
public class GetManagerChatroomnumHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	@RequestMapping("/getManagerChatroomnumPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String manager_id=(String) request.getSession().getAttribute("managerId");
		System.out.println(manager_id);
		int checkresult=chatDao.selectManagerChatroom(manager_id);
		
		if(checkresult==0){
			int insertresult=chatDao.insertChatroom(manager_id);
			checkresult=chatDao.selectManagerChatroom(manager_id);
		}
		
		request.setAttribute("checkresult", checkresult);

		System.out.println(checkresult);
		return new ModelAndView("chat/chatroomnumPage");
	}
	
}

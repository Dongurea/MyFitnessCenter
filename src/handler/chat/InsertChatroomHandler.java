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
public class InsertChatroomHandler implements CommandHandler{
	@Resource( name="chatDao" )
	private ChatDao chatDao;
	@RequestMapping("/insertChatroomPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		String manager_id=(String) request.getSession().getAttribute("managerId");
		int chatroomnum = chatDao.selectManagerChatroom(manager_id);
		request.setAttribute("chatroomnum", chatroomnum);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(chatroomnum); 
			out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return new ModelAndView("mfc/maintop_manager");
	}
	
}

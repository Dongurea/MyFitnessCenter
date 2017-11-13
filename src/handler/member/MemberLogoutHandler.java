package handler.member;

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
public class MemberLogoutHandler implements CommandHandler {
	@Resource(name="chatDao")
	private ChatDao chatDao;
	@RequestMapping( "/memberLogout" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String manager_id= (String) request.getSession().getAttribute("managerId");
		if(manager_id!=null){
			int result=chatDao.deleteChatroom(manager_id);
		}
		request.getSession().removeAttribute( "memId" );
		request.getSession().removeAttribute( "managerId" );
		return new ModelAndView( "mfc/main" );
	}	
}


















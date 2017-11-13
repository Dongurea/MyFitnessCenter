package handler.member;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import manager.ManagerDao;
import member.MemberDao;

@Controller
public class MemberLoginProHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@Resource( name="managerDao" )	
	private ManagerDao managerDao;
	
	@Override
	@RequestMapping("/memberLoginPro")
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String user_id = request.getParameter( "user_id" );
		String passwd = request.getParameter( "passwd" );
		System.out.println("[LoginPro] got id :"+user_id);
		int result = memberDao.check( user_id, passwd );
		int manage_result = managerDao.check(user_id, passwd);
		
		request.setAttribute( "result", result );
		request.setAttribute( "manage_result", manage_result );
		request.setAttribute( "user_id", user_id );
		
		return new ModelAndView( "member/loginPro" );
	}
}








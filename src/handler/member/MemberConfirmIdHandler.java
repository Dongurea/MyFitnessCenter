package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import member.MemberDao;

@Controller
public class MemberConfirmIdHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@RequestMapping( "/memberConfirmId" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String user_id = request.getParameter( "user_id" );
		
		int result = memberDao.check( user_id );

		request.setAttribute( "result", result );
		request.setAttribute( "user_id", user_id );		
		
		return new ModelAndView( "member/confirmId" );
	}
}

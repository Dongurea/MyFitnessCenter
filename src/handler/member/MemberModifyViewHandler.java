package handler.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import member.LogonDBBean;
import member.LogonDataBean;
import member.MemberDao;

@Controller
public class MemberModifyViewHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@RequestMapping( "/memberModifyView" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String id = (String) request.getSession().getAttribute( "memId" );
		String passwd = request.getParameter( "passwd" );
	
		int result = memberDao.check( id, passwd );
	
		request.setAttribute( "result", result );
		
		//if( result == 1 ) { - 수정전비밀번호 묻지말고 테스트용
			LogonDataBean memberDto = memberDao.getMember( id );
			request.setAttribute( "memberDto", memberDto );
		//}
	
		return new ModelAndView( "member/mypageMod" );
	}
}










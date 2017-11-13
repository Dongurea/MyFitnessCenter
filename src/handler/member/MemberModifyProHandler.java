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
public class MemberModifyProHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@RequestMapping( "/memberModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setPasswd( request.getParameter( "passwd" ) );
		//expert
		String expert=request.getParameter( "expert" );
		if(expert==null) expert="N";
		memberDto.setExpert( expert );
		
		//career
		//1일때 무경력, 2일때 1년이상, 3일때 3년이상
		memberDto.setCareer( Integer.parseInt(request.getParameter( "career" )) );
		

		
		String tel = request.getParameter( "tel" );
		memberDto.setTel( tel );
	
		String email = request.getParameter( "email" );
		memberDto.setEmail( email );
	
		memberDto.setUser_id( (String) request.getSession().getAttribute( "memId" ) );
	
		int result = memberDao.updateMember( memberDto );
	
		request.setAttribute( "result", result );
		
		return new ModelAndView( "member/modifyPro" );
	}
}















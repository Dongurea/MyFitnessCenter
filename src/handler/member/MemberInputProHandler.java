package handler.member;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import member.LogonDataBean;
import member.MemberDao;

@Controller
public class MemberInputProHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@RequestMapping( "/memberInputPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	
		LogonDataBean memberDto = new LogonDataBean();
		memberDto.setUser_id( request.getParameter( "user_id" ) );
		memberDto.setPasswd( request.getParameter( "passwd" ) );
		memberDto.setName( request.getParameter( "name" ) );
		//email, tel are under those.

		//expert
		String expert=request.getParameter( "expert" );
		if(expert==null) expert="N";
		memberDto.setExpert( expert );
		
		//career
		//1일때 무경력, 2일때 1년이상, 3일때 3년이상
		memberDto.setCareer( Integer.parseInt(request.getParameter( "career" )) );
		
		// tel
		String tel =request.getParameter( "tel" );
		memberDto.setTel( tel );
	
		// email
		String email = request.getParameter( "email" );
		memberDto.setEmail( email );
		memberDto.setReg_date( new Timestamp( System.currentTimeMillis() ) );
		memberDto.setAlarm("N");
		memberDto.setMsgCheck("1");
		
		int result = memberDao.insertMember( memberDto );
	
		request.setAttribute( "result", result );		
		
		return new ModelAndView( "member/inputPro" );
	}
}
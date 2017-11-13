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
import member.MemberDao;

@Controller
public class MemberConfirmEmailHandler implements CommandHandler {

	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@RequestMapping( "/memberConfirmEmail" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String email = request.getParameter( "email" );
		String getcode=request.getParameter("getcode");
		String code=request.getParameter("code");	
		

		if(code==null||code.equals("")){
			code=SendMail.send(email);
		}
		System.out.println("[confrimEmail] got code : "+code);
		System.out.println("[confrimEmail] got getcode : "+getcode);
		request.setAttribute("email",email);
		request.setAttribute("getcode",getcode);
		request.setAttribute("code", code);
		
		return new ModelAndView( "member/confirmEmail" );
	}
}

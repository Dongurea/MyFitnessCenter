package handler.manageUsers;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import member.MemberDao;
import spec.SpecDao;

@Controller
public class BoardsUserContentHandler implements CommandHandler {


	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	@Resource( name="specDao" )
	private SpecDao specDao;
	
	@RequestMapping( "/contact" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
	
		
		
		return new ModelAndView( "manageUsers/contact" );
	}
}














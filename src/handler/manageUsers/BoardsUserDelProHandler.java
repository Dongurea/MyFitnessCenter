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
public class BoardsUserDelProHandler implements CommandHandler {


	@Resource( name="memberDao" )	
	private MemberDao memberDao;
	
	//@Resource( name="specDao" )
	//private SpecDao specDao;
	
	@RequestMapping( "/deletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		String del_id = (String) request.getParameter( "del_id" );	
		
		System.out.println(del_id);
		//String passwd = request.getParameter( "passwd" );
		
		//int resultcheck = memberDao.check( id, passwd );	
			
		//request.setAttribute( "resultcheck", resultcheck );
		
		
		//if( resultcheck == 1 ) {
			int result = memberDao.deleteMember( del_id );
			request.setAttribute( "result", result );			 
		//}
			//if( specDao.checkSpecExist(del_id)==1){
			//specDao.deleteSpec( del_id );
			//}
		
		
		return new ModelAndView( "manageUsers/deleteCheck" );
	}
}














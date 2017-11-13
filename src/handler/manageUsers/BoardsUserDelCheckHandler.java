package handler.manageUsers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardsUserDelCheckHandler implements CommandHandler {

	@RequestMapping( "/deleteCheck" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String del_id = (String) request.getParameter( "del_id" );	
		request.setAttribute( "del_id", del_id);
		
	
		return new ModelAndView( "manageUsers/deleteCheck" );
	}
}














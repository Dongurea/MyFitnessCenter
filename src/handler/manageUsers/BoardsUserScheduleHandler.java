package handler.manageUsers;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardsUserScheduleHandler implements CommandHandler {

	@Resource( name="boardDao" )
	private BoardDao boardDao;
	
	@RequestMapping( "/userSchedule" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		return new ModelAndView( "manageUsers/userSchedule" );
	}
}



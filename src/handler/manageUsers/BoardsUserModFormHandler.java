package handler.manageUsers;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import spec.SpecDao;
import spec.UsersSetDataBean;

@Controller
public class BoardsUserModFormHandler implements CommandHandler {

	@Resource( name="specDao" )
	private SpecDao specDao;
	
	
	@RequestMapping( "/modifyForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String mod_id = (String) request.getParameter( "mod_id" );	
		
		System.out.println(mod_id);
		
		request.setAttribute( "mod_id", mod_id);
		
		UsersSetDataBean spec = specDao.getUserSpec(mod_id);
		
		int result=specDao.checkSpecExist(mod_id); //0일때 회원이 spec을 미입력.
		
		System.out.println("result : " +result);
		request.setAttribute("result", result);
		
		
		request.setAttribute("spec", spec);
		
		System.out.println(spec.getName());
		
	
		return new ModelAndView( "manageUsers/modifyForm" );
	}
}














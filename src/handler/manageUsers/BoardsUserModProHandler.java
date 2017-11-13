package handler.manageUsers;

import java.util.List;

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
public class BoardsUserModProHandler implements CommandHandler {

	@Resource( name="specDao" )
	private SpecDao specDao;
	
	
	@RequestMapping( "/modifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {

		String user_id = (String) request.getParameter( "user_id" );
		String name = (String) request.getParameter( "name" );
		//int gender = Integer.parseInt (request.getParameter( "gender" ));
		int age = Integer.parseInt (request.getParameter( "age" ));
		String email = (String) request.getParameter( "email" );
		int weight = Integer.parseInt (request.getParameter( "weight" ));
		int height = Integer.parseInt (request.getParameter( "height" ));
		
		UsersSetDataBean userSpec=new UsersSetDataBean();
		
		
		
		userSpec.setUser_id(user_id);
		userSpec.setName(name);
		//userSpec.setGender(gender);
		userSpec.setAge(age);
		userSpec.setEmail(email);
		userSpec.setHeight(height);
		userSpec.setWeight(weight);
		

		int result=specDao.checkSpecExist(user_id);
		
		if(result==1){
			 specDao.updateUserSpec(userSpec);
		}else if(result==0){
			//스펙을 입력 안했을때 insert
			//specDao.insertUserSpec(userSpec);
		}

		request.setAttribute( "result", result );		
	
	
		return new ModelAndView( "manageUsers/modifyForm" );
	}
}














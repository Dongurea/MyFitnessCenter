package handler.main;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
@Controller
public class MfcMainHandler implements CommandHandler{
	@RequestMapping( "mfcMain" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		String memId=(String)request.getSession().getAttribute("memId");
		System.out.println("[MfcMainHandler]Main got user_id: "+memId);

		//System.out.println( (byte)"3009317516".hashCode() );
		if(memId==null){
			String managerId=(String)request.getSession().getAttribute("managerId");
			System.out.println("[MfcMainHandler]Main got manager_id: "+managerId);
			request.getSession().setAttribute("managerId", managerId);
		}
		
		request.getSession().setAttribute("memId", memId);
		
		return new ModelAndView( "mfc/main" );
	}
}
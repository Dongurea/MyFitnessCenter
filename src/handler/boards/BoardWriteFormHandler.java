package handler.boards;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardWriteFormHandler implements CommandHandler {

	@RequestMapping( "/boardWriteForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		// 제목글
		int num = 0;			// 제목글 0 / 답변글 !0
		int ref = 1;			// 그룹화 아이디
		int re_step = 0;		// 글순서
		int re_level = 0;		// 글레벨
		
		if( request.getParameter( "num" ) != null ) {
			// 답변글
			num = Integer.parseInt( request.getParameter( "num" ) );
			ref = Integer.parseInt( request.getParameter( "ref" ) );
			re_step = Integer.parseInt( request.getParameter( "re_step" ) );
			re_level = Integer.parseInt( request.getParameter( "re_level" ) );		
		}
	
		request.setAttribute( "num", num );
		request.setAttribute( "ref", ref );
		request.setAttribute( "re_step", re_step );
		request.setAttribute( "re_level", re_level );
				
		return new ModelAndView( "boards/boardWriteForm" );
	}
}












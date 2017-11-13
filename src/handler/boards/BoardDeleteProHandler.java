package handler.boards;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board.BoardDBBean;
import board.BoardDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardDeleteProHandler implements CommandHandler {

	@Resource( name="boardDao" )
	private BoardDao boardDao;
	
	@RequestMapping( "/boardDeletePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );

		request.setAttribute( "num", num );
		request.setAttribute( "pageNum", pageNum );

			int result = boardDao.deleteArticle( num );
			request.setAttribute( "result", result );

		return new ModelAndView( "boards/boardDeletePro" );
	}
}






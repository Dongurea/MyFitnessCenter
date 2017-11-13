package handler.boards;

import java.io.UnsupportedEncodingException;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDBBean;
import board.BoardDao;
import board.BoardDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardModifyFormHandler implements CommandHandler {

	@Resource( name="boardDao" )
	private BoardDao boardDao;
	
	@RequestMapping( "/boardModifyForm" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		int num = Integer.parseInt( request.getParameter( "num" ) );
		String pageNum = request.getParameter( "pageNum" );

		BoardDataBean boardDto = boardDao.getArticle( num );
		if( ! boardDto.getIp().equals( request.getRemoteAddr() ) )
			boardDao.addCount( num );
			
		request.setAttribute( "pageNum", pageNum );
		request.setAttribute( "boardDto", boardDto );
		 
	 
		 
		return new ModelAndView( "boards/boardModifyForm" );
	}
}








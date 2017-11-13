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
public class BoardModifyProHandler implements CommandHandler {

	@Resource( name="boardDao" )
	private BoardDao boardDao;
	
	@RequestMapping( "/boardModifyPro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
	
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 String realFolder = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 realFolder = realFolder = "C:/ExportJava/eclipse/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/MFC/boards/images";

		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		    String fileName = multi.getFilesystemName(file1);
		    String content=multi.getParameter( "content" );
	        content = content.replaceAll("\r\n", "<br>"); // 줄바꿈 처리
	        content = content.replaceAll("\u0020", "&nbsp;"); // 스페이스바 처리
		
		
	
		BoardDataBean boardDto = new BoardDataBean();
		boardDto.setNum(Integer.parseInt(multi.getParameter("num")));
		boardDto.setEmail( multi.getParameter( "email" ) );
		boardDto.setSubject( multi.getParameter( "subject" ) );
		boardDto.setContent( content );
		boardDto.setPasswd( "123" );
		boardDto.setBoardCheck( Integer.parseInt(multi.getParameter( "boardCheck" ) ));
		boardDto.setFileName(fileName);

		String pageNum =multi.getParameter( "pageNum" );
		
		System.out.println(pageNum);
		
		int result = boardDao.updateArticle( boardDto );
		 	
		request.setAttribute( "result", result );
		request.setAttribute( "pageNum", pageNum );
		
		 } catch(Exception e) {
			  e.printStackTrace();
		 }
		 
		return new ModelAndView( "boards/boardModifyPro" );
		 
		 }
}






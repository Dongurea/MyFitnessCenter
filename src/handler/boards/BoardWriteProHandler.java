package handler.boards;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Enumeration;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDao;
import board.BoardDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class BoardWriteProHandler implements CommandHandler {

	@Resource( name="boardDao" )
	private BoardDao boardDao;
	
	@RequestMapping( "/boardWritePro" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		 String realFolder = "";
		 String fileName = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 realFolder = "C:/ExportJava/eclipse/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/MFC/boards/images";


	
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		     String file1 = (String)files.nextElement();
		     fileName = multi.getFilesystemName(file1);
		     String content=multi.getParameter( "content" );
		        content = content.replaceAll("\r\n", "<br>"); // 줄바꿈 처리
		        content = content.replaceAll("\u0020", "&nbsp;"); // 스페이스바 처리
		     
		     
		 	BoardDataBean boardDto = new BoardDataBean();
		     
				boardDto.setWriter(multi.getParameter("writer") );
				boardDto.setEmail(multi.getParameter( "email" ) );
				boardDto.setSubject( multi.getParameter( "subject" ) );
				boardDto.setContent( content );
				boardDto.setPasswd( multi.getParameter( "passwd" ) ); 
				boardDto.setNum( Integer.parseInt( multi.getParameter( "num") ) );
				boardDto.setRef( Integer.parseInt( multi.getParameter( "ref") ) );
				boardDto.setRe_step( Integer.parseInt( multi.getParameter( "re_step" ) ) );
				boardDto.setRe_level( Integer.parseInt( multi.getParameter( "re_level" ) ) );
				boardDto.setFileName(fileName);
				boardDto.setBoardCheck(Integer.parseInt( multi.getParameter( "boardCheck") ));
				
				// 작성일
				boardDto.setReg_date( new Timestamp( System.currentTimeMillis() ) );
				// IP
				boardDto.setIp( request.getRemoteAddr() );
				
				int result = boardDao.insertArticle( boardDto );

				request.setAttribute( "result", result );
		 } catch(Exception e) {
		  e.printStackTrace();
		 }
	

		return new ModelAndView( "boards/boardWritePro" );
	}
}












package handler.clsBoard;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import clsBoard.ClsBoardDao;
import clsBoard.ClsBoardDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardModifyProHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("clsBoardModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String realFolder = "";
		 String filename = "";
		 int maxSize = 1024*1024*5;
		 String encType = "utf-8";
		 realFolder = "C:/ExportJava/eclipse/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp2/wtpwebapps/MFC/clsBoard/images";
		 
		 int result=0;
		 try{
		  MultipartRequest multi=new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		  Enumeration<?> files = multi.getFileNames();
		  String file1 = (String)files.nextElement();
		  filename = multi.getFilesystemName(file1);

		  String classday="";

		  String class_time = multi.getParameter("class_time");
		  String class_day[] = multi.getParameterValues("class_day");
		
		
			for(int i=0; i<class_day.length; i++){
				
				classday+=class_day[i];
				if(i!=class_day.length-1){
					classday += ",";
				}
			}
	
			ClsBoardDataBean clsBoardDto = new ClsBoardDataBean();
			clsBoardDto.setClassname(multi.getParameter("classname"));
			clsBoardDto.setClass_intro(multi.getParameter("class_intro"));
			clsBoardDto.setIns_name(multi.getParameter("ins_name"));
			clsBoardDto.setMax_stu(Integer.parseInt(multi.getParameter("max_stu")));
			clsBoardDto.setTuition(Integer.parseInt(multi.getParameter("tuition")));
			clsBoardDto.setClass_time(class_time);
			clsBoardDto.setClass_day(classday);
			clsBoardDto.setLink(filename);
			
			System.out.println(multi.getParameter("classdate"));
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("clsBoardDto", clsBoardDto);	
			map.put("classdate", multi.getParameter("classdate"));	
			
			result=clsBoardDao.updateClass(map);
			
			request.setAttribute("result", result);
			request.setAttribute("classname", multi.getParameter("classname"));
			request.setAttribute("classdate", multi.getParameter("classdate"));
			
		 }catch(IOException e){
			 e.printStackTrace();
		 }catch(Exception e) {
			  e.printStackTrace();
		 }
		 
		
		return new ModelAndView("clsBoard/clsBoardModifyPro");
	}
	
}

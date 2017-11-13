package handler.clsBoard;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import clsBoard.ClsBoardDataBean;
import clsBoard.InstructorDataBean;
import clsBoard.ReplyDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardContentHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/clsBoardContent")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		ClsBoardDataBean clsBoardDto;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter( "classname" ));
		map.put("classdate", request.getParameter("classdate"));		
		
		clsBoardDto = clsBoardDao.selectClass(map);
		
		int stuCheck = 0;
		if(request.getSession().getAttribute("memId")!=null){
			map.put("user_id", request.getSession().getAttribute("memId"));
			stuCheck = clsBoardDao.confirmClassstu(map);		
		}
				
		InstructorDataBean instructor = clsBoardDao.selectInstructor(clsBoardDto.getIns_name());
		List<ReplyDataBean> replies = clsBoardDao.selectReplies(request.getParameter( "classname" ));
		request.setAttribute("oneclass", clsBoardDto);
		request.setAttribute("instructor", instructor);
		request.setAttribute("replies", replies);
		request.setAttribute("stuCheck", stuCheck);

		return new ModelAndView("clsBoard/clsBoardContent");
	}
	
}

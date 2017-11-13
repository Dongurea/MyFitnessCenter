package handler.clsBoard;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardBookCancelProHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/clsBoardBookCancelPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding( "utf-8" );
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter("classname"));
		map.put("classdate", request.getParameter("classdate"));
		int result=clsBoardDao.updateClassStudown(map);
		int cls_num =0;
		if(result!=0){
			map.put("user_id", request.getParameter("user_id"));
			cls_num = clsBoardDao.selectClalistnum(map);
			
			result=clsBoardDao.deleteClasslist(map);
			System.out.println(result+"삭제");
			if(result!=0){
				map.put("cls_num", cls_num);
				result=clsBoardDao.updateClasslistNum(map);
				System.out.println(result+"업데이트");
			}
		}
		request.setAttribute("result", result);
		request.setAttribute("classname", request.getParameter("classname"));
		request.setAttribute("classdate", request.getParameter("classdate"));
		return new ModelAndView("clsBoard/clsBoardBookCancelPro");
	}

}

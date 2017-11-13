package handler.clsBoard;

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
public class ClsBoardDeleteProHandler implements CommandHandler{
	@Resource( name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	
	@RequestMapping("/clsBoardDeletePro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		int result=0;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter("classname"));
		map.put("classdate", request.getParameter("classdate"));
		
		if(Integer.parseInt(request.getParameter("replysize"))>0){
			result=clsBoardDao.deleteReplies( request.getParameter("classname"));
			if(result!=0){
				result=clsBoardDao.deleteClass(map);
			}else{
				result=3;
			}
		}else{
			result=clsBoardDao.deleteClass(map);
		}

		
		request.setAttribute("result", result);
		
		return new ModelAndView("clsBoard/clsBoardDeletePro");
	}

}

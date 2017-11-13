package handler.clsBoard;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import clsBoard.ReplyDataBean;
import handler.CommandHandler;
import handler.HandlerException;


@Controller
public class ClsBoardInsertReplyProHandler implements CommandHandler{
	@Resource( name="clsBoardDao" )
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/clsInsertReplyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("classname", request.getParameter("classname"));
		map.put("user_id", request.getSession().getAttribute("memId"));
		
		int result=clsBoardDao.confirmClassstu(map);
		
		if( result >= 1){
			ReplyDataBean replyDataBean = new ReplyDataBean();
			replyDataBean.setReply_num(Integer.parseInt(request.getParameter("count"))+1);
			replyDataBean.setClassname(request.getParameter("classname"));
			replyDataBean.setText(request.getParameter("comment"));
			replyDataBean.setUser_id((String) request.getSession().getAttribute("memId"));
			
			result = clsBoardDao.insertReply(replyDataBean);
		}else{
			result=3;
		}
		
		request.setAttribute("result", result);
		request.setAttribute("classname", request.getParameter("classname"));
		request.setAttribute("classdate", request.getParameter("classdate"));
		
		return new ModelAndView("clsBoard/clsBoardInsertReplyPro");
	}
	
}

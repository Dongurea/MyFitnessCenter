package handler.clsBoard;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import clsBoard.ClsBoardDao;
import clsBoard.ClsBoardDataBean;
import handler.CommandHandler;
import handler.HandlerException;

@Controller
public class ClsBoardSelectRandomHandler implements CommandHandler{
	@Resource(name="clsBoardDao")
	private ClsBoardDao clsBoardDao;
	@RequestMapping("/selectRandomClass")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		// TODO Auto-generated method stub

		List<ClsBoardDataBean> clsBoardDto = clsBoardDao.selectBestClasses();
		request.setAttribute("clsBoardDto", clsBoardDto);
		return new ModelAndView("clsBoard/randomProgram");
	}

}

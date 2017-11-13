package handler.manageUsers;


import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import handler.CommandHandler;
import handler.HandlerException;
import spec.SpecDao;
import spec.UsersSetDataBean;

@Controller
public class BoardsUserListFilterHandler implements CommandHandler {

	@Resource( name="specDao" )
	private SpecDao specDao;
	@SuppressWarnings("deprecation")
	
	@RequestMapping( "/specListFilter" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
		
		
		String name = request.getParameter("name");
		
		System.out.println("name:"+name);
 	
	 	if( name ==null || name.equals("") ) {
			int pageSize = 4;
			int pageBlock = 3;
					
			int count = 0;
			String pageNum = null;
			int currentPage = 0;
			int start = 0;
			int end = 0;
			int number = 0;
			
			int pageCount = 0;
			int startPage = 0;
			int endPage = 0;
		 	
			count =specDao.getCount();
			System.out.println("count:"+count);
			pageNum = request.getParameter("pageNum");
			if (pageNum == null) {
				pageNum = "1";
			}
			
			pageCount = (count / pageSize) + (count % pageSize > 0 ? 1 : 0);

			if (Integer.parseInt(pageNum) > pageCount)
				pageNum = String.valueOf(pageCount);

			currentPage = Integer.parseInt(pageNum);
			start = (currentPage - 1) * pageSize + 1; // ( 1 - 1 ) * 10 + 1 1
			end = start + pageSize - 1; // 1 + 10 - 1 10
			if (end > count)
				end = count;
			
			
			number = count - (currentPage - 1) * pageSize;
			// 50 - ( 2 - 1 ) * 10

			startPage = (currentPage / pageBlock) * pageBlock + 1;
			// ( 5 / 10 ) * 10 + 1 1
			// ( 19 / 10 ) * 10 + 1 11
			if (currentPage % pageBlock == 0)
				startPage -= pageBlock;
			endPage = startPage + pageBlock - 1;
			// 11 + 10 - 1 20

			if (endPage > pageCount)
				endPage = pageCount;
			
			request.setAttribute( "count", count );	
		 	request.setAttribute( "pageNum", pageNum );
		 	request.setAttribute( "currentPage", currentPage );
	 		if( count > 0 ) {
		 		Map<String,Integer> map
		 		= new HashMap<String,Integer>();
		 		map.put("start",start);
		 		map.put("end",end);
		 		List<UsersSetDataBean> specs = specDao.getUsersSpec( map);
		 		request.setAttribute( "specs", specs );
		 		request.setAttribute( "number", number );
				request.setAttribute( "pageBlock", pageBlock );
				request.setAttribute( "startPage", startPage );
				request.setAttribute( "endPage", endPage );
				request.setAttribute( "pageCount", pageCount );
		 	}
	 		

	 	}else{
			List<UsersSetDataBean> specs = specDao.UserSearch(name);
	 		request.setAttribute( "specs", specs );

	 	}
							
			

				
		return new ModelAndView( "manageUsers/specListDataPro" );
	}
}









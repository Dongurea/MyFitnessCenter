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
import member.LogonDataBean;
import member.MemberDao;
import spec.SpecDao;
import spec.UsersSetDataBean;

@Controller
public class BoardsUserListHandler implements CommandHandler {

   @Resource( name="memberDao" )   
   private MemberDao memberDao;
   
   @Resource( name="specDao" )
   private SpecDao specDao;
   
   @RequestMapping( "/specList" )
   @Override
   public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws HandlerException {
      
      
      
      
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
      
       //회원  삭제 처리----------------------------------------------------------------

      if(request.getParameterValues("checkboxValues") != null){
         String ArrayId[]=request.getParameterValues("checkboxValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);

          for(int i=0;i<requestId.length;i++){
              memberDao.deleteMember( requestId[i]);
              System.out.println("삭제할 아이디 :"+requestId[i]);
          }
      }
      //---------------------------------------------------------------------------
      
      //회원권 등록---------------------------------------------------------------
      String signMem = request.getParameter("signMem");
      System.out.println("signMem :" +signMem);
      if(request.getParameterValues("signMemValues") != null){
         String ArrayId[]=request.getParameterValues("signMemValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);

          for(int i=0;i<requestId.length;i++){
              specDao.signMem( requestId[i]);
              System.out.println("회원권 등록할 아이디:"+requestId[i]);
          }
      }
      //------------------------------------------------------------------------------
      
      //회원권 취소-----------------------------------------------------------------
      String cancelMem = request.getParameter("cancelMem");
      System.out.println("cancelMem :" +cancelMem);
      if(request.getParameterValues("cancelMemValues") != null){
         String ArrayId[]=request.getParameterValues("cancelMemValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);

          for(int i=0;i<requestId.length;i++){
              specDao.cancelMem( requestId[i]);
              System.out.println("회원권 취소할아이디"+i+":"+requestId[i]);
  		 	
              Map<String,String> cancelId
  	 		= new HashMap<String,String>();
  	 		cancelId.put("msgCheck","0");
  	 		cancelId.put("user_id",requestId[i]);
  		 	memberDao.updateMsgCheck(cancelId);
          }
      }
      //---------------------------------------------------------------------------
      
      //회원권 개월 추가-----------------------------------------------------------------
      String month = request.getParameter("month");
      System.out.println("month :" +month);
      if(month != null){
         Map<String,String> map= new HashMap<String,String>();
             
         String ArrayId[]=request.getParameterValues("addMonIdValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);
      
            
             Map<String,String> mapChk= new HashMap<String,String>();
             mapChk.put("msgCheck","2");


             for(int i=0;i<requestId.length;i++){
                mapChk.put("user_id",requestId[i]); 
                memberDao.updateMsgCheck(mapChk);
             }
         
         
         for(int i=0; i<requestId.length;i++){
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
                  if(specDao.getUserSpec(requestId[i]).getReg_date() !=null){   
                  String reg_date = format.format(specDao.getUserSpec(requestId[i]).getReg_date());
                  map.put("reg_date", reg_date);
                  }else{
                     map.put("reg_date", null);
                  }
                  if(specDao.getUserSpec(requestId[i]).getExpire_date() !=null){   
                  String expire_date = format.format(specDao.getUserSpec(requestId[i]).getExpire_date());
                  map.put("expire_date", expire_date);
                  }else{
                     map.put("expire_date", null);
                  }
                map.put("user_id",requestId[i]);
                map.put("month",month);
                
                specDao.addMonth(map);
                
                
                
               }
      }
      //---------------------------------------------------------------------------------------
      
      //회원 알림 체크-------------------------------------------------------------------------
         /*
          * msgCheck :
          * 1 일떄 새 회원
          * 2 일때 만기 7일전
          * 3 일때 만기 알림
           * 0일때 메세지 표시안함
          */
         //알림 check가져오기------------------------------------------------------------------------
      int msgAll=0;

         
         //number 만 가져옴-------------------------------------------------------
         
         
         
         //memberDao.restDay("7");
         //memberDao.restDay("0");
         
         //List<LogonDataBean> userAddMon =memberDao.alarmUsers("4");      //회원권 추가회원 get
         //확인하면 2로 넘어감
         if(memberDao.alarmUsers("1")!=null){
         List<LogonDataBean> userNewMem =memberDao.alarmUsers("1");      //새로운 회원 Get
         //확인하면 2로 넘어감
          request.setAttribute( "userNewMem",userNewMem );
         System.out.println("새로운 회원 : "+userNewMem.size());
         request.setAttribute( "msgNewMem",userNewMem.size() );         
         msgAll +=userNewMem.size();
         }
         
         //---------만기 7일 남은 회원을 가져옴----------------------------------
	 		Map<String,String> sevenList
	 		= new HashMap<String,String>();
	 		sevenList.put("restDay","7");
	 		sevenList.put("restDay1","7");
	 		sevenList.put("msgCheck","1");
	 		sevenList.put("msgCheck1","0");
          	if(memberDao.updateMsgList(sevenList) !=null){
		 		List<String> sevenID=memberDao.updateMsgList(sevenList);
				
		 		
		 		for(int i=0; i<sevenID.size(); i++){
			 		Map<String,String> seven
			 		= new HashMap<String,String>();
			 		seven.put("msgCheck","2");
			 		seven.put("user_id",sevenID.get(i));
		 			memberDao.updateMsgCheck(seven);
		 		}
		 		}
	 		
			if(memberDao.alarmUsers("2")!=null){
				List<LogonDataBean> userSeven =memberDao.alarmUsers("2");		//새로운 회원 Get
				//확인하면 2로 넘어감
		 		request.setAttribute( "userSeven",userSeven );
				System.out.println("만기 7일전 : "+userSeven.size());
				request.setAttribute( "msgSeven",userSeven.size() );		
				msgAll +=userSeven.size();
				}
          	
         //---------만기된 회원을 가져옴----------------------------------
	 		Map<String,String> expireList
	 		= new HashMap<String,String>();
	 		expireList.put("restDay","0");
	 		expireList.put("restDay1","0");
	 		expireList.put("msgCheck","2");
	 		expireList.put("msgCheck1","0");  //만기 7일 남은 회원 Get
          
	 		if(memberDao.updateMsgList(expireList)!=null){
		 		List<String> expireID=memberDao.updateMsgList(expireList);
				
		 		for(int i=0; i<expireID.size(); i++){
			 		Map<String,String> expire
			 		= new HashMap<String,String>();
			 		System.out.println("test : !"+expire.get(0));
			 		expire.put("msgCheck","3");
			 		expire.put("user_id",expireID.get(i));
		 			memberDao.updateMsgCheck(expire);
		 		}
		 		}

          
			if(memberDao.alarmUsers("3")!=null){
				List<LogonDataBean> userExpire =memberDao.alarmUsers("3");		//새로운 회원 Get
				//확인하면 2로 넘어감
		 		request.setAttribute( "userExpire",userExpire );
				System.out.println("만기된 회원 : "+userExpire.size());
				request.setAttribute( "msgExpire",userExpire.size() );		
				msgAll +=userExpire.size();
				}

         
         System.out.println("전체 알림이 (=만기7일전+만기일+새 회원+회원권 추가회원): "+msgAll);

         //System.out.println("회원권 추가회원 : "+userAddMon.size());
         
         if(msgAll!=0){
         request.setAttribute( "msgAll",msgAll);
         }

         //request.setAttribute( "msgAddMon",userAddMon.size() );
      
      
      //--------------------------------------------------------------------------------------------
         
         //알림체크
      if(request.getParameterValues("delNewMemValues") != null){
         String ArrayId[]=request.getParameterValues("delNewMemValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);
         
          Map<String,String> mapChk= new HashMap<String,String>();
          mapChk.put("msgCheck","0");


          for(int i=0;i<requestId.length;i++){
             mapChk.put("user_id",requestId[i]); 
             memberDao.updateMsgCheck(mapChk);
             System.out.println("알람확인한 아이디"+requestId[i]);

          }
      }
      
      if(request.getParameterValues("delSevenMemValues") != null){
         String ArrayId[]=request.getParameterValues("delSevenMemValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);
         
          Map<String,String> mapChk= new HashMap<String,String>();
          mapChk.put("msgCheck","0");


          for(int i=0;i<requestId.length;i++){
             mapChk.put("user_id",requestId[i]); 
             memberDao.updateMsgCheck(mapChk);
          }
      }
      
      if(request.getParameterValues("delExpireMemValues") != null){
         String ArrayId[]=request.getParameterValues("delExpireMemValues");
         String regex = ",";
         int limit = 0;
         String[] requestId = ArrayId[0].split(regex, limit);
         
          Map<String,String> mapChk= new HashMap<String,String>();
          mapChk.put("msgCheck","4");


          for(int i=0;i<requestId.length;i++){
             mapChk.put("user_id",requestId[i]); 
             memberDao.updateMsgCheck(mapChk);
          }
      }
         
      //페이지 처리----------------------------------------------------------------------------------
      count =specDao.getCount();
      
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
                     
         

            
      return new ModelAndView( "manageUsers/specList" );
   }
}








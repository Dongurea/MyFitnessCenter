package handler.member;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {
	public static String send(String receiver){
		String sender="longtimeago500@gmail.com";
		String password="prodiction";
		String title="[JAVA 테스트] 이메일 인증 테스트";
		String code="";

		for(int i=0;i<6;i++){
			int num=((int)(Math.random()*10)+1)+47;
			int c=((int)(Math.random()*25))+65;
			if(i%2==0){
				code+=(char)num;
			}else{
				code+=(char)c;
			}
		}
		if(code.length()<5) code=""; 
		
		Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
        props.put("mail.smtp.port", "587"); //TLS Port
        props.put("mail.smtp.auth", "true"); //enable authentication
        props.put("mail.smtp.starttls.enable", "true"); //enable STARTTLS

		Authenticator auth=new Authenticator() {
			 protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(sender, password);
	            }
		};
        Session session = Session.getInstance(props, auth);
        //session.setDebug(true);
        
        MimeMessage msg = new MimeMessage(session);
        //set message headers
        try {
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.addHeader("format", "flowed");
	        msg.addHeader("Content-Transfer-Encoding", "8bit");
	         
			msg.setFrom(new InternetAddress(sender, "관리자"));
	        msg.setReplyTo(InternetAddress.parse(sender, false));
	 
	        msg.setSubject(title, "UTF-8");
	        msg.setText("인증번호: "+code, "UTF-8");
	        msg.setSentDate(new Date());
	 
	        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(receiver, false));
	        Transport.send(msg); 
        
        } catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return code;

	}
}

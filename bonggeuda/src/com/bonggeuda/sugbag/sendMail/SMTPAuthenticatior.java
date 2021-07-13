package com.bonggeuda.sugbag.sendMail;

import java.util.Date;
import java.util.Properties;
 
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


public class SMTPAuthenticatior {


	public void sendAllowEmail (String mailReceiverUser,String bookDate, String bookUserName, String bookAccomoName, String bookRoomName , String bookCheckoutDate , String bookCheckInTime) {
        
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress() ;
             
             
            from = new InternetAddress("Bonggeuda<qpwlxk123@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(mailReceiverUser);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("요청 하신 예약이 승인 되었습니다", "UTF-8");
             
            // 이메일 내용
            msg.setText(bookUserName + " 님의 예약이  승인 되었습니다. "
            		+ " \n 예약 하신 숙소는 " + bookAccomoName +" 의 "  + bookRoomName+ " 입니다."
            		+ "\n 예약 하신 날짜는 " + bookDate + "/ " + bookCheckInTime + " ~ " + bookCheckoutDate + "/ 11:00 입니다. "
            		+ " 감사합니다", "UTF-8");
             
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
    }

	public void sendRejectMail(String emailReceiver, String bookDate, String bookUserName, String bookAccomoName,
			String bookRoomName, String bookCheckInTime, String bookCheckoutDate, String rejecetReason) {
		
        Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");     // gmail은 무조건 true 고정
        p.put("mail.smtp.host", "smtp.gmail.com");      // smtp 서버 주소
        p.put("mail.smtp.auth","true");                 // gmail은 무조건 true 고정
        p.put("mail.smtp.port", "587");                 // gmail 포트
           
        Authenticator auth = new MyAuthentication();
         
        //session 생성 및  MimeMessage생성
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
         
        try{
            //편지보낸시간
            msg.setSentDate(new Date());
             
            InternetAddress from = new InternetAddress() ;
             
             
            from = new InternetAddress("Bonggeuda<qpwlxk123@gmail.com>");
             
            // 이메일 발신자
            msg.setFrom(from);
             
             
            // 이메일 수신자
            InternetAddress to = new InternetAddress(emailReceiver);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("요청하신 예약이 거절 되었습니다", "UTF-8");
             
            // 이메일 내용
            msg.setText(" \n 예약  요청 하신 숙소  " + "'"+bookAccomoName +"'"+" 의 "  + "'"+bookRoomName+"'"+ " 에서의 "
            		+ "\n  / " + bookDate + "/ " + bookCheckInTime + " ~ " + bookCheckoutDate + "/ 11:00  까지의 예약이 거절 되었습니다.  "
            		+ " 사유는 , 업주님의 요청입니다.  업주님의 메세지 : "+"'"+rejecetReason +"'"+" 입니다. 죄송합니다"   , "UTF-8");
             
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기
            javax.mail.Transport.send(msg);
             
        }catch (AddressException addr_e) {
            addr_e.printStackTrace();
        }catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
		
	}
 
}
 
 
class MyAuthentication extends Authenticator {
      
    PasswordAuthentication pa;
    
 
    public MyAuthentication(){
         
        String id = "qpwlxk123@gmail.com";       // 구글 ID
        String pw = "qpwlxk0084";          // 구글 비밀번호
 
        // ID와 비밀번호를 입력한다.
        pa = new PasswordAuthentication(id, pw);
      
    }
 
    // 시스템에서 사용하는 인증정보
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
}





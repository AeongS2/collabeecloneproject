package com.jm.dao;

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

class MyAuthentication extends Authenticator {
	 
    PasswordAuthentication account;
 
    public MyAuthentication(){
        String id = "anest_";
        String pw = "anestanestq1w2e3";
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}

public class SignUpSendEmailDao {
	
	public void signUpSendEmail(String email, int cert) {
		String content = "인증번호는 [" + cert + "] 입니다";
		
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable",  "true");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2");

        Authenticator auth = new MyAuthentication();
        Session session = Session.getDefaultInstance(p, auth);
        MimeMessage msg = new MimeMessage(session);
 
        try {
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress();
            
            from = new InternetAddress("anest_@naver.com");
            msg.setFrom(from);
 
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
 
            msg.setSubject("연봉1조의 콜라비 회원가입 인증번호", "UTF-8");
            msg.setText(content, "UTF-8");
            msg.setHeader("content-Type", "text/html");
 
            javax.mail.Transport.send(msg);
        } catch (AddressException addr_e){
            addr_e.printStackTrace();
        } catch (MessagingException msg_e){
            msg_e.printStackTrace();
        }
	    
		System.out.println("이메일 발송됨");
		
		
	}
}

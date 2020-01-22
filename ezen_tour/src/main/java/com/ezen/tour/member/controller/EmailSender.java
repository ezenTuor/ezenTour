package com.ezen.tour.member.controller;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {

	@Autowired private JavaMailSender mailSender;
	
	public void sendMail(String subject, String content, 
			String receiver, String sender) throws MessagingException {
		
		MimeMessage mimeMsg=mailSender.createMimeMessage();
		mimeMsg.setSubject(subject);
		mimeMsg.setText(content, "utf-8","html");
		mimeMsg.setRecipient(RecipientType.TO, 
				new InternetAddress(receiver));
		mimeMsg.setFrom(new InternetAddress(sender));
		
		mailSender.send(mimeMsg);
	}
	
}

package com.nobanryeo.petpal.admin.email.service;

import java.io.File;
import java.util.List;

import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.mail.internet.MimeUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.dto.EmailDTO;
import com.nobanryeo.petpal.admin.email.dao.EmailMapper;

@Service
public class EmailServiceImpl implements EmailService{
	private EmailMapper mapper;
	private JavaMailSender mailSender;
	@Autowired
	public EmailServiceImpl(EmailMapper mapper,JavaMailSender mailSender) {
		this.mapper = mapper;
		this.mailSender = mailSender;
	}

	@Override
	public void sendMail(EmailDTO dto, String path,List<String> mailList, String ext) {
		try {
            // 이메일 객체
            MimeMessage msg = mailSender.createMimeMessage();
            InternetAddress[] toAddr = new InternetAddress[mailList.size()];
            for(int i = 0; i<mailList.size(); i++) {
            	toAddr[i] = new InternetAddress(mailList.get(i));
            }

            // 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
            msg.setRecipients(RecipientType.TO, toAddr);
            
            MimeMessageHelper helper 
            = new MimeMessageHelper(msg, true, "UTF-8");
            helper.setFrom("tjdgns8482@gmail.com");
            helper.setSubject(dto.getSubject());
            helper.setText(dto.getMessage());
            DataSource dataSource = new FileDataSource(path);
            helper.addAttachment(MimeUtility.encodeText("petpalNewsLetter"+ext,"utf-8", "B"), dataSource);
            // 이메일 보내기
            mailSender.send(msg);
        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}

	@Override
	public List selectUserEmail() {
		// TODO Auto-generated method stub
		return mapper.selectUserEmail();
	}
}

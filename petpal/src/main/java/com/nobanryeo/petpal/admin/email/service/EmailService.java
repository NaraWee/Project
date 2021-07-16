package com.nobanryeo.petpal.admin.email.service;

import java.util.List;

import com.nobanryeo.petpal.admin.dto.EmailDTO;

public interface EmailService {
	public void sendMail(EmailDTO dto, String path, List<String> mailList, String ext);

	public List selectUserEmail();

	
}

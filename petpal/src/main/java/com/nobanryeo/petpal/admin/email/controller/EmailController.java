package com.nobanryeo.petpal.admin.email.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nobanryeo.petpal.admin.dto.EmailDTO;
import com.nobanryeo.petpal.admin.email.service.EmailService;

@Controller
@RequestMapping("/admin/*")  
public class EmailController {
	private final EmailService emailService;
	
	public EmailController(EmailService emailService) {
		this.emailService = emailService;
	}
	@RequestMapping("write.do") // 이메일 쓰기를 누르면 이 메소드로 맵핑되어서
    public String write() {
        return "/email/write"; // 다시 write jsp 페이지로 이동하고 jsp페이지에서 내용을 다 채운 뒤에 확인 버튼을 누르면 send.do로 넘어감
    }
 
    @RequestMapping("send.do") // 확인 (메일발송) 버튼을 누르면 맵핑되는 메소드
    public String send(@RequestParam("file") MultipartFile multipartFile,@ModelAttribute EmailDTO dto, Model model, HttpServletRequest request,
    		RedirectAttributes rttr) {
		System.out.println("singleFile : " + multipartFile);
		
		/* 파일을 저장할 경로 설정 */
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root : " + root);
		String filePath = root + "\\uploadFiles";
		File mkdir = new File(filePath);
		if(!mkdir.exists()) {
			mkdir.mkdir();
		}
		
		/* 파일명 변경 처리 */
		String originFileName = multipartFile.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		String saveName = UUID.randomUUID().toString().replace("-", "") + ext;
		System.out.println("saveName"+saveName);
		String path = filePath + "\\" + saveName;
		System.out.println(path);
		
		List<String> mailList = emailService.selectUserEmail();
		System.out.println(mailList);
		System.out.println();
		/* 파일을 저장한다. */
		try {
			multipartFile.transferTo(new File(filePath + "\\" + saveName));
			model.addAttribute("message", "파일 업로드 성공!!!!");
		}catch (Exception e) {
			e.printStackTrace();
			/* 실패시 파일 삭제 */
			new File(filePath + "\\" + saveName).delete();
			model.addAttribute("message", "파일 업로드 실패!!!!");
		}
        try {
        		emailService.sendMail(dto,path,mailList,ext); 
        		model.addAttribute("message", "뉴스레터 발송 성공");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("message", "이메일 발송 실패..."); // 이메일 발송이 실패되었다는 메시지를 출력
        }
        return "/admin/main/newsletterList"; 
    }
}

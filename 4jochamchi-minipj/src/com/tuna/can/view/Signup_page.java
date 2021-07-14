package com.tuna.can.view;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.Border;


import com.tuna.can.controller.TunaController;

public class Signup_page extends JFrame{

	private TunaController tunaController = new TunaController();
	
	public Signup_page() {
		
		super("Sign up");
		
		this.setLayout(null);
		this.setVisible(false);
		this.setSize(700,900);
		this.setLocation(600, 50);
		try {
			this.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		//제목 패널
		JPanel titlePanel = new JPanel();
		titlePanel.setLocation(0,0);
		titlePanel.setLayout(null);
		titlePanel.setBackground(Color.PINK);
		titlePanel.setSize(700,150);
		
		//정보입력 패널
		JPanel contentPanel = new JPanel();
		contentPanel.setLocation(0,150);
		contentPanel.setLayout(null);
		contentPanel.setBackground(Color.PINK);
		contentPanel.setSize(700,750);
		
		//제목 입력
		JLabel titleLable = new JLabel("회 원 가 입");
		titleLable.setBounds(240, 60, 350, 100);
		titleLable.setFont(new Font("회 원 가 입 ", Font.BOLD, 50));
		titlePanel.add(titleLable);
		
		//닉네임 패널
		JLabel nnLabel = new JLabel("닉 네 임 : ");
		nnLabel.setBounds(100, 60, 200, 50);
		nnLabel.setFont(new Font("닉 네 임 : ", Font.BOLD, 25));
		contentPanel.add(nnLabel);

		//닉네임 텍스트 상자 생성
		JTextField nnText = new JTextField(20);
		nnText.setBounds(220, 70, 350, 50);
		contentPanel.add(nnText);
		
		//아이디 라벨
		JLabel idLabel = new JLabel("아 이 디 : ");
		idLabel.setBounds(100, 140, 200, 50);
		idLabel.setFont(new Font("아 이 디 : ", Font.BOLD, 25));
		contentPanel.add(idLabel);

		//ID 텍스트 상자 생성
		JTextField idText = new JTextField(20);
		idText.setBounds(220, 150, 350, 50);
		contentPanel.add(idText);
		
		//로그인 PW 라벨
		JLabel pwLabel = new JLabel("비밀번호 : ",JLabel.CENTER);
		pwLabel.setBounds(75, 220, 150, 50);
		pwLabel.setFont(new Font("비밀번호 : ", Font.BOLD, 25));
		contentPanel.add(pwLabel);
		
		//전화번호 텍스트 상자 생성
		JPasswordField pwText = new JPasswordField(40);
		pwText.setBounds(220, 220, 350, 50);
		contentPanel.add(pwText);
		
		//전화번호 라벨
		JLabel phoneLabel = new JLabel("전화번호 : ",JLabel.CENTER);
		phoneLabel.setBounds(75, 300, 150, 50);
		phoneLabel.setFont(new Font("전화번호 : ", Font.BOLD, 25));
		contentPanel.add(phoneLabel);
		
		//전화번호 텍스트 상자 생성
		JTextField phoneText = new JTextField(40);
		phoneText.setBounds(220, 300, 350, 50);
		contentPanel.add(phoneText);

		//이메일 라벨
		JLabel emailLabel = new JLabel("이 메 일 : ",JLabel.CENTER);
		emailLabel.setBounds(75, 380, 150, 50);
		emailLabel.setFont(new Font("이 메 일: ", Font.BOLD, 25));
		contentPanel.add(emailLabel);
		
		//전화번호 텍스트 상자 생성
		JTextField emailText = new JTextField(40);
		emailText.setBounds(220, 380, 350, 50);
		contentPanel.add(emailText);
		
		//로그인 버튼 생성
		Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);
		ImageIcon create_user = new ImageIcon("image/createcomplete.png");
		ImageIcon rollover_create_user = new ImageIcon("image/rollover_createcomplete.png");
		JButton createUserBtn = new JButton(create_user);
		createUserBtn.setBounds(390, 500, 210, 90);
		createUserBtn.setBackground(Color.PINK);
		createUserBtn.setBorder(pinkborder);
		createUserBtn.setRolloverIcon(rollover_create_user);
	
		createUserBtn.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
			
				if(nnText.getText().isEmpty() || idText.getText().isEmpty() || pwText.getText().isEmpty()
						|| phoneText.getText().isEmpty() || emailText.getText().isEmpty()) {
					JOptionPane.showMessageDialog(null, "모든칸이 채워지지 않았습니다. \n 입력해주세요!", "경고", 0);
					return;
				}else {
					int result = 0;
				Map<String, Object> newMemberInfo = new HashMap<String, Object>();
				newMemberInfo.put("nickname", nnText.getText());
				newMemberInfo.put("id", idText.getText());
				newMemberInfo.put("pw", pwText.getText());
				newMemberInfo.put("phone", phoneText.getText());
				newMemberInfo.put("email", emailText.getText());
				result = tunaController.registUser(newMemberInfo);
				
				if(result>0) {
					JOptionPane.showConfirmDialog(null, "회원정보 등록에 성공하셨습니다. \n 로그인 창으로 이동합니다.", "성공", 0);
					new Login_page();
					
					dispose();
					
				}else {
					JOptionPane.showMessageDialog(null, "중복된 닉네임/아이디로 회원정보 등록에 실패했습니다.", "실패", 0);
				}
				
				}
			}
		});
		
		contentPanel.add(createUserBtn);
		
		
		
		this.add(titlePanel);
		this.add(contentPanel);
		this.setResizable(false);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
	}
	
	public static void main(String[] args) {
		
		new Signup_page();
	}

}
		

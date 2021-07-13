package com.tuna.can.view;


import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.border.Border;

import com.tuna.can.controller.MiniGame;
import com.tuna.can.controller.TunaController;
import com.tuna.can.model.dto.UserDTO;


/**
 * 메인페이지 레이아웃
 * @author NaraWee
 *
 */
public class Main_page extends JFrame{
	
	private TunaController tunaController = new TunaController();

	public Main_page() {
		super("MainPage");
		this.setLayout(null);
		this.setTitle("MainPage");
		this.setLocation(600, 50);
		this.setSize(700,900);
		try {
			this.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		JPanel profilePanel = new JPanel();						// 프로필사진, 닉네임 들어갈 패널
		JPanel storePanel = new JPanel();						// 상점으로 이동할 버튼 들어갈 패널

		Font font = new Font(null, Font.BOLD, 20);



		ImageIcon basicIcon = new ImageIcon("image/basicprofile.PNG");
		ImageIcon store = new ImageIcon("image/store.PNG");
		ImageIcon logout = new ImageIcon("image/logout.PNG");
		ImageIcon logoutred = new ImageIcon("image/logoutred.PNG");


		JLabel nickName = new JLabel(changeNickname());			// 닉네임 들어갈 라벨
		JButton button1 = new JButton("전체 글보기");				// 전체글보기 버튼
		JButton button2 = new JButton("비밀 글보기");				// 비밀글보기 버튼
		JButton button3 = new JButton("친구 글보기");				// 친구글보기 버튼
		JButton button4 = new JButton("친구 목록");				// 친구목록 버튼
		JButton button5 = new JButton("마이페이지");				// 마이페이지 버튼
		JButton button6 = new JButton("출석게임");					// 미니게임 출석하기 버튼
		JButton storeButton = new JButton(store);				// 상점 버튼
		JButton logoutButton = new JButton(logout);				// 로그아웃 버튼
		logoutButton.setRolloverIcon(logoutred);

		if(MyPage.myCharacterImage != null) {
			JLabel imageLabel1 = new JLabel(MyPage.myCharacterImage);
			
			// profileImage 설정
			imageLabel1.setBounds(50, 25, 600, 220);
			imageLabel1.setBackground(Color.pink);
			profilePanel.add(imageLabel1);
		}else {
			JLabel imageLabel = new JLabel(basicIcon);	
			imageLabel.setBounds(50, 25, 600, 220);
			imageLabel.setBackground(Color.pink);
			profilePanel.add(imageLabel);
		}

		button1.setFont(font);
		button2.setFont(font);
		button3.setFont(font);
		button4.setFont(font);
		button5.setFont(font);
		button6.setFont(font);

		// profilePanel 설정
		profilePanel.setLayout(null);
		profilePanel.setBounds(0, 0, 700, 300);
		profilePanel.setBackground(Color.pink);



		// nickName 설정
		nickName.setBounds(200, 235, 300, 50);
		nickName.setFont(new Font("",Font.BOLD,30));
		nickName.setHorizontalAlignment(JLabel.CENTER);
		profilePanel.add(nickName);


		
  
		// button들 설정
		button1.setBounds(50, 10, 570, 80);
		button2.setBounds(50, 100, 570, 80);
		button3.setBounds(50, 190, 570, 80);
		button4.setBounds(50, 280, 570, 80);
		button5.setBounds(50, 370, 570, 80);
		button6.setBounds(50, 460, 570, 80);
   

		JPanel listPanel = new JPanel();
		listPanel.setLayout(null);
		listPanel.setPreferredSize(new Dimension(660,560));
		listPanel.setBackground(Color.pink);
		listPanel.add(button1);
		listPanel.add(button2);
		listPanel.add(button3);
		listPanel.add(button4);
		listPanel.add(button5);
		listPanel.add(button6);



		JScrollPane scrollPane = new JScrollPane(listPanel);
		scrollPane.setPreferredSize(new Dimension(685,460));
		scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
		int width = scrollPane.getPreferredSize().width; // 적절한 폭
		int height = scrollPane.getPreferredSize().height; // 적절한 높이
		scrollPane.setBounds(0, 300, width, height);
		scrollPane.setBackground(Color.pink);

		this.getContentPane().add(scrollPane);

	


		// storePanel 설정
		storePanel.setLayout(null);
		storePanel.setBounds(0, 750, 700, 150);
		storePanel.setBackground(Color.pink);

		// storeButton 설정
		Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);
		storeButton.setBounds(30, 30, 55, 55);
		storeButton.setBackground(Color.pink);
		storeButton.setBorder(pinkborder);
		storePanel.add(storeButton);


		// storeButton 설정
		logoutButton.setBounds(600, 30, 60, 60);
		logoutButton.setBackground(Color.pink);
		logoutButton.setBorder(pinkborder);
		storePanel.add(logoutButton);


		/*============================ 버튼 설정 ============================*/

		// 로그아웃 버튼 눌렀을 때
		logoutButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				if(e.getSource() == logoutButton) {
					int answer = JOptionPane.showConfirmDialog(null, "정말 로그아웃하시겠습니까?", "logout",0);

					if(answer == JOptionPane.YES_OPTION){
						//사용자가 yes를 눌렀을 떄
						JOptionPane.showMessageDialog(null, "로그아웃되었습니다.", "logout",1);
						new Login_page();
						dispose();
					} else{
						//사용자가 Yes 외 값 입력시
						JOptionPane.showMessageDialog(null, "로그아웃을 취소합니다.", "logout",0);
					}
				}
			}
		});

		// 상점 버튼 눌렀을 때
		storeButton.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new Store();
				dispose();				
			}

		});

		// 전체글보기 버튼 눌렀을 때
		button1.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new BoardList();
				dispose();				
			}

		});

		// 비밀글보기 버튼 눌렀을 때
		button2.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new SecrectBoardList();
				dispose();				
			}

		});

		// 친구글보기 버튼 눌렀을 때
		button3.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new FriendBoardList();
				dispose();				
			}

		});

		// 친구 목록 버튼 눌렀을 때
		button4.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new FriendsList();
				dispose();				
			}

		});

		// 마이페이지 버튼 눌렀을 때
		button5.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {				
				new MyPage();
				dispose();				
			}

		});

		// 출석게임 버튼 눌렀을 때
		button6.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {	

				MiniGame hg = new MiniGame();
				int num = hg.getCountNum();

				if(num <= 0) {
					button6.setEnabled(false);
				} else {
					new Game_view();
					dispose();				
				}
			}

		});





		this.add(storePanel);
		this.add(profilePanel);

		this.setResizable(false);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	public static void main(String[] args) {

		new Main_page();
	}

	public String changeNickname() {
		String nickname = tunaController.checkNickname(TunaController.loginMemberId);



		return nickname;

	}
}



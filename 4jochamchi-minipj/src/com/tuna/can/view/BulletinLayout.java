package com.tuna.can.view;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.border.Border;

import com.tuna.can.controller.TunaController;
import com.tuna.can.model.dto.AddFriendDTO;
import com.tuna.can.model.dto.BulletinDTO;
import com.tuna.can.model.dto.CommentDTO;
import com.tuna.can.model.dto.FriendDTO;

/**
 * 
 * <pre>
 *  게시글 보기 레이아웃
 * </pre> 
 * @author NaraWee
 *
 */
public class BulletinLayout extends JFrame{

	public BulletinLayout() {}

	public BulletinLayout(int boradNo) {
		super("게시글 보기");

		TunaController tunaController = new TunaController();



		// 게시글 번호
		int boardNumber = boradNo;

		// 로그인
		int userNo = tunaController.checkUserNo(tunaController.loginMemberId);	

		// 게시글 DTO
		BulletinDTO board = new BulletinDTO();
		board = tunaController.selectBulletinContent(boardNumber);

		// 댓글 DTO
		List<CommentDTO> selectComment = tunaController.selectComment(boardNumber);

		Border border = BorderFactory.createEtchedBorder(1);
		Border border2 = BorderFactory.createDashedBorder(Color.darkGray);
		Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);	
		Border whiteborder = BorderFactory.createLineBorder(Color.white, 1);	
		Border lightgrayborder = BorderFactory.createLineBorder(Color.lightGray, 1);	
		Border bbb = BorderFactory.createLineBorder(MyPage.backgroundColor, 2);	


		ImageIcon home = new ImageIcon("image/home.PNG");

		this.setTitle("게시글보기");
		this.setLayout(null);
		this.setSize(700,900);
		this.setLocation(600, 50);
		try {
			this.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
		} catch (IOException e1) {
			e1.printStackTrace();
		}

		ImageIcon addfriend = new ImageIcon("image/addfriend.PNG");
		ImageIcon send = new ImageIcon("image/send.PNG");

		JPanel topPanel = new JPanel();											// Back, 제목 들어갈 패널
		JPanel bulletinPanel = new JPanel();									// 게시글, 작성자닉넴, 친구추가 들어갈 패널
		JPanel commentsPanel = new JPanel();									// 댓글목록 패널
		JPanel writePanel = new JPanel();										// 댓글쓰는 패널

		JLabel topLabel = new JLabel(board.getTitle());							// 제목 들어갈 라벨(데이터 불러와야됨)
		JButton backButton = new JButton(home);									// 메인으로가기 버튼
		JLabel nickName = new JLabel(board.getUserNickname());					// 닉네임 들어갈 라벨(데이터 불러와야됨)
		JTextArea bulletin = new JTextArea(board.getBoardContents());			// 게시글 들어갈 라벨(데이터 불러와야됨)
		JLabel date = new JLabel(board.getEnrollDate());						// 게시글 작성된 날짜 들어갈 라벨(데이터 불러와야됨)									// 댓글목록 보이는 라벨(데이터 불러와야됨)
		JLabel cm = new JLabel("댓글 : ");										// 댓글
		JTextField writeComment = new JTextField();								// 댓글 쓸 수있는 텍스트박스
		JButton inputButton = new JButton(send);								// 댓글 입력 버튼


		// topPanel 설정값
		topPanel.setLayout(null);
		topPanel.setLocation(0, 0);
		topPanel.setSize(700, 100);
		topPanel.setBackground(Color.pink);
		topPanel.setBorder(border);

		// 뒤로가기버튼 설정
		backButton.setBounds(30, 25, 55, 55);
		backButton.setBackground(Color.pink);
		backButton.setBorder(pinkborder);
		topPanel.add(backButton);

		// 제목 설정
		topLabel.setHorizontalAlignment(JLabel.CENTER);
		topLabel.setBounds(115, 0, 470, 100);
		topLabel.setFont(new Font("휴먼둥근헤드라인",Font.BOLD, 30));
		topPanel.add(topLabel);


		// bulletinPanel 설정값		
		bulletinPanel.setLayout(null);
		bulletinPanel.setLocation(0, 100);
		bulletinPanel.setSize(700, 450);
		bulletinPanel.setBackground(Color.pink);

		// 작성자 닉네임 설정
		nickName.setLocation(490, 25);
		nickName.setSize(100, 25);
		nickName.setHorizontalAlignment(JLabel.CENTER);
		bulletinPanel.add(nickName);


		// 게시글 설정
		bulletin.setLocation(50, 60);
		bulletin.setSize(600, 350);
		if(MyPage.backgroundColor == null) {
			bulletin.setBackground(Color.white);
		} else {
			bulletin.setBackground(MyPage.backgroundColor);
			bulletin.setBorder(bbb);
		}
		if(MyPage.font == null) {
		} else {
			bulletin.setFont(MyPage.font);
		}
		bulletinPanel.add(bulletin);

		JScrollPane scrollPane = new JScrollPane(bulletin);
		scrollPane.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
		scrollPane.setBounds(60, 165, 589, 344);
		scrollPane.setBorder(whiteborder);
		this.getContentPane().add(scrollPane);

		bulletin.setEditable(false);


		// 날짜라벨 설정
		date.setLocation(50, 410);
		date.setSize(600, 35);
		date.setHorizontalAlignment(JLabel.RIGHT);
		bulletinPanel.add(date);


		// commentsPanel 설정값
		commentsPanel.setLayout(null);
		commentsPanel.setLocation(0, 550);
		commentsPanel.setSize(700, 200);
		commentsPanel.setBackground(Color.pink);



		// 댓글목록 설정(내용 불러와야함)

		JPanel commentList = null;

		for(int i = 0; i < selectComment.size(); i++) {

			commentsPanel.setLayout(null);
			commentsPanel.setPreferredSize(new Dimension(550,50*(i+1)));
			commentsPanel.setBackground(Color.pink);

			commentList = new JPanel();

			commentList.setLayout(null);

			commentList.setBounds(0,(i * 50),700,50);

			commentList.setBorder(lightgrayborder);

			CommentDTO commentDTO = selectComment.get(i);
			JLabel commentNickName = new JLabel(commentDTO.getUserNickname() + " : " + commentDTO.getCommentContent());
			commentNickName.setLayout(null);
			commentNickName.setBounds(5, 2, 595, 50);
			commentList.setBackground(new Color(255, 240, 245));
			commentList.add(commentNickName);

			commentsPanel.add(commentList);

		}

		JScrollPane scrollbar = new JScrollPane(commentsPanel);
		scrollbar.setPreferredSize(new Dimension(600,200));
		scrollbar.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
		int width = scrollbar.getPreferredSize().width;
		int height = scrollbar.getPreferredSize().height;
		scrollbar.setBounds(50,550,width,height);
		scrollbar.setBackground(Color.pink);

		scrollbar.setBorder(pinkborder);

		this.getContentPane().add(scrollbar);



		// writePanel 설정값
		writePanel.setLayout(null);
		writePanel.setLocation(0, 750);
		writePanel.setSize(700, 200);
		writePanel.setBackground(Color.pink);

		// 댓글라벨
		cm.setLocation(50, 10);
		cm.setSize(50, 40);
		cm.setFont(new Font("댓글 : ",Font.BOLD, 14));
		writePanel.add(cm);

		// 댓글입력창 설정
		writeComment.setLocation(100, 10);
		writeComment.setSize(475, 40);
		writeComment.setBorder(border);
		writePanel.add(writeComment);

		// 댓글입력 버튼 설정
		inputButton.setLocation(580,13);
		inputButton.setSize(70, 40);
		inputButton.setBackground(Color.pink);
		inputButton.setBorder(pinkborder);
		writePanel.add(inputButton);


		JButton plusFriend = new JButton(addfriend);							// 친구추가 들어갈 라벨

		// 친구추가 설정
		plusFriend.setLocation(600, 15);
		plusFriend.setSize(45, 45);
		plusFriend.setBackground(Color.pink);
		plusFriend.setBorder(pinkborder);
		bulletinPanel.add(plusFriend);


		// LIST_NO 가 2 일때 비밀 게시글이므로 댓글 입력 불가, 친구추가버튼 X
		if(board.getListNo() == 2) {

			writeComment.setEnabled(false);
			writeComment.setText(" 비밀글에는 댓글 입력이 불가능합니다.");
			inputButton.setEnabled(false);
			nickName.setVisible(false);
			plusFriend.setVisible(false);

		} else if(board.getUserNo() == userNo) {
			// 내 게시글일 때 친구추가 불가
			System.out.println(2);
			plusFriend.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {

					if(e.getSource() == plusFriend) {

						JOptionPane.showMessageDialog(null,"친구추가를 할 수 없는 대상입니다.", "친구추가",1);
						writeComment.requestFocus();

					}				
				}
			});


		} else {
			System.out.println(3);

			// 친구추가 버튼 눌렀을 때
			plusFriend.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {

					if(e.getSource() == plusFriend) {

						List<FriendDTO> friend = new ArrayList<>();
						friend = tunaController.selectFriends(userNo);

						BulletinDTO board = new BulletinDTO();
						board = tunaController.selectBulletinContent(boardNumber);


						boolean b = true;
						// 만약 이미 친구 목록에 있으면 친구요청 불가
						for(int i = 0; i < friend.size(); i++) {
							FriendDTO friendDTO = friend.get(i);
							if(friendDTO.getFriendsNickname().equals(board.getUserNickname())) {
								JOptionPane.showMessageDialog(null,"이미 친구입니다.", "친구추가",0);
								b = false;
								break;
							}
						}

						if(b) {
							// 친구 목록에 없을때 친구요청 보내기
							JOptionPane.showMessageDialog(null,"친구요청을 보냈습니다.", "친구추가",1);

							int result = 0;

							AddFriendDTO addFriend = new AddFriendDTO();
							addFriend.setUserNo(board.getUserNo());
							addFriend.setRequsetFriendNo(userNo);

							result = tunaController.insertRequest(addFriend);

							if(result > 0) {
								System.out.println("친구요청 성공");
							} else {
								System.out.println("친구요청 실패");
							}


						}


					}
					writeComment.requestFocus();
				}
			});

		}

		// 댓글입력 버튼 눌렀을 때
		inputButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				CommentDTO comment = new CommentDTO();

				if(e.getSource() == inputButton) {

					// getText() : JTextField에서 입력한 값을 가져오는 메소드
					String text = writeComment.getText();

					int result = 0;

					comment.setBoardNo(boardNumber);
					comment.setCommentContent(text);
					comment.setUserNo(userNo);

					result = tunaController.insertComment(comment);


					if(result >0) {
						System.out.println("댓글 등록 성공");

						// 댓글 추가 후 Insert시 반영하기 위해 refresh작업
						new BulletinLayout(boradNo);
						dispose();				


					} else {
						System.out.println("댓글 등록 실패");
					}

					writeComment.requestFocus();

				}

			}
		});

		// 뒤로가기 버튼 눌렀을 때
		backButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				if(e.getSource() == backButton) {
					new Main_page();
					dispose();		
				}				
			}
		});



		JPanel sidePanel1 = new JPanel();
		sidePanel1.setLayout(null);
		sidePanel1.setBounds(0,100,50,800);
		sidePanel1.setBackground(Color.PINK);
		JPanel sidePanel2 = new JPanel();
		sidePanel2.setLayout(null);
		sidePanel2.setBounds(650,100,50,750);
		sidePanel2.setBackground(Color.PINK);

		this.add(sidePanel1);
		this.add(sidePanel2);

		this.add(topPanel);
		this.add(bulletinPanel);
		this.add(writePanel);

		this.setResizable(false);		
		this.setVisible(true);			
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}

}

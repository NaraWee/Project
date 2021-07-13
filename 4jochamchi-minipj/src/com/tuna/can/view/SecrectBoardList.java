
package com.tuna.can.view;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
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
import javax.swing.SwingConstants;
import javax.swing.border.Border;

import com.tuna.can.controller.TunaController;
import com.tuna.can.model.dto.BoardDTO;
import com.tuna.can.model.dto.BulletinDTO;

/**
 * <pre>
 * 비밀게시글 목록 페이지
 * </pre>
 * @author Hyelim Jeon + NaraWee
 *
 */
public class SecrectBoardList extends JFrame{

	public SecrectBoardList() {
		super("SecrectBoardList");

		TunaController tunaController = new TunaController();


		int userNo = tunaController.checkUserNo(tunaController.loginMemberId);

		Border border = BorderFactory.createLineBorder(Color.BLACK, 1);	
		this.setLayout(null);
		this.setSize(700, 900);
		this.setLocation(600, 50);

		//아이콘
		try {
			this.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
		} catch (IOException e) {
			e.printStackTrace();
		}

		//각위치 패널 생성
		JPanel topPanel = new JPanel();
		topPanel.setLayout(null);
		topPanel.setBounds(0, 0, 700, 100);
		topPanel.setBackground(Color.pink);

		JPanel midlePanel = new JPanel();
		midlePanel.setBackground(Color.pink);

		JPanel bottomPanel = new JPanel();
		bottomPanel.setLayout(null);
		bottomPanel.setBackground(Color.pink);
		bottomPanel.setBounds(0, 800, 700, 100);



		// 뒤로가기 버튼
		ImageIcon home = new ImageIcon("image/home.PNG");
		Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);
		JButton backB = new JButton(home);
		backB.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				new Main_page();
				dispose();
			}
		});

		backB.setBounds(30, 30, 55, 55);
		backB.setBackground(Color.pink);
		backB.setBorder(pinkborder);
		topPanel.add(backB);

		//내게시글 글씨
		JLabel lbl = new JLabel(" 비 밀 게 시 글");
		lbl.setFont(new Font("휴먼둥근헤드라인",Font.BOLD, 30));
		lbl.setHorizontalAlignment(JLabel.CENTER);
		lbl.setBounds(100, 40, 500, 50);
		topPanel.add(lbl);


		//전체글 리스트 
		BoardDTO board = new BoardDTO();

		JPanel allList = null;
		List<BoardDTO> selectSecretList = tunaController.selectSecretBoard(userNo);


		for(int i = 0; i < selectSecretList.size(); i++) {

			midlePanel.setLayout(null);
			midlePanel.setPreferredSize(new Dimension(660,100*i));


			allList = new JPanel();
			allList.setLayout(null);
			allList.setBackground(Color.pink);

			allList.setBounds(0,(i * 100),680,100);
			allList.setBorder(pinkborder);


			ImageIcon underline =new ImageIcon("image/List.PNG");
			JLabel subject = new JLabel(underline);
			BoardDTO boardDTO = selectSecretList.get(i);
			// 게시글내용으로 들어갈 버튼
			JButton title = new JButton(boardDTO.getTitle());
			title.setLayout(null);
			title.setBounds(50, 40, 450, 30);
			title.setBackground(Color.pink);
			title.setBorder(pinkborder);
			title.setFont(new Font("휴먼둥근헤드라인" ,Font.ITALIC, 20));
			title.setHorizontalAlignment(SwingConstants.LEFT);

			// 게시글제목 눌렀을 때 게시글 내용으로 들어가기
			title.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {

					if(e.getSource() == title) {

						new BulletinLayout(boardDTO.getBoardNo());
						dispose();

					}				
				}
			});


			subject.setLayout(null);
			subject.setBounds(40, 30, 600, 80);
			allList.add(subject);
			allList.add(title);


			ImageIcon delete = new ImageIcon("image/delete.PNG");
			JButton deleteButton = new JButton(delete);
			deleteButton.setBackground(Color.pink);
			deleteButton.setBorder(pinkborder);
			deleteButton.setBounds(580,28,50,40);
			deleteButton.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent e) {

					if(e.getSource() == deleteButton) {


						// 삭제 버튼 눌렀을 떄
						int answer = JOptionPane.showConfirmDialog(null, "삭제하시겠습까?", "삭제",0);

						if(answer == JOptionPane.YES_OPTION){
							//사용자가 yes를 눌렀을 떄
							JOptionPane.showMessageDialog(null, "삭제되었습니다.", "삭제",1);
							board.setUserNo(userNo);
							board.setTitle(boardDTO.getTitle());
							System.out.println(boardDTO.getTitle());
							int result = tunaController.deleteSecretBoard(board);

							new SecrectBoardList();
							dispose();	

						}

					}				
				}
			});


			ImageIcon edit = new ImageIcon("image/edit.PNG");
			JButton editButton = new JButton(edit);
			editButton.setBackground(Color.pink);
			editButton.setBorder(pinkborder);
			editButton.setBounds(530,28,50,40);

			editButton.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {

					if(e.getSource() == editButton) {

						new ModifyTextArea(boardDTO.getBoardNo());
						dispose();

					}

				}				

			});


			allList.add(deleteButton);
			allList.add(editButton);

			midlePanel.add(allList);


		}
		JScrollPane scrollbar = new JScrollPane(midlePanel);
		scrollbar.setPreferredSize(new Dimension(685,700));
		scrollbar.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
		int width = scrollbar.getPreferredSize().width;
		int height = scrollbar.getPreferredSize().height;
		scrollbar.setBounds(0,100,width,height);
		scrollbar.setBackground(Color.pink);

		scrollbar.setBorder(pinkborder);

		this.getContentPane().add(scrollbar);

		//글쓰러 가기 버튼
		ImageIcon writee = new ImageIcon("image/write.PNG");
		JButton write  = new JButton(writee);
		write.setBackground(Color.pink);
		write.setBorder(pinkborder);
		write.setBounds(580, 0, 90, 50);
		write.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				new Text_Area();
				dispose();
			}
		});

		bottomPanel.add(write);



		this.add(topPanel);
		this.add(bottomPanel);


		this.setResizable(false);
		this.setVisible(true);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

	}


}




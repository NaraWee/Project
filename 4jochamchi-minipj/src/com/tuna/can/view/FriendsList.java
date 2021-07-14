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
import javax.swing.border.Border;

import com.tuna.can.controller.TunaController;
import com.tuna.can.model.dto.AddFriendDTO;
import com.tuna.can.model.dto.FriendDTO;
import com.tuna.can.service.TunaService;


/**
 * @author 김현빈	
 *<pre>
 *	친구목록 뷰 클래스
 *</pre>
 */
public class FriendsList extends JFrame{
	
	TunaController tunaController = new TunaController();
	int userNo = tunaController.checkUserNo(tunaController.loginMemberId);

	public FriendsList() {
		
		// 미니 창 이름 설정
		super("Friends List");
			
			Border panelborder = BorderFactory.createLineBorder(Color.BLACK, 1);
			Border button2 = BorderFactory.createLineBorder(new Color(255, 240, 245));
			this.setLayout(null);
			this.setSize(700, 900);
			this.setLocation(600, 50);
			
			try {
				
				this.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
			this.setBackground(Color.pink);
			
			// 상단 판넬
			JPanel topPanel = new JPanel();
			topPanel.setLayout(null);
			topPanel.setBounds(0,0,700,100);
			topPanel.setBackground(Color.pink);
			
			// 상단 라벨
			JLabel topLabel = new JLabel("친구 목록");
			topLabel.setLayout(null);
			topLabel.setBounds(270, 27, 700, 50);
			topLabel.setFont(new Font("휴먼둥근헤드라인" ,Font.BOLD, 30));
			
			
			// 상단 판넬에 라벨 
			topPanel.add(topLabel);
			
			// 뒤로 가기 버튼
			
			Border lightgrayborder = BorderFactory.createLineBorder(Color.lightGray, 1);
			Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);
			ImageIcon home = new ImageIcon("image/home.PNG");
			JButton backB = new JButton(home);
			backB.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					new Main_page();
						dispose();
				}
			});
			backB.setBounds(30, 25, 55, 55);
			backB.setBackground(Color.pink);
			backB.setBorder(pinkborder);
			topPanel.add(backB);
			
			/*------------------------------------------------------------------------------------------*/
			
			JPanel middlePanel = new JPanel();
			middlePanel.setLayout(null);
			middlePanel.setBackground(Color.pink);
			List<FriendDTO> friends = new ArrayList<FriendDTO>();
			TunaController controller = new TunaController();

			friends = controller.selectFriendsList(controller.loginMember.getUserNo());
			controller.loginMember.getUserNo();
			
			
			// 버튼 이미지 
			ImageIcon delete = new ImageIcon("image/delete.png");
			ImageIcon deletered = new ImageIcon("image/deleteRed.png");
			JPanel friendsPanel = null;
			JLabel nickName = null;
			JLabel imageLabel = null;
			
			// 페널 객체만들기
			for(int i = 0; i <friends.size(); i++) {
				
				middlePanel.setLayout(null);
				middlePanel.setPreferredSize(new Dimension(660, 100*(i+1)));
				middlePanel.setBackground(Color.pink);
				
				// 친구 페널
				friendsPanel = new JPanel();
				friendsPanel.setLayout(null);

				friendsPanel.setBounds(0,i*100,700,100);
				friendsPanel.setBackground(new Color(255, 240, 245));
				friendsPanel.setBorder(lightgrayborder);
				
				// 닉네임
				nickName = new JLabel();
				Integer no = friends.get(i).getUserNO();
				JLabel userNo = new JLabel(no.toString());
				userNo.setVisible(false);
				nickName.setLayout(null);
				Integer fno = friends.get(i).getFriendsNo();
				JLabel friendNo = new JLabel(fno.toString());
			    friendNo.setVisible(false);
			    
				nickName.setBounds(310, 27, 700, 50);
				// 객체 연결용
				nickName.setText(friends.get(i).getFriendsNickname());

				// 이미지 용
				imageLabel = new JLabel();
				imageLabel.setLayout(null);
				imageLabel.setBounds(57,27,72,60);
				
				JButton button = new JButton(delete);
				button.setLayout(null);
				button.setBackground(new Color(255, 240, 245));
				button.setBorder(button2);
				button.setBounds(550,27,90,40);
				button.setRolloverIcon(deletered);
				button.addActionListener(new ActionListener() {
					
					@Override
					public void actionPerformed(ActionEvent e) {
						int result = JOptionPane.showConfirmDialog(null, "정말 친구를 삭제하시겠습니까? \n 정말요?", "친구 목록 삭제",0);
						if(result == JOptionPane.YES_OPTION) {
							// 딜리트
							TunaService ts = new TunaService();
							ts.deleteFriend(Integer.parseInt(userNo.getText()), Integer.parseInt(friendNo.getText()));
							new FriendsList();
							dispose();
							
						} else {
							System.out.println("삭제 취소");
						}						
					}
				});
				
				
				friendsPanel.add(button);
				friendsPanel.add(imageLabel);
				friendsPanel.add(nickName);
				middlePanel.add(friendsPanel);
				}
			// 스크롤
			JScrollPane scrollbar = new JScrollPane(middlePanel);
			scrollbar.setPreferredSize(new Dimension(685,700));
			scrollbar.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED);
			int width = scrollbar.getPreferredSize().width;
			int height = scrollbar.getPreferredSize().height;
			scrollbar.setBounds(0,100,width,height);
			scrollbar.setBorder(pinkborder);
			scrollbar.setBackground(Color.pink);

			/*------------------------------------------------------------------------------------------*/
			
			// 하단 판넬
			JPanel bottomPanel = new JPanel();
			bottomPanel.setLayout(null);

			bottomPanel.setBackground(Color.pink);
			
			bottomPanel.setBounds(0, 800, 700, 70);
			
			// 마이 프레임에 판넬 추가
			this.add(topPanel);
			this.add(bottomPanel);
			this.getContentPane().add(scrollbar);
			this.setResizable(false);
			this.setVisible(true);
			this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			
			AddFriendDTO list = new AddFriendDTO();
			list = tunaController.selectPlusFriend(controller.loginMember.getUserNo());
			
			AddFriendDTO friendNickName = new AddFriendDTO();
			friendNickName = tunaController.selectNickName(controller.loginMember.getUserNo());
			if(list != null) {
				
				int result = JOptionPane.showConfirmDialog(null, friendNickName.getRequestFriendNickName()+" 님이 친구 요청을 했어요!!", "친구 수락", 0);
				if(result == JOptionPane.YES_OPTION) {
					tunaController.RequestFriends(list);
					new FriendsList();
					dispose();
				} else {
					tunaController.rejectRequest(list);
					
				}
				  
			}
		}
	
	public static void main(String[] args) {
		
		new FriendsList();
	}
}

	





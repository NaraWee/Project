package com.tuna.can.controller;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.Border;

import com.tuna.can.model.dto.FriendDTO;

/**
 * @author 김현빈
 * <pre>
 * 친구목록에 추가 되는 패널 생성하는 클래스
 * </pre>
 */
public class FriendsList_controller extends JPanel{
		
	public FriendsList_controller() {
		
		super();
	}

	public FriendsList_controller(int number, JPanel friendsPanel,JFrame myFrame,FriendDTO friend, JLabel nickName,JButton button, JLabel imageLabel) {


		// 친구 페널 쌓기
		friendsPanel.setBounds(0,(number * 100)+100,600,100);

		// 친구 닉네임 설정
		
		nickName.setText(friend.getFriendsNickname());
		
		ImageIcon photo = new ImageIcon("image/profile.png");
		//친구 이미지 설정
		imageLabel.setIcon(photo);

		
		// 버튼에 액션 넣기
		button.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				int result = JOptionPane.showConfirmDialog(myFrame, "정말 친구를 삭제하시겠습니까? \n 정말요?", "친구 목록 삭제",0);
				if(result == JOptionPane.YES_OPTION) {
					
					// 딜리트
					
				} else {
					System.out.println("삭제 취소");
				}
			}
			
		});
		
		// 친구페널에 설정한 값들 추가
		friendsPanel.add(imageLabel);
		friendsPanel.add(nickName);
		friendsPanel.add(button);
		
		// 메인프레임에 설정하기
		myFrame.add(friendsPanel);
		
		
	}

}
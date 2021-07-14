package com.tuna.can.view;

import java.awt.CardLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
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
import javax.swing.JPanel;
import javax.swing.border.Border;

import com.tuna.can.controller.InventoryButtonController;
import com.tuna.can.controller.StoreItemButtonController;
import com.tuna.can.controller.TunaController;
import com.tuna.can.model.dto.StoreItemDTO;
import com.tuna.can.model.dto.UserInventoryDTO;

/**
 * <pre>
 * 상점
 * </pre>
 * @author kim-sunwoong
 *
 */
public class Store{

	private TunaController controller = new TunaController();
	
	public Store() {
		JFrame frame = new JFrame("Store");
		
	      try {
	    	  frame.setIconImage(ImageIO.read(new File("image/logoBig.PNG")));
	       } catch (IOException e1) {
	          e1.printStackTrace();
	       }
		
			Font font = new Font("상점폰트", Font.BOLD, 50);

			frame.setLayout(null);
			frame.setSize(700, 900);
			frame.setLocation(600, 50);
			JPanel colorPanel = new JPanel();
			colorPanel.setBackground(new Color(255, 240, 245));
			colorPanel.setSize(700, 900);
			colorPanel.setLayout(null);

			// 최상단 패널
			JPanel topPanel = new JPanel();
			topPanel.setLayout(null);
			topPanel.setBounds(0, 0, 700, 125);
			topPanel.setBackground(Color.pink);

			// 상점 글씨
			JLabel storeLabel = new JLabel("Store");
			storeLabel.setBounds(270, 40, 170, 50);
			storeLabel.setFont(new Font("휴먼둥근헤드라인",Font.BOLD, 30));
			topPanel.add(storeLabel);

			// 뒤로가기 버튼
			ImageIcon home = new ImageIcon("image/home.PNG");
			Border pinkborder = BorderFactory.createLineBorder(Color.pink, 1);
			JButton backB = new JButton(home);
			backB.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					new Main_page();
					frame.dispose();
				}
			});
			backB.setBounds(30, 25, 55, 55);
			backB.setBackground(Color.pink);
			backB.setBorder(pinkborder);
			topPanel.add(backB);
			
			
			int coin = 0;
			coin = controller.selectUSerCoin(controller.loginMember.getUserNo());
			JLabel coinLabel = new JLabel();
			coinLabel.setBounds(565, 55, 100, 30);
			coinLabel.setText("보유 코인 " + coin);
			topPanel.add(coinLabel);
			
			// 중간 패널
			JPanel midPanel = new JPanel();
			midPanel.setLayout(new GridLayout(1, 3));
			midPanel.setBounds(45, 170, 600, 130);
			
			midPanel.setBackground(new Color(255, 240, 245));
			
			JButton characterButton = new JButton("캐릭터");

			JButton backgroundButton = new JButton("배경");

			JButton fontButton = new JButton("폰트");

			midPanel.add(characterButton);
			midPanel.add(backgroundButton);
			midPanel.add(fontButton);
			
			// 하단 패널
//			하단 패널에 버튼 9개씩 추가하여 
//			중간 패널 버튼 클릭시 하단패널 버튼 변경
//			중간에 ~선택 ~ 구매 하시겠습니까 ~ 현재 금액 생성
			JPanel botPanel = new JPanel();
			CardLayout card = new CardLayout();
			botPanel.setLayout(card);
			botPanel.setBounds(45, 350, 600, 500);

			JPanel characterPanel = new JPanel();
			characterPanel.setLayout(new GridLayout(3,3));
			characterPanel.setBounds(45, 350, 600, 500);
			characterPanel.setBackground(Color.pink);

			JPanel backgroundPanel = new JPanel();
			backgroundPanel.setLayout(new GridLayout(3,3));
			backgroundPanel.setBounds(45, 350, 600, 500);
			backgroundPanel.setBackground(Color.orange);

			JPanel fontPanel = new JPanel();
			fontPanel.setLayout(new GridLayout(3,3));
			fontPanel.setBounds(45, 350, 600, 500);
			fontPanel.setBackground(Color.gray);
			TunaController controller = new TunaController();
			
			Map<Integer, ArrayList<StoreItemDTO>> storeItemMap = new HashMap<Integer, ArrayList<StoreItemDTO>>();
			
			List<StoreItemDTO> storeItem = new ArrayList<StoreItemDTO>();
			
			storeItemMap = controller.selectStoreItem();
			
			for(int i = 0; i < 9; i++) {
				if(i < storeItemMap.get(1).size()) {
					
					characterPanel.add(new StoreItemButtonController(storeItemMap.get(1).get(i),frame));
				} else {
					
					characterPanel.add(new JButton("아이템 없음"));
				}
			}
			
			for(int i = 0; i < 9; i++) {
				if(i < storeItemMap.get(2).size()) {
					backgroundPanel.add(new StoreItemButtonController(storeItemMap.get(2).get(i),frame));
				} else {
					
					backgroundPanel.add(new JButton("아이템 없음"));
				}
			}
			
			for(int i = 0; i < 9; i++) {
				if(i < storeItemMap.get(3).size()) {
					fontPanel.add(new StoreItemButtonController(storeItemMap.get(3).get(i),frame));
				} else {
					
					fontPanel.add(new JButton("아이템 없음"));
				}
			}
			
			botPanel.add("character", characterPanel);
			botPanel.add("background", backgroundPanel);
			botPanel.add("font", fontPanel);

			// 실행하자 마자 보이게
			card.show(botPanel, "character");

			characterButton.addMouseListener(new MouseAdapter() {

				@Override
				public void mouseClicked(MouseEvent e) {

					card.show(botPanel, "character");

				}
			});

			backgroundButton.addMouseListener(new MouseAdapter() {

				@Override
				public void mouseClicked(MouseEvent e) {

					card.show(botPanel, "background");

				}
			});

			fontButton.addMouseListener(new MouseAdapter() {

				@Override
				public void mouseClicked(MouseEvent e) {

					card.show(botPanel, "font");

				}
			});
			colorPanel.add(topPanel);
			colorPanel.add(midPanel);
			colorPanel.add(botPanel);
			frame.add(colorPanel);

			frame.setVisible(true);
			frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

		}
	
}
	
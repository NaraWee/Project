package com.tuna.can.controller;

import java.awt.Color;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.Border;

import com.tuna.can.model.dto.UserInventoryDTO;
import com.tuna.can.service.TunaService;
import com.tuna.can.view.MyPage;

/**
 * <pre>
 * 인벤토리 버튼 컨트롤러
 * </pre>
 * @author kim-sunwoong
 * 인벤토리에 소유 아이템 추가시 같은 기능 으로 각각 다른 아이템들을 전달받아
 * 각각 다른 버튼 생성
 */
public class InventoryButtonController extends JButton{
	
	private int itemNo;
	private String equipItemYN;
	private String itemName;
	private String itemImg;
	private int categoryNumber;
	private JFrame frame;
	
	private Map<String, Object> resultMap = new HashMap<String, Object>();
	
	private UserInventoryDTO inventory = null;
	
	public InventoryButtonController(UserInventoryDTO inventory, JFrame frame) {
		
		this.inventory = inventory;
		this.frame = frame;
		
		
		ImageIcon itemImg = new ImageIcon("image/" + inventory.getItemImg());
		
		this.setIcon(itemImg);
		
		this.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				TunaController controller = new TunaController();
				String resultComent = "";
				
				resultMap = controller.updateItemEquipYn(inventory);
				
				resultComent = resultMap.get("result").toString();
				
				switch (resultComent) {
				case "장착성공":
					JOptionPane.showMessageDialog(null, resultMap.get("itemNo") + "번 아이템이 장착 되었습니다.", "장착성공", 1);
					break;
					
				case "장착실패":
					JOptionPane.showMessageDialog(null, resultMap.get("itemNo") + "번 아이템 장착에 실패 하였습니다.", "장착실패", 1);
					break;
					
				case "한개만장착가능":
					JOptionPane.showMessageDialog(null, "아이템은 카테고리별로 한개만 장착 가능합니다", "한개만장착가능", 1);
					break;	
					
				case "장착해제":
					JOptionPane.showMessageDialog(null, resultMap.get("itemNo") + "번 아이템이 장착 해제 되었습니다.", "장착해제", 1);
					break;
				}
				
				new MyPage();
				frame.dispose();
			}
		});
		
	}
	
}

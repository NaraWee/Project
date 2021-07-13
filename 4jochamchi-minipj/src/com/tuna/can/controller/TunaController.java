package com.tuna.can.controller;

import java.awt.Font;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.tuna.can.model.dto.AddFriendDTO;
import com.tuna.can.model.dto.BoardDTO;
import com.tuna.can.model.dto.BulletinDTO;
import com.tuna.can.model.dto.CommentDTO;
import com.tuna.can.model.dto.FriendDTO;
import com.tuna.can.model.dto.StoreItemDTO;
import com.tuna.can.model.dto.UserDTO;
import com.tuna.can.model.dto.UserInventoryDTO;
import com.tuna.can.service.TunaService;

public class TunaController {

//	로그인 성공한 id
	public static String loginMemberId;

	private TunaService service = new TunaService();

//	로그인한 USER의 개인정보를 담고있을 객체
	public static UserDTO loginMember = null;
	
	private int coin;

	/**
	 * <pre>
	 * 회원가입 창에서 정보가져오는 메소드
	 * </pre>
	 * 
	 * @param newMemberInfo
	 * @return
	 */
	
	public int registUser(Map<String, Object> newMemberInfo) {

		UserDTO userList = new UserDTO();

		userList.setNickName(newMemberInfo.get("nickname").toString());
		userList.setUserID(newMemberInfo.get("id").toString());
		userList.setUserPwd(newMemberInfo.get("pw").toString());
		userList.setPhone(newMemberInfo.get("phone").toString());
		userList.setEmail(newMemberInfo.get("email").toString());

		int result = service.registUser(userList);

		return result;
	}

	
	/**
	 * <pre>
	 * 로그인 아이디 기반으로 멤버 정보 로드
	 * </pre>
	 * @param id
	 * @return
	 * @author kim-sunwoong
	 */
	public UserDTO selectMemberInfo(String id) {

		loginMemberId = id;

		loginMember = new UserDTO();

		loginMember = service.selectMemberInfo(loginMemberId);

		return loginMember;
	}

	/**
	 * <pre>
	 * 소유 아이템들을 로드 후 
	 * 각 카테고리, 장착 여부 별로 분류한후 반환
	 * </pre>
	 * @param userNo
	 * @return itemMap
	 * @author kim-sunwoong
	 */
	public Map<Integer, ArrayList<UserInventoryDTO>> selectUserInventory(int userNo) {

		Map<Integer, ArrayList<UserInventoryDTO>> itemMap = new HashMap<Integer, ArrayList<UserInventoryDTO>>();

		ArrayList<UserInventoryDTO> category1Item = new ArrayList<UserInventoryDTO>();
		ArrayList<UserInventoryDTO> category2Item = new ArrayList<UserInventoryDTO>();
		ArrayList<UserInventoryDTO> category3Item = new ArrayList<UserInventoryDTO>();

		ArrayList<UserInventoryDTO> equipItemList = new ArrayList<UserInventoryDTO>();
		
		ArrayList<UserInventoryDTO> invenButtonInfo = new ArrayList<UserInventoryDTO>();

		invenButtonInfo = service.selectUserInventory(userNo);

		for (int i = 0; i < invenButtonInfo.size(); i++) {
			UserInventoryDTO inventory = new UserInventoryDTO();
			inventory = invenButtonInfo.get(i);
			int category = inventory.getItemCategory();
			switch (category) {
			case 1:
				category1Item.add(inventory);
				break;
			case 2:
				category2Item.add(inventory);
				break;
			case 3:
				category3Item.add(inventory);
				break;
			}
		}

		UserInventoryDTO equItem1 = null;
		for (int i = 0; i < category1Item.size(); i++) {
			if (category1Item.get(i).getEquipItemYN().equals("Y")) {
				equItem1 = new UserInventoryDTO();
				equItem1 = category1Item.get(i);
				break;
			}
		}

		UserInventoryDTO equItem2 = null;
		for (int i = 0; i < category2Item.size(); i++) {
			if (category2Item.get(i).getEquipItemYN().equals("Y")) {
				equItem2 = new UserInventoryDTO();
				equItem2 = category2Item.get(i);
				break;
			}
		}

		UserInventoryDTO equItem3 = null;
		for (int i = 0; i < category3Item.size(); i++) {
			if (category3Item.get(i).getEquipItemYN().equals("Y")) {
				equItem3 = new UserInventoryDTO();
				equItem3 = category3Item.get(i);
				break;
			}
		}

		equipItemList.add(equItem1);
		equipItemList.add(equItem2);
		equipItemList.add(equItem3);

		itemMap.put(1, category1Item);
		itemMap.put(2, category2Item);
		itemMap.put(3, category3Item);
		itemMap.put(4, equipItemList);

		return itemMap;
	}

	/**
	 * <pre>
	 * 유저의 현재 코인 갯수 조회
	 * </pre>
	 * @return 
	 * @author kim-sunwoong
	 */
	public int selectUSerCoin(int userNo) {

		coin = service.selectCoin(userNo);

		return coin;
	}

	// 받아온 코인 정보값에 코인갯수 업데이트
	public int updateCoin(int userNo,int coin) {

		int userCoin = 0;

		userCoin = service.updateCoinHB(userNo, coin);
		
		return userCoin;
		
	}
	

	/**
	 * <pre>
	 * 게시글 내용 조회
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public BulletinDTO selectBulletinContent(int boardNo) {

		BulletinDTO bulletinDTO = new BulletinDTO();
		bulletinDTO = service.selectBulletinContent(boardNo);
		return bulletinDTO;

	}


	/**
	 * <pre>
	 * 댓글 내용 조회
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public List<CommentDTO> selectComment(int commentNo) {

		List<CommentDTO> comment = service.selectComment(commentNo);
		return comment;

	}


	/**
	 * <pre>
	 * 댓글 넣어주기
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public int insertComment(CommentDTO comment) {

		CommentDTO insertComment = new CommentDTO();

		int result = 0;

		result = service.insertComment(comment);

		return result;

	}

	// 친구목록에 친구닉네임, 이미지 받아오기
	public List<FriendDTO> selectFriendsList(int userInfo) {

		List<FriendDTO> friendsList = new ArrayList<>();
		friendsList = service.selectFriendsList(userInfo);

		return friendsList;
	}

	/**
	 * <pre>
	 * 마이페이지 에서 유저 정보 수정
	 * </pre>
	 * @return 
	 * @author kim-sunwoong
	 */
	public int updateUserInformation(UserDTO updateUserInfo) {

		int result = 0;

		result = service.updateUserInformation(updateUserInfo);

		return result;

	}

	/**
	 * <pre>
	 * 아이템의 중복 장착 방지,
	 * 카테고리별 한가지 아이템만 장착 가능하게 제한
	 * 조건 만족시 아이템 장착 , 해제
	 * </pre>
	 * @param inventory
	 * @return resultMap
	 * @author kim-sunwoong
	 */
	public Map<String, Object> updateItemEquipYn(UserInventoryDTO inventory) {

		int category = inventory.getItemCategory();
		int result = 0;
		int check = 0;
		boolean sameCheck = false;
		List<String> equipYNList = new ArrayList<String>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		ArrayList<UserInventoryDTO> invenButtonInfo = new ArrayList<UserInventoryDTO>();
		String resultComent = "";

//		장착여부 긁어옴
		invenButtonInfo = service.selectUserInventory(inventory.getUserNo());
		
//		장착하려는 아이템과 같은 카테고리의 아이템들만 equipCategory 에 저장
		ArrayList<UserInventoryDTO> equipCategory = new ArrayList<UserInventoryDTO>();
		for(int i = 0; i < invenButtonInfo.size(); i++) {
			if(invenButtonInfo.get(i).getItemCategory() == category) {
				equipCategory.add(invenButtonInfo.get(i));
			}
		}
		
		for(int i = 0; i < equipCategory.size(); i++) {
//			장착한것이 하나라도 있을 경우 카운트로 변경
			if(equipCategory.get(i).getEquipItemYN().equals("Y")) {
				check++;
				resultComent = "한개만장착가능";
				
//				작창하려는 아이템 번호가
//				이미 장착중인 아이템 번호와 같을때
				if(inventory.getItemNo() == equipCategory.get(i).getItemNo()) {
					sameCheck = true;
				}
			}
		}
		
		if(check == 0) {
			inventory.setEquipItemYN("Y");
			result = service.updateItemEquipYn(inventory);
			
			if(result > 0) {
				resultComent = "장착성공";
			}
			
		} else if (sameCheck) {
			inventory.setEquipItemYN("N");
			result = service.updateItemEquipYn(inventory);
			
			if(result > 0) {
				resultComent = "장착해제";
			}
		}
		
		resultMap.put("result", resultComent);
		resultMap.put("itemNo", inventory.getItemNo());
		resultMap.put("itemImg", inventory.getItemImg());
		
		return resultMap;

	}

	// 로그인 유저의 정보가 있는 지 확인하기 위한 select
	public AddFriendDTO selectPlusFriend(int userNo) {
		AddFriendDTO list = new AddFriendDTO();

		
		list = service.selectAddFriend(userNo);


		return list;
	}

	// PlUS_FRIEND 테이블에서 받아돈 값을 AddFriendDTO에 담아서 값을 받아온다.
	public int RequestFriends(AddFriendDTO friend) {
		int result = 0;

		result = service.insertRequestFriend(friend);

		return result;

	}

	public int rejectRequest(AddFriendDTO friend) {
		int result = 0;
		result = service.rejectRequestFriend(friend);
		
		return result;
		
	}



	/**
	 * <pre>
	 * 로그인 할때 사용할 아이디/비번체크용 메소드
	 * </pre>
	 * 
	 * @param idCheck
	 * @return
	 * @author Juhee Hwang
	 * @param pwCheck
	 */
	public int checkLoginUser(String idCheck, String pwCheck) {
		int result = 0;

		UserDTO userDTO = new UserDTO();
		userDTO = service.checkLoginUser(idCheck);

		if (userDTO.getUserID().equals(idCheck) && userDTO.getUserPwd().equals(pwCheck)) {
			TunaController.loginMemberId = idCheck;
			result = 1;

			loginMember = selectMemberInfo(loginMemberId);
			
		} else {
			result = 0;
		}
		return result;
	}

	/**
	 * <pre>
	 * 닉네임만 가져오기 메소드
	 * </pre>
	 * 
	 * @param idCheck
	 * @return
	 * @author Juhee Hwang
	 */
	public String checkNickname(String idCheck) {

		UserDTO userDTO = new UserDTO();
		userDTO = service.checkLoginUser(TunaController.loginMemberId);
		String nickname = userDTO.getNickName();

		return nickname;
	}
	


	/**
	 * <pre>
	 * 체크 유저번호 based on 로그인 유저 아이디
	 * </pre>
	 * @param userNoCheck
	 * @return
	 * @author Juhee Hwang
	 */
	public int checkUserNo(String userNoCheck) {

		UserDTO userDTO = new UserDTO();
		userDTO = service.checkLoginUser(TunaController.loginMemberId);
		
		int userNo = userDTO.getUserNo();
		return userNo;
	}
	


	/**
	 * <pre>
	 * 친구인지 아닌지 확인하기 위해 친구조회
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public List<FriendDTO> selectFriends(int userNo) {

		List<FriendDTO> friendDTO = new ArrayList<>();
		friendDTO = service.selectFriends(userNo);
		return friendDTO;

	}

	/**
	 * <pre>
	 * DB에 저장된 아이템들을 카테고리별 분류 후 반환
	 * </pre>
	 * @return itemMap
	 * @author kim-sunwoong
	 */
	public Map<Integer, ArrayList<StoreItemDTO>> selectStoreItem() {

		List<StoreItemDTO> sotreItem = new ArrayList<StoreItemDTO>();

		sotreItem = service.selectStoreItem();

		Map<Integer, ArrayList<StoreItemDTO>> itemMap = new HashMap<Integer, ArrayList<StoreItemDTO>>();

		ArrayList<StoreItemDTO> category1Item = new ArrayList<StoreItemDTO>();
		ArrayList<StoreItemDTO> category2Item = new ArrayList<StoreItemDTO>();
		ArrayList<StoreItemDTO> category3Item = new ArrayList<StoreItemDTO>();

		ArrayList<UserInventoryDTO> equipItemList = new ArrayList<UserInventoryDTO>();

		ArrayList<UserInventoryDTO> invenButtonInfo = new ArrayList<UserInventoryDTO>();

		for (int i = 0; i < sotreItem.size(); i++) {
			StoreItemDTO item = new StoreItemDTO();
			item = sotreItem.get(i);
			int category = item.getItemCategory();
			switch (category) {
			case 1:
				category1Item.add(item);
				break;
			case 2:
				category2Item.add(item);
				break;
			case 3:
				category3Item.add(item);
				break;
			}
		}

		itemMap.put(1, category1Item);
		itemMap.put(2, category2Item);
		itemMap.put(3, category3Item);

		return itemMap;

	}

	/**
	 * <pre>
	 * 아이템 구매시 보유 코인 갯수, 아이템 가격, 소유 정보 판단 후
	 * 조건 성립시 아이템 구매 후 
	 * 유저 정보에 코인 갯수 업데이트
	 * </pre>
	 * @param item
	 * @return resultMap
	 * @author kim-sunwoong
	 */
	public Map<String, Integer> storeItemBuy(StoreItemDTO item) {

		Map<String, Integer> resultMap = new HashMap<String, Integer>();

		int result = 0;

		int coin = 0;

		int coinUpdateResult = 0;

		UserInventoryDTO userInven = new UserInventoryDTO();

		UserDTO user = new UserDTO();
		user = service.selectMemberInfo(loginMember.getUserID());

//		아이템 가격보다 보유 코인 갯수가 많을때 실행.
		if (item.getItemPrice() <= user.getCoin()) {

			userInven.setUserNo(user.getUserNo());
			userInven.setItemNo(item.getItemNo());
			userInven.setItemCategory(item.getItemCategory());
			userInven.setEquipItemYN("N");

			result = service.updateUserInventory(userInven);

		}
		
		if(result == 1) {
			coin = (user.getCoin() - item.getItemPrice());
			coinUpdateResult = service.updateCoin(user.getUserNo(), coin);
		}
		
		resultMap.put("invenUpdateresult", result);
		resultMap.put("coinUpdateResult", coinUpdateResult);
		resultMap.put("coin", coin);

		return resultMap;
	}
	
	/**
	 * <pre>
	 * 친구요청 보내기 정보 INSERT
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public int insertRequest(AddFriendDTO addFriend) {

		AddFriendDTO insertRequest = new AddFriendDTO();

		int result = 0;

		result = service.insertRequest(addFriend);

		return result;

	}


	/**
	 * <pre>
	 * 게시글 삽입 메소드(전체/ 친구/ 비밀 모두 기입가능)
	 * </pre>
	 * @param newInputContent
	 * @return
	 * @author Juhee Hwang
	 */
	public int insertBoard(Map<String, Object> newInputContent) {

		BoardDTO boardDTO = new BoardDTO();

		boardDTO.setTitle(newInputContent.get("title").toString());
		boardDTO.setBoardContent(newInputContent.get("content").toString());
		boardDTO.setUserNo((Integer) newInputContent.get("userNo"));
		boardDTO.setListNo((Integer) (newInputContent.get("listNo")));

		int result = service.insertBoard(boardDTO);

		return result;

	}


	/**
	 * <pre>
	 * 비밀게시글 목록 불러오기
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public List<BoardDTO> selectSecretBoard(int userNo) {

		List<BoardDTO> secretlist = service.selectSecretBoard(userNo);
		return secretlist;

	}
	/**
	 * <pre>
	 * 내가 쓴 게시물 삭제하기
	 * </pre>
	 * @param title
	 * @return
	 * @author Hyelim Jeon
	 */
	public int deleteAllBoard(BoardDTO title) {

		int result = 0;
		
		result = service.deleteAllBoard(title);
		
		return result;
	}
	
	/**
	 * <pre>
	 * 모든 게시물 목록 불러오기
	 * </pre>
	 * @param userno
	 * @return
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> selectallBoard(int userNo) {
		
		
		List<BoardDTO> allBoard = service.selectAllBoard(userNo);
		return allBoard;

	}

	/**
	 * <pre>
	 * 내가 여태 쓴 게시물 목록 불러오기
	 * </pre>
	 * @param userno
	 * @return
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> selectMyBoard(int userNo) {
		List<BoardDTO> myBoardList = service.selectMyBoard(userNo);
		return myBoardList;
	}

	/**
	 * <pre>
	 * 친구가 쓴 게시물 목록 불러오기
	 * </pre>
	 * @param userno
	 * @return
	 * @author Hyelim Jeon
	 */
	
	public List<BoardDTO> selectFriendBoard(int userNo) {
		List<BoardDTO> friendBoard = service.selectFriendBoard(userNo);
		return friendBoard;
	}
	/**
	 * <pre>
	 * 수정할 게시물 목록 불러오
	 * </pre>
	 * @param userno
	 * @return
	 * @author Hyelim Jeon
	 */
	public BoardDTO modifySecretBoard(int boardNo) {
		 
		BoardDTO boardDTO = new BoardDTO();
		
		boardDTO = service.modifySecretBoard(boardNo);
		
		return boardDTO ;
	
	}


	public AddFriendDTO selectNickName(int userNo) {
		
		AddFriendDTO af = new AddFriendDTO();
		
		af = service.selectFriendNickName(userNo);
		return af;
	}

	/**
	 * <pre>
	 * 수정 게시물 다시 재삽입
	 * </pre>
	 * @param updateInputContent
	 * @return
	 * @author Hyelim Jeon
	 */
	public int updateBoard(Map<String, Object> updateInputContent) {
	
			BoardDTO boardDTO = new BoardDTO();


			boardDTO.setTitle(updateInputContent.get("title").toString());
			boardDTO.setBoardContent(updateInputContent.get("content").toString());
			boardDTO.setBoardNo((int)updateInputContent.get("boardNo"));
			
			int result = service.updatetBoard(boardDTO);

		
		return result;
	}

	
	/**
	 * <pre>
	 * 비밀게시글 목록 삭제하기
	 * </pre>
	 * @return 
	 * @author NaraWee
	 */
	public int deleteSecretBoard(BoardDTO title) {

		      int result = 0;
		      
		      result = service.deleteSecretBoard(title);
		      
		      return result;
		   }
		
	  
	
}

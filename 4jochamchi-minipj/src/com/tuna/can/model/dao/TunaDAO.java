package com.tuna.can.model.dao;

import static com.tuna.can.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.tuna.can.model.dto.AddFriendDTO;
import com.tuna.can.model.dto.BoardDTO;
import com.tuna.can.model.dto.BulletinDTO;
import com.tuna.can.model.dto.CommentDTO;
import com.tuna.can.model.dto.FriendDTO;
import com.tuna.can.model.dto.StoreItemDTO;
import com.tuna.can.model.dto.UserDTO;
import com.tuna.can.model.dto.UserInventoryDTO;


public class TunaDAO {
	private Properties prop = new Properties();

	public TunaDAO() {

		try {
			prop.loadFromXML(new FileInputStream("mapper/tuna-query.xml"));

		} catch (IOException e) {

			e.printStackTrace();
		}
	}

	/**
	 * <pre>
	 * 새로운 유저 입력용 메소드
	 * </pre>
	 * 
	 * @param con
	 * @param user
	 * @return
	 * @author Juhee Hwang
	 */
	public int createUser(Connection con, UserDTO user) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("create_User");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, user.getNickName());
			pstmt.setString(2, user.getUserID());
			pstmt.setString(3, user.getUserPwd());
			pstmt.setString(4, user.getPhone());
			pstmt.setString(5, user.getEmail());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	/**
	 * <pre>
	 * login 페이지 아이디/비밀번호 확인 메소드
	 * 
	 * </pre>
	 * 
	 * @param con
	 * @param userList
	 * @return
	 * @author Juhee Hwang
	 */

	public UserDTO selectMemberInfo(Connection con, String loginMemberId) {

		String query = prop.getProperty("selectMemberInfo");

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		UserDTO member = new UserDTO();

		System.out.println(loginMemberId);

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, loginMemberId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				member.setUserNo(rset.getInt("USER_NO"));
				member.setNickName(rset.getString("USER_NICKNAME"));
				member.setUserID(rset.getString("USER_ID"));
				member.setUserPwd(rset.getString("USER_PWD"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setCoin(rset.getInt("COIN"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;

	}

	/**
	 * <pre>
	 * 소유 아이템들을 로드 후 
	 * 각 카테고리, 장착 여부 별로 분류한후 반환
	 * </pre>
	 * @param con, userNo
	 * @return invenButtonInfo
	 * @author kim-sunwoong
	 */
	public ArrayList<UserInventoryDTO> selectUserInventory(Connection con, int userNo) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectUserInventory");

		ArrayList<UserInventoryDTO> invenButtonInfo = null;

		try {
			invenButtonInfo = new ArrayList<UserInventoryDTO>();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {

				UserInventoryDTO userInventory = new UserInventoryDTO();
				userInventory.setUserNo(rset.getInt("USER_NO"));
				userInventory.setItemNo(rset.getInt("ITEM_NO"));
				userInventory.setItemCategory(rset.getInt("ITEM_CATEGORY"));
				userInventory.setEquipItemYN(rset.getString("EQUIP_ITEM_YN"));
				userInventory.setItemName(rset.getString("ITEM_NAME"));
				userInventory.setItemImg(rset.getString("ITEM_IMG"));
				invenButtonInfo.add(userInventory);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return invenButtonInfo;

	}


	/**
	 * <pre>
	 * 유저들의 코인을 셀렉하는 메소드
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param userNo
	 * @return
	 */
	public int selectMenberCoin(Connection con, int userNo) {

		String query = prop.getProperty("selectCoin");

		PreparedStatement pstmt = null;

		ResultSet rset = null;
		int coin = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {

				coin = rset.getInt("COIN");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return coin;

	}


	/**
	 * <pre>
	 *  게임에서 승리시 코인 값 업데이트 하는 메소드
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param userNo
	 * @param coin
	 * @return
	 */
	public int updateUserCoin(Connection con, int userNo, int coin) {
		String query = prop.getProperty("updateCoin");
		PreparedStatement pstmt = null;
		System.out.println("여기에 코인이 찍힐 겁니다. : " + coin);
		System.out.println("여기에는 유저 넘버가 찍힐거고요  : " + userNo);
		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, (coin + 7));
			pstmt.setInt(2, userNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("여기에는 증가된 코인이 찍힐까요? " + coin);
		return result;
	}


	/**
	 * <pre>
	 * 게시글 내용 가져오기
	 * </pre>
	 * @param con
	 * @param boardNo
	 * @return bulletinDTO
	 * @author NaraWee
	 */
	public BulletinDTO selectBulletinContent(Connection con, int boardNo) {

		String query = prop.getProperty("selectBulletin");

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		BulletinDTO bulletinDTO = new BulletinDTO();

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				bulletinDTO.setTitle(rset.getString("TITLE"));
				bulletinDTO.setBoardContents(rset.getString("BOARD_CONTENTS"));
				bulletinDTO.setUserNickname(rset.getString("USER_NICKNAME"));
				bulletinDTO.setEnrollDate(rset.getString("ENROLLDATE"));
				bulletinDTO.setListNo(rset.getInt("LIST_NO"));
				bulletinDTO.setUserNo(rset.getInt("USER_NO"));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt); /// 오류
		}

		return bulletinDTO;
	}


	/**
	 * <pre>
	 * 댓글 내용 가져오기
	 * </pre>
	 * @param con
	 * @param commentNo
	 * @return commentList
	 * @author NaraWee 
	 */
	public List<CommentDTO> selectComment(Connection con, int commentNo) {

		String query = prop.getProperty("selectComment");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<CommentDTO> commentList = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, commentNo);

			rset = pstmt.executeQuery();

			commentList = new ArrayList<>();

			while (rset.next()) {

				CommentDTO comment = new CommentDTO();
				comment.setUserNickname(rset.getString("USER_NICKNAME"));
				comment.setCommentContent(rset.getString("COMMENT_CONTENT"));

				commentList.add(comment);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return commentList;
	}

	/**
	 * <pre>
	 * 댓글 넣어주기
	 * </pre>
	 * @param con
	 * @param comment
	 * @return result
	 * @author WEENARA
	 */
	public int insertComment(Connection con, CommentDTO comment) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertComment");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getCommentContent());
			pstmt.setInt(3, comment.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	/**
	 * <pre>
	 * 친구리스트에서 친구 닉네임 불러오는 메소드
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param userNo
	 * @return
	 */
	public List<FriendDTO> selectFriendsList(Connection con, int userNo) {
		String query = prop.getProperty("selectFriendsLIst");

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		List<FriendDTO> friendsInfo = null;

		try {

			friendsInfo = new ArrayList<>();
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				FriendDTO friends = new FriendDTO();

				friends.setUserNO(rset.getInt("USER_NO"));
				friends.setFriendsNo(rset.getInt("FRIEND_NO"));
				friends.setFriendsNickname(rset.getString("USER_NICKNAME"));

				friendsInfo.add(friends);

			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);
		}
		System.out.println("여기 친구 정보있어요 : " + friendsInfo);
		return friendsInfo;
	}


	/**
	 * <pre>
	 * 아이템 장착 여부 업데이트
	 * </pre>
	 * @param con, userNo, itemNo, equipYn
	 * @return result
	 * @author kim-sunwoong
	 */
	public int updateEquipYn(Connection con, int userNo, int itemNo, String equipYn) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updateEquipYn");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, equipYn);
			pstmt.setInt(2, itemNo);
			pstmt.setInt(3, userNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 모든 게시글 목록 불러오는 메소드
	 * </pre>
	 * @param con, userNo
	 * @return allBoardlist
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> allBoardList(Connection con, int userNo) {

		String query = prop.getProperty("selectAllBoard");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<BoardDTO> allBoardlist = null;

		try {
			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			allBoardlist = new ArrayList<>();

			while (rset.next()) {

				BoardDTO board = new BoardDTO();

				board.setTitle(rset.getString("TITLE"));
				board.setBoardNo(rset.getInt("BOARD_NO"));

				allBoardlist.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return allBoardlist;

	}

	/**
	 * <pre>
	 * 로그인 아이디/비밀번호 확인 메소드
	 * 추가적으로 닉네임 확인가능
	 * </pre>
	 * 
	 * @param con
	 * @param idCheck
	 * @return
	 * @author juhee hwang
	 */
	public UserDTO checkLoginUser(Connection con, String idCheck) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		UserDTO userDTO = null;

		String query = prop.getProperty("login_check");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, idCheck);

			rset = pstmt.executeQuery();
			userDTO = new UserDTO();

			if (rset.next()) {

				userDTO.setUserID(rset.getString("USER_ID"));
				userDTO.setUserPwd(rset.getString("USER_PWD"));
				userDTO.setNickName(rset.getString("USER_NICKNAME"));
				userDTO.setUserNo(rset.getInt("USER_NO"));
				userDTO.setCoin(rset.getInt("COIN"));
				userDTO.setPhone(rset.getString("PHONE"));
				userDTO.setEmail(rset.getString("EMAIL"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return userDTO;
	}

	/**
	 * <pre>
	 * 유저 정보 수정 내역 업데이트
	 * </pre>
	 * @param con, updateUserInfo
	 * @return result
	 * @author kim-sunwoong
	 */
	public int updateUserInformation(Connection con, UserDTO updateUserInfo) {

		String query = prop.getProperty("updateUserInformation");

		PreparedStatement pstmt = null;

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, updateUserInfo.getUserPwd());
			pstmt.setString(2, updateUserInfo.getPhone());
			pstmt.setString(3, updateUserInfo.getEmail());
			pstmt.setInt(4, updateUserInfo.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 아이템 장착, 해제시 장착여부 업데이트
	 * </pre>
	 * @param con, inventory
	 * @return result
	 * @author kim-sunwoong
	 */
	public int updateItemEquipYn(Connection con, UserInventoryDTO inventory) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updateItemEquipYn");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, inventory.getEquipItemYN());
			pstmt.setInt(2, inventory.getUserNo());
			pstmt.setInt(3, inventory.getItemNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 아이템 장착여부 셀렉트
	 * </pre>
	 * @param con, inventory
	 * @return inven
	 * @author kim-sunwoong
	 */
	public List<String> selectCategoryInvenYN(Connection con, UserInventoryDTO inventory) {

		UserInventoryDTO inven = new UserInventoryDTO();

		List<String> equipYNList = new ArrayList<String>();

		String query = prop.getProperty("selectCategoryInvenYN");

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, inventory.getUserNo());
			pstmt.setInt(2, inventory.getItemCategory());

			rset = pstmt.executeQuery();

			while (rset.next()) {
				equipYNList.add(rset.getString(1));
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return equipYNList;
	}

	/**
	 * <pre>
	 * 친구인지 아닌지 확인하기 위해 친구조회
	 * <pre>
	 * @param con
	 * @param userNo
	 * @return friend
	 * @author WEENARA
	 */
	public List<FriendDTO> selectFriends(Connection con, int userNo) {

		String query = prop.getProperty("selectFriends");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<FriendDTO> friend = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			friend = new ArrayList<>();

			while (rset.next()) {

				FriendDTO friendDTO = new FriendDTO();
				friendDTO.setFriendsNickname(rset.getString("USER_NICKNAME"));

				friend.add(friendDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return friend;
	}
	
	/**
	 * <pre>
	 * 상점 아이템 내역 조회
	 * </pre>
	 * @param con
	 * @return sotreItem
	 * @author kim-sunwoong
	 */
	public List<StoreItemDTO> selectStoreItem(Connection con) {

		ResultSet rset = null;

		Statement stmt = null;

		List<StoreItemDTO> sotreItem = new ArrayList<StoreItemDTO>();

		String query = prop.getProperty("selectStoreItem");

		try {
			stmt = con.createStatement();

			rset = stmt.executeQuery(query);

			while (rset.next()) {
				StoreItemDTO item = new StoreItemDTO();
				item.setItemNo(rset.getInt("ITEM_NO"));
				item.setItemName(rset.getString("ITEM_NAME"));
				item.setItemPrice(rset.getInt("ITEM_PRICE"));
				item.setItemImg(rset.getString("ITEM_IMG"));
				item.setItemCategory(rset.getInt("ITEM_CATEGORY"));

				sotreItem.add(item);

			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return sotreItem;
	}

	/**
	 * <pre>
	 * 친구요청 보내기
	 * </pre>
	 * @param con
	 * @param addFriends
	 * @return result
	 * @author WEENARA
	 */
	public int insertRequest(Connection con, AddFriendDTO addFriends) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertRequestFriend");

		try {

			AddFriendDTO addFriend = new AddFriendDTO();

			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, addFriends.getUserNo());
			pstmt.setInt(2, addFriends.getRequsetFriendNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 유저의 아이템 보유내역 업데이트
	 * </pre>
	 * @param userInven
	 * @return result
	 * @author kim-sunwoong
	 */
	public int updateUserInventory(Connection con, UserInventoryDTO userInven) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateUserInventory");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, userInven.getUserNo());
			pstmt.setInt(2, userInven.getItemNo());
			pstmt.setInt(3, userInven.getItemCategory());
			pstmt.setString(4, userInven.getEquipItemYN());

			result = pstmt.executeUpdate();

		} catch (SQLIntegrityConstraintViolationException e) {
			result = 3;

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 비밀 게시글 목록 불러오는 메소드
	 * </pre>
	 * @param  userNo
	 * @return secrettList
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> selectSecretBoard(Connection con, int userNo) {

		String query = prop.getProperty("selectSecretBoard");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<BoardDTO> secrettList = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			secrettList = new ArrayList<>();

			while (rset.next()) {

				BoardDTO board = new BoardDTO();
				board.setTitle(rset.getString("TITLE"));
				board.setBoardNo(rset.getInt("BOARD_NO"));

				secrettList.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return secrettList;
	}


	/**
	 * <pre>
	 * 비밀게시글 삭제하기
	 * </pre>
	 * @param con
	 * @param title
	 * @return result
	 * @author WEENARA
	 */
	public int deleteAllBoard(Connection con, BoardDTO title) {

		PreparedStatement pstmt = null;
		int result = 0;
		int result2 = 0;
		PreparedStatement pstmt2 = null;

		String query = prop.getProperty("deleteAllBoard");
		String comentQuery = prop.getProperty("deleteComment");
		try {

			pstmt2 = con.prepareStatement(comentQuery);

			pstmt2.setInt(1, title.getBoardNo());
			result2 = pstmt2.executeUpdate();
			if (result2 > 0) {
				System.out.println("aaaaaaaaaaaaaaaaaaaaaa");
				con.commit();
			}

			BoardDTO board = new BoardDTO();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title.getTitle());
			pstmt.setInt(2, title.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}


	/**
	 * <pre>
	 * plus_Friend 테이블에 초대장 왓는지 안왔는지 셀렉하는 메소드
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param userNo
	 * @return
	 */
	public AddFriendDTO selectAddFriend(Connection con, int userNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectPlus_friend");

		AddFriendDTO AddList = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				AddList = new AddFriendDTO();

				AddList.setUserNo(rset.getInt("USER_NO"));
				AddList.setRequsetFriendNo(rset.getInt("REQUEST_FRIEND_NO"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);
		}
		return AddList;
	}

	/**
	 * <pre>
	 * 전체 게세글 db에 삽입하는 메소드
	 * </pre>
	 * 
	 * @param con
	 * @param board
	 * @return
	 * 
	 * @author Juhee Hwang
	 */
	public int insertBoard(Connection con, BoardDTO board) {

		PreparedStatement pstmt = null;

		String query = prop.getProperty("insertBoard1");

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getUserNo());
			pstmt.setInt(4, board.getListNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;

	}

	/**
	 * <pre>
	 * 내 게시글 목록 불러오는 메소드
	 * </pre>
	 * @param  userNo
	 * @return allMyBoard
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> selectMyBoard(Connection con, int userNo) {
		String query = prop.getProperty("selectMyBoard");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<BoardDTO> allMyBoard = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			allMyBoard = new ArrayList<>();

			while (rset.next()) {

				BoardDTO board = new BoardDTO();

				board.setTitle(rset.getString("TITLE"));
				board.setBoardNo(rset.getInt("BOARD_NO"));

				allMyBoard.add(board);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return allMyBoard;
	}

	//
	/**
	 * <pre>
	 *   친구 수락 메소드
	 * </pre>
	 * 
	 * @author 김현빈
	 * @param con
	 * @param userInfo
	 * @return
	 */
	public int acceptFriend(Connection con, AddFriendDTO userInfo) {

		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;

		int result1 = 0;
		int result2 = 0;
		String query1 = prop.getProperty("insertFriend");

		try {
			pstmt1 = con.prepareStatement(query1);
			pstmt1.setInt(1, userInfo.getUserNo());
			pstmt1.setInt(2, userInfo.getRequsetFriendNo());
			result1 = pstmt1.executeUpdate();

			pstmt2 = con.prepareStatement(query1);
			pstmt2.setInt(1, userInfo.getRequsetFriendNo());
			pstmt2.setInt(2, userInfo.getUserNo());
			result2 = pstmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt2);
			close(pstmt1);
		}

		return result1 + result2;
	}

	/**
	 * <pre>
	 *  친구 수락 거절 메소드
	 * </pre>
	 * 
	 * @author 김현빈
	 * @param con
	 * @param userInfo
	 * @return
	 */
	public int rejectFriend(Connection con, AddFriendDTO userInfo) {

		PreparedStatement pstmt = null;
		String query = prop.getProperty("deleteRequest");
		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userInfo.getUserNo());
			pstmt.setInt(2, userInfo.getRequsetFriendNo());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);

		}

		return result;

	}

	/**
	 * <pre>
	 * 친구 목록에서 삭제하는 메소드
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param userNo
	 * @param friendsNo
	 * @return
	 */
	public int deleteFriend(Connection con, int userNo, int friendsNo) {

		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int result1 = 0;
		int result2 = 0;
		String query = prop.getProperty("deleteFriend");

		try {
			pstmt1 = con.prepareStatement(query);
			pstmt1.setInt(1, friendsNo);
			pstmt1.setInt(2, userNo);
			result1 = pstmt1.executeUpdate();

			pstmt2 = con.prepareStatement(query);
			pstmt2.setInt(1, userNo);
			pstmt2.setInt(2, friendsNo);
			result2 = pstmt2.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt2);
			close(pstmt1);
		}

		return result1 + result2;
	}

	/**
	 * <pre>
	 * 친구 게시글 불러오는 메소드
	 * </pre>
	 * @param  userNo
	 * @return friendBoard
	 * @author Hyelim Jeon
	 */
	public List<BoardDTO> SelectFriendBoard(Connection con, int userNo) {
		String query = prop.getProperty("selectFriendBoard");

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<BoardDTO> friendBoard = null;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userNo);

			rset = pstmt.executeQuery();

			friendBoard = new ArrayList<>();

			while (rset.next()) {

				BoardDTO board = new BoardDTO();

				board.setTitle(rset.getString("TITLE"));
				board.setBoardNo(rset.getInt("BOARD_NO"));

				friendBoard.add(board);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);

		}

		return friendBoard;
	}
	
	/**
	 * <pre>
	 *  수정 게시물 불러오는 메소드
	 * </pre>
	 * @param userNo
	 * @return BoardDTO
	 * @author Hyelim Jeon
	 */
	public BoardDTO modifySecretBoard(Connection con, int boardNo) {

		String query = prop.getProperty("modifyScreteBoard");
		PreparedStatement pstmt = null;

		ResultSet rset = null;

		BoardDTO boardDTO = new BoardDTO();
		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				boardDTO.setListNo(rset.getInt("LIST_NO"));
				boardDTO.setTitle(rset.getString("TITLE"));
				boardDTO.setBoardContent(rset.getString("BOARD_CONTENTS"));
				boardDTO.setListNo(rset.getInt("LIST_NO"));
				boardDTO.setUserNo(rset.getInt("USER_NO"));

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(rset);
			close(pstmt);
		}

		return boardDTO;
	}


	/**
	 * <pre>
	 * 유저의 코인 보유 갯수 업데이트
	 * </pre>
	 * @param userNo, coin
	 * @return result
	 * @author kim-sunwoong
	 */
	public int updateCoin(Connection con, int userNo, int coin) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateCoin");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, coin);
			pstmt.setInt(2, userNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * <pre>
	 * 친구 요청 보낸유저의 닉네임 받아오는 메소
	 * </pre>
	 * @author 김현빈
	 * @param con
	 * @param requestFriendNo
	 * @return
	 */
	public AddFriendDTO selectRequestFriendNickName(Connection con, int requestFriendNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("selecrRequestUserNickName");

		AddFriendDTO ad = new AddFriendDTO();

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, requestFriendNo);

			rset = pstmt.executeQuery();
			if (rset.next()) {

				ad.setRequestFriendNickName(rset.getString("USER_NICKNAME"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return ad;
	}

	/**
	 * <pre>
	 * 수정게시글 삽입	
	 * </pre>
	 * @param board
	 * @return result
	 * @author Hyelim Jeon
	 */
	public int updatetBoard(Connection con, BoardDTO board) {
		PreparedStatement pstmt = null;
		String query = prop.getProperty("updateBoard");

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardNo());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;

	}

	/**
	 * <pre>
	 * 비밀게시글 삭제하기
	 * </pre>
	 * @param con
	 * @param title
	 * @return result
	 * @author WEENARA
	 */
	public int deleteSecretBoard(Connection con, BoardDTO title) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteSecretBoard");

		try {

			BoardDTO board = new BoardDTO();

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, title.getTitle());
			pstmt.setInt(2, title.getUserNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}



}

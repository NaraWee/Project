package com.nobanryeo.petpal.user.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.MessageTableDTO;

public interface MessageMapper {
	
	/**
	 * 쪽지 갯수 카운트
	 * @return
	 */
	public int selectMessageCount(HashMap<String, Object> map);
	
	/**
	 * 쪽지 리스트
	 * @param map
	 * @return
	 */
	public List<MessageTableDTO> selectMessage(HashMap<String, Object> map);

	/**
	 * 상세 쪽지 갯수 카운트
	 * @return
	 */
	public int selectMessageDtailCount(MessageTableDTO messageDTO);

	/**
	 * 상세 쪽지 리스트
	 * @param map
	 * @return
	 */
	public List<MessageTableDTO> selectDetailMessage(HashMap<String, Object> map);

	/**
	 * 쪽지 보내기
	 * @param messageDTO
	 * @return
	 */
	public int insertMessageFromMypage(MessageTableDTO messageDTO);

	public String selectSendUser(int userCode);

	public String selectreceiveUser(int userCode1);
	

}





















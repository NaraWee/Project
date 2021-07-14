package com.nobanryeo.petpal.user.adopt.dao;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ShareFreeDTO;

public interface ShareFreeMapper {

	int selectTotalCount();

	List<ShareFreeDTO> selectShareFreeList(HashMap<String, Object> map);

	int insertNewBoard(ShareFreeDTO shareDTO);

	int insertNewPicture(PictureDTO picture);

	int insertMidBoard(PictureDTO picture);

	void updateShareBoardViews(int code);

	ShareFreeDTO selectBoardDetail(int code);

	int putMissingStatus(int code);

	int insertMessage(MessageTableDTO messageDTO);

	int insertBoardReport(FreeBoardReportDTO boardreportDTO);

	int insertBoardReportMid(FreeBoardReportDTO boardreportDTO);

	int updateBoard(ShareFreeDTO shareDTO);

	int updatePicture(PictureDTO picture);

	int selectTotalIngCount();

	List<ShareFreeDTO> selectShareFreeIngList(HashMap<String, Object> map1);

	int selectTotalComCount();

	List<ShareFreeDTO> selectShareFreeComList(HashMap<String, Object> map2);

	int selectSearchCount(String keyword);

	List<ShareFreeDTO> selectShareFreeSearchList(HashMap<String, Object> map3);




}

package com.nobanryeo.petpal.user.adopt.dao;

import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

public interface AdoptMapper {

	List<AdoptPictureManageDTO> selectAdoptList();

	int registerAdopt(AdoptDTO adopt);

	int registPicture(PictureDTO picture);

	int selectBoardCode();
	
	int registSubTable(PictureDTO picture);

	AdoptDTO selectAdoptDetail(int boardCode);

	List<PictureDTO> selectPictureList(int boardCode);

	List<AdoptReplyDTO> selectReplyList(int code);

	int insertReply(AdoptReplyDTO replyDTO);

	int insertReplyBoard(AdoptReplyDTO replyDTO);

	int insertBoardReport(FreeBoardReportDTO boardreportDTO);

	int insertReplyReport(AdoptReplyDTO adoptreplyDTO);

	int insertBoardReportMid(FreeBoardReportDTO boardreportDTO);

	int insertMessage(MessageTableDTO messageDTO);

	List<AdoptPictureManageDTO> selectSearchAdoptList(String keyword);

	int putAdoptStatus(int boardCode);

	int deletePicture(PictureDTO pictureDTO);

	int updateAdopt(AdoptDTO adopt);

	List<PictureDTO> selectPicture(PictureDTO pictureDTO);

	
}

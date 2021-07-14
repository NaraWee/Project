package com.nobanryeo.petpal.user.adopt.service;

import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

public interface AdoptService {
	

	List<AdoptPictureManageDTO> selectAdoptList();

	int registAdopt(AdoptDTO adopt, List<PictureDTO> pictureList);

	int selectBoardCode();

	AdoptDTO selectAdoptDetail(int boardCode);

	List<PictureDTO> selectPictureList(int boardCode);

	List<AdoptReplyDTO> selectReplyList(int code);

	int insertReply(AdoptReplyDTO replyDTO);

	int insertBoardReport(FreeBoardReportDTO boardreportDTO);

	int insertReplyReport(AdoptReplyDTO adoptreplyDTO);

	int insertMessage(MessageTableDTO messageDTO);

	List<AdoptPictureManageDTO> selectSearchList(String keyword);

	int putAdoptStatus(int status);

	int deletePicture(PictureDTO pictureDTO);

	int updatetAdopt(AdoptDTO adopt, List<PictureDTO> pictureList);

}

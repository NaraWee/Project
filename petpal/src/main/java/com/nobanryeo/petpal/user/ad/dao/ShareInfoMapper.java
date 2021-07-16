package com.nobanryeo.petpal.user.ad.dao;

import java.util.List;

import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.FriendlyPlaceDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ShareInfoDTO;

public interface ShareInfoMapper {

	int selectShareInfoCount();
	
	List<ShareInfoDTO> selectShareInfoListExistImg(PageDTO page);

	void updateShareInfoViews(int boardCode);
	
	ShareInfoDTO selectShareInfoDetail(int boardCode);
	
	List<FreeBoardReplyDTO> selectShareInfoReply(int boardCode);
	
	int insertShareInfoReply(FreeBoardReplyDTO reply);

	int insertShareInfoMessage(MessageTableDTO message);

	int insertShareInfoReport(FreeBoardReportDTO report);

	int insertShareInfoReportReply(FreeBoardReplyDTO replyReport);
	
	ShareInfoDTO writeShareInfo(int userCode);

	int insertWriteShreInfo(ShareInfoDTO shareInfo);
	
	int selectBoardCode(ShareInfoDTO shareInfo);

	int insertShareInfoManage(ShareInfoDTO shareInfo);
	
	int updateModifyShareInfo(ShareInfoDTO shareInfo);
	
	int updateModifyShareInfo2(ShareInfoDTO shareInfo);
	

	
	
	
	int selectSharePlaceCount();
	
	List<FriendlyPlaceDTO> selectSharePlaceListExistImg(FriendlyPlaceDTO shareInfo);

	void updateSharePlaceViews(int boardCode);

	FriendlyPlaceDTO selectSharePlaceDetail(int boardCode);

	List<FreeBoardReplyDTO> selectSharePlaceReply(int boardCode);

	int insertSharePlaceReply(FreeBoardReplyDTO reply);

	int insertSharePlaceReport(FreeBoardReportDTO report);

	int insertWriteSharePlace(FriendlyPlaceDTO sharePlace);

	int selectPlaceBoardCode(FriendlyPlaceDTO sharePlace);

	int insertSharePlaceManage(FriendlyPlaceDTO sharePlace);

	int updateModifySharePlace(FriendlyPlaceDTO sharePlace);

	int updateModifySharePlace2(FriendlyPlaceDTO sharePlace);

}
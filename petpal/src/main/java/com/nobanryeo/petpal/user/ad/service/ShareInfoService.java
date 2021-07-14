package com.nobanryeo.petpal.user.ad.service;

import java.util.List;

import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.FriendlyPlaceDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ShareInfoDTO;

public interface ShareInfoService {

	public int selectShareInfoCount();
	
	public List<ShareInfoDTO> selectShareInfoList(PageDTO page);
	
	public void updateShareInfoViews(int boardCode);

	public ShareInfoDTO selectShareInfoDetail(int boardCode);
	
	public List<FreeBoardReplyDTO> selectShareInfoReply(int boardCode);
	
	public int insertShareInfoReply(FreeBoardReplyDTO reply);
	
	public int insertShareInfoMessage(MessageTableDTO message);
	
	public int insertShareInfoReport(FreeBoardReportDTO report);
	
	public int insertShareInfoReportReply(FreeBoardReplyDTO replyReport);
	
	public ShareInfoDTO writeShareInfo(int userCode);

	public int inserWriteShreInfo(ShareInfoDTO shareInfo);

	public int updateModifyShareInfo(ShareInfoDTO shareInfo);

	

	
	public int selectSharePlaceCount();
	
	public List<FriendlyPlaceDTO> selectSharePlaceList(FriendlyPlaceDTO sharePlace);

	public void updateSharePlaceViews(int boardCode);

	public FriendlyPlaceDTO selectSharePlaceDetail(int boardCode);

	public List<FreeBoardReplyDTO> selectSharePlaceReply(int boardCode);

	public int insertSharePlaceReply(FreeBoardReplyDTO reply);

	public int insertSharePlaceReport(FreeBoardReportDTO report);

	public int insertWriteShrePlace(FriendlyPlaceDTO sharePlace);

	public int updateModifySharePlace(FriendlyPlaceDTO sharePlace);






}

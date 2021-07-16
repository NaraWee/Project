package com.nobanryeo.petpal.user.ad.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.ad.dao.ShareInfoMapper;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.FriendlyPlaceDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ShareInfoDTO;

@Service
public class ShareInfoServiceImpl implements ShareInfoService {

	private final ShareInfoMapper shareInfoMapper;
	
	@Autowired
	public ShareInfoServiceImpl(ShareInfoMapper shareInfoMapper) {
		this.shareInfoMapper = shareInfoMapper;
	}

	@Override
	public int selectShareInfoCount() {
		return shareInfoMapper.selectShareInfoCount();
	}

	@Override
	public List<ShareInfoDTO> selectShareInfoList(PageDTO page) {
		
		List<ShareInfoDTO> shareInfoList = new ArrayList<>();
		shareInfoList = shareInfoMapper.selectShareInfoListExistImg(page);
		
		System.out.println(shareInfoList);
		
		return shareInfoList;
	}

	@Override
	public void updateShareInfoViews(int boardCode) {
		shareInfoMapper.updateShareInfoViews(boardCode);
	}
	
	@Override
	public ShareInfoDTO selectShareInfoDetail(int boardCode) {
		
		return shareInfoMapper.selectShareInfoDetail(boardCode);
	}
	
	@Override
	public List<FreeBoardReplyDTO> selectShareInfoReply(int boardCode) {

		List<FreeBoardReplyDTO> shareInfoReply = shareInfoMapper.selectShareInfoReply(boardCode);
		
		return shareInfoReply;
	}
	
	@Override
	public int insertShareInfoReply(FreeBoardReplyDTO reply) {

		return shareInfoMapper.insertShareInfoReply(reply);
	}
	
	@Override
	public int insertShareInfoMessage(MessageTableDTO message) {

		return shareInfoMapper.insertShareInfoMessage(message);
	}
	
	@Override
	public int insertShareInfoReport(FreeBoardReportDTO report) {

		return shareInfoMapper.insertShareInfoReport(report);
	}
	
	@Override
	public int insertShareInfoReportReply(FreeBoardReplyDTO replyReport) {
		
		return shareInfoMapper.insertShareInfoReportReply(replyReport);
	}
	
	@Override
	public ShareInfoDTO writeShareInfo(int userCode) {

		return shareInfoMapper.writeShareInfo(userCode);
	}

	@Override
	public int inserWriteShreInfo(ShareInfoDTO shareInfo) {
		
		// InfoBoard, ImageTable insert해주기
		int result = shareInfoMapper.insertWriteShreInfo(shareInfo);
		// insert후 boardCode 가져오기
		int boardCode = shareInfoMapper.selectBoardCode(shareInfo);
		shareInfo.setBoardCode(boardCode);
		
		// 중간 manageTable insert해주기
		int result2 = shareInfoMapper.insertShareInfoManage(shareInfo);
		
		return result + result2;
	}

	@Override
	public int updateModifyShareInfo(ShareInfoDTO shareInfo) {
		
		// InfoBoardTable update
		int result = shareInfoMapper.updateModifyShareInfo(shareInfo);
		// PictureTable update
		int result2 = shareInfoMapper.updateModifyShareInfo2(shareInfo);
		
		return result + result2;
	}


	
	
	
	

	
	@Override
	public int selectSharePlaceCount() {
		return shareInfoMapper.selectSharePlaceCount();
	}
	
	@Override
	public List<FriendlyPlaceDTO> selectSharePlaceList(FriendlyPlaceDTO shareInfo) {

		List<FriendlyPlaceDTO> friendlyPlaceList = new ArrayList<>();
		friendlyPlaceList = shareInfoMapper.selectSharePlaceListExistImg(shareInfo);
		
		System.out.println(friendlyPlaceList);
		
		return friendlyPlaceList;
	}

	@Override
	public void updateSharePlaceViews(int boardCode) {
		shareInfoMapper.updateSharePlaceViews(boardCode);
	}

	@Override
	public FriendlyPlaceDTO selectSharePlaceDetail(int boardCode) {
		return shareInfoMapper.selectSharePlaceDetail(boardCode);
	}

	@Override
	public List<FreeBoardReplyDTO> selectSharePlaceReply(int boardCode) {
		
		List<FreeBoardReplyDTO> sharePlaceReply = shareInfoMapper.selectSharePlaceReply(boardCode);
		
		return sharePlaceReply;
	}

	@Override
	public int insertSharePlaceReply(FreeBoardReplyDTO reply) {
		return shareInfoMapper.insertSharePlaceReply(reply);
	}

	@Override
	public int insertSharePlaceReport(FreeBoardReportDTO report) {
		return shareInfoMapper.insertSharePlaceReport(report);
	}

	@Override
	public int insertWriteShrePlace(FriendlyPlaceDTO sharePlace) {
		
		// friendlyPlaceBoard, ImageTable insert해주기
		int result1 = shareInfoMapper.insertWriteSharePlace(sharePlace);
		// insert후 boardCode 가져오기
		int boardCode = shareInfoMapper.selectPlaceBoardCode(sharePlace);
		sharePlace.setBoardCode(boardCode);
		
		// 중간 manageTable insert해주기
		int result2 = shareInfoMapper.insertSharePlaceManage(sharePlace);
		
		return result1 + result2;
	}

	@Override
	public int updateModifySharePlace(FriendlyPlaceDTO sharePlace) {

		// FriendlyBoardTable update
		int result = shareInfoMapper.updateModifySharePlace(sharePlace);
		// PictureTable update
		int result2 = shareInfoMapper.updateModifySharePlace2(sharePlace);
		
		return result + result2;
	}

}

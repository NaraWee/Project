package com.nobanryeo.petpal.user.adopt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.adopt.dao.AdoptMapper;
import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.AdoptPictureManageDTO;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

@Service
public class AdoptServiceImpl implements AdoptService {
	
	private final AdoptMapper adoptMapper;
	
	@Autowired
	public AdoptServiceImpl(AdoptMapper adoptMapper) {
		this.adoptMapper = adoptMapper;
	}

	/**
	 * main adopt list 불러오기 메소드
	 */
	@Override
	public List<AdoptPictureManageDTO> selectAdoptList() {
		
		List<AdoptPictureManageDTO> selectAdoptList = new ArrayList<>();
		selectAdoptList = adoptMapper.selectAdoptList();
	
		
		return selectAdoptList;
	}

	/**
	 * 입양글 등록 메소드
	 */
	@Override
	public int registAdopt(AdoptDTO adopt, List<PictureDTO> pictureList) {

		int adoptResult = adoptMapper.registerAdopt(adopt);
		System.out.println("adoptResult in service:"+ adoptResult);
		
		int boardCodeValue = adoptMapper.selectBoardCode();
		
		int pictureResult = 0;
		
		for(PictureDTO picture:pictureList) {
			picture.setBoardCode(boardCodeValue);
			pictureResult += adoptMapper.registPicture(picture);
			
			System.out.println("pictureResult in service:"+ pictureResult);
			
			int subresult = adoptMapper.registSubTable(picture);
			System.out.println("subresult: "+subresult);
		}
		
		
		int result = 0;
		if(adoptResult>0 && pictureResult == pictureList.size()) {
			result = 1;
		}
		return result;
	}

	/**
	 * 입양글 등록시 db에 중간테이블에 넣어줄 boardCode 조회
	 */
	@Override
	public int selectBoardCode() {
		int boardCode = adoptMapper.selectBoardCode();
		return boardCode;
	}

	/**
	 * 등록된 입양글 상세보기 메소드
	 */
	@Override
	public AdoptDTO selectAdoptDetail(int boardCode) {

		AdoptDTO selectAdoptdetail = new AdoptDTO();
		selectAdoptdetail = adoptMapper.selectAdoptDetail(boardCode);
		
		return selectAdoptdetail;
	}

	/**
	 * 등록된 입양사진 리스트로 불러오기 메소드
	 */
	@Override
	public List<PictureDTO> selectPictureList(int boardCode) {

		List<PictureDTO> selectPictureList = new ArrayList<>();
		selectPictureList = adoptMapper.selectPictureList(boardCode);
		
		return selectPictureList;
	}

	
	/**
	 * 해당 보드의 댓글 조회 메소드
	 */
	@Override
	public List<AdoptReplyDTO> selectReplyList(int code) {
		
		List<AdoptReplyDTO> selectReplyList = new ArrayList<>();
		selectReplyList = adoptMapper.selectReplyList(code);
		
		return selectReplyList;
	}

	/**
	 * 댓글 추가하기 메소드
	 */
	@Override
	public int insertReply(AdoptReplyDTO replyDTO) {
		
		int replyTresult = adoptMapper.insertReply(replyDTO);
		System.out.println("ReplyResult in service:"+ replyTresult);
		
		int replyBoradresult = adoptMapper.insertReplyBoard(replyDTO);
		
		int result = 0;
		if(replyTresult>0 && replyBoradresult>0) {
			result =1;
		}
		return result;
		
	}

	/**
	 * 게시글 신고하기 메소드
	 */
	@Override
	public int insertBoardReport(FreeBoardReportDTO boardreportDTO) {
		
		int insertBoardreport = adoptMapper.insertBoardReport(boardreportDTO);
		System.out.println("BoardReportresult in service: "+insertBoardreport );
		
		int insertBoardreportMid = adoptMapper.insertBoardReportMid(boardreportDTO);
		
		int result = 0;
		
		if(insertBoardreport>0 && insertBoardreportMid>0) {
			result = 1;
		}
		return result;
	}

	/**
	 * 댓글 신고하기 메소드
	 */
	@Override
	public int insertReplyReport(AdoptReplyDTO adoptreplyDTO) {
		
		int insertReplyreport = adoptMapper.insertReplyReport(adoptreplyDTO);
		System.out.println("ReplyReportresult in service: "+ insertReplyreport);
		
		int result = 0;
		
		if(insertReplyreport>0) {
			result = 1;
		}
		
		return result;
	}

	/**
	 * 쪽지 보내기 메소드
	 */
	@Override
	public int insertMessage(MessageTableDTO messageDTO) {
		
		int insertMessage = adoptMapper.insertMessage(messageDTO);
		
		
		return insertMessage;
	}

	/**
	 * 지역 검색 메소드
	 */
	@Override
	public List<AdoptPictureManageDTO> selectSearchList(String keyword) {
		
		List<AdoptPictureManageDTO> selectAdoptSearchList = new ArrayList<>();
		selectAdoptSearchList = adoptMapper.selectSearchAdoptList(keyword);
		
		return selectAdoptSearchList;
	}


	/**
	 * 입양 완료 상태값 변경 메소드
	 */
	@Override
	public int putAdoptStatus(int baordCode) {
		
		int result = adoptMapper.putAdoptStatus(baordCode);
		return result;
	}

	@Override
	public int deletePicture(PictureDTO pictureDTO) {
		
		List<PictureDTO> picCodeList = adoptMapper.selectPicture(pictureDTO);
		
		System.out.println("picCodeList: "+ picCodeList);
		
		int result = 0;
		int finalResult = 0;
		for(PictureDTO picCode : picCodeList) {
			
			result += adoptMapper.deletePicture(picCode);
		}
		if(result == picCodeList.size()) {
			finalResult = 1;
		}
		return finalResult;
	}

	@Override
	public int updatetAdopt(AdoptDTO adopt, List<PictureDTO> pictureList) {
		
		int adoptResult = adoptMapper.updateAdopt(adopt);
		System.out.println("adoptResult in service:"+ adoptResult);
		
		
		int pictureResult = 0;
		
		for(PictureDTO picture:pictureList) {
			pictureResult += adoptMapper.registPicture(picture);
			
			int subresult = adoptMapper.registSubTable(picture);
		}
		
		
		int result = 0;
		if(adoptResult>0 && pictureResult == pictureList.size()) {
			result = 1;
		}
		return result;
	}




}

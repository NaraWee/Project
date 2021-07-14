package com.nobanryeo.petpal.user.adopt.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.adopt.dao.MissingMapper;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.MissingPictureDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

@Service
public class MissingServiceImpl implements MissingService {

	private final MissingMapper missingMapper;

	@Autowired
	public MissingServiceImpl(MissingMapper missingMapper) {
		this.missingMapper = missingMapper; 
	}

	@Override
	public List<MissingPictureDTO> selectMissingList() {
		
		List<MissingPictureDTO> missingList = new ArrayList<>();
		missingList = missingMapper.selectMissingList();
		
		return missingList;
	}


	@Override
	public int insertMissingWrite(MissingDTO missing, List<PictureDTO> pictureList) {
		
		int result1 = missingMapper.insertMissingInfo(missing);
		
		int boardCode = missing.getBoardCode();
		
		int pictureResult = 0;
		
		for(PictureDTO picture : pictureList) {
			picture.setBoardCode(boardCode);
			
			pictureResult += missingMapper.insertPicture(picture);
			
			int midTableResult = missingMapper.insertMidTab(picture);
			
		}
		
		int result = 0;
		
		if(result1>0 && pictureResult == pictureList.size()) {
			result =1;
		}
		return result;
	}

	@Override
	public MissingDTO selectMissingDetail(int code) {
		
		MissingDTO missingDetail = new MissingDTO();
		missingDetail = missingMapper.selectMissingDetail(code);
		
		return missingDetail;
	}

	/**
	 * 사진 조회 메소드
	 */
	@Override
	public List<PictureDTO> selectMissingDetailPicture(int code) {
		
		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = missingMapper.selectMissingDetailPicture(code);
		return pictureList;
	}

	/**
	 * 댓글 조회 메소드
	 */
	@Override
	public List<AdoptReplyDTO> selectReplyList(int code) {
		List<AdoptReplyDTO> missingReplyList = new ArrayList<>();
		missingReplyList = missingMapper.selectAllMissingReply(code);
		return missingReplyList;
	}

	/**
	 * 댓글 등록 메소드
	 */
	@Override
	public int insertReply(AdoptReplyDTO replyDTO) {
		
		int result1 = missingMapper.insertReply(replyDTO);
		System.out.println("ReplyResult in Missing service:"+ result1);
		
		int result2 = missingMapper.insertReplyBoard(replyDTO);
		
		int result = 0;
		
		if(result1>0 && result2>0) {
			result = 1;
		}
		return result;
	}

	/**
	 * 쪽지 등록 메소드
	 */
	@Override
	public int insertMessage(MessageTableDTO messageDTO) {

		int insertResult = missingMapper.insertMessage(messageDTO);
		
		return insertResult;
	}

	/**
	 * 게시글 신고 메소드 
	 */
	@Override
	public int insertBoardReport(FreeBoardReportDTO boardreportDTO) {
		
		int insertBoardreport = missingMapper.insertBoardReport(boardreportDTO);
		System.out.println("BoardReportresult in service: "+insertBoardreport );
		
		int insertBoardreportMid = missingMapper.insertBoardReportMid(boardreportDTO);
		
		int result = 0;
		
		if(insertBoardreport>0 && insertBoardreportMid>0) {
			result = 1;
		}
		return result;
	}

	/**
	 * 댓글 신고 메소드 
	 */
	@Override
	public int insertReplyReport(AdoptReplyDTO adoptreplyDTO) {
		
		int insertReplyreport = missingMapper.insertReplyReport(adoptreplyDTO);
		System.out.println("ReplyReportresult in service: "+ insertReplyreport);
		
		int result = 0;
		
		if(insertReplyreport>0) {
			result = 1;
		}
		
		return result;
	}

	/**
	 * 지역 검색 메소드
	 */
	@Override
	public List<MissingPictureDTO> selectSearchList(String keyword) {
		
		List<MissingPictureDTO> missingSelectArea = new ArrayList<>();
		missingSelectArea = missingMapper.selectSearchList(keyword);
		
		return missingSelectArea;
	}

	@Override
	public int putMissingStatus(int boardCode) {

		int result = missingMapper.putMissingStatus(boardCode);
		return result;
	}

	@Override
	public int deletePicture(PictureDTO pictureDTO) {
		
		List<PictureDTO> picCodeList = missingMapper.selectPicture(pictureDTO);
		
		int result = 0;
		int finalResult = 0;
		
		for(PictureDTO picCode : picCodeList) {
			
			result += missingMapper.deletePicture(picCode);
		}
		if(result == picCodeList.size()) {
			finalResult = 1;
		}
		return finalResult;
	}

	@Override
	public int updateMissingWrite(MissingDTO missing, List<PictureDTO> pictureList) {
		
		int result1 = missingMapper.updateMissingInfo(missing);
		
		System.out.println("infoResult in service: "+result1);
		
		
		int pictureResult = 0;
		
		for(PictureDTO picture : pictureList) {
			
			pictureResult += missingMapper.insertPicture(picture);
			
			int midTableResult = missingMapper.insertMidTab(picture);
			
		}
		
		int result = 0;
		
		if(result1>0 && pictureResult == pictureList.size()) {
			result =1;
		}
		return result;
	}

	
}

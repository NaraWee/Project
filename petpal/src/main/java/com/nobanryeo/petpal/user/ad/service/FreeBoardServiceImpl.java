package com.nobanryeo.petpal.user.ad.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.ad.dao.FreeBoardMapper;
import com.nobanryeo.petpal.user.dto.BoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	private final FreeBoardMapper freeBoardMapper;
	
	@Autowired
	public FreeBoardServiceImpl(FreeBoardMapper freeBoardMapper) {
		this.freeBoardMapper = freeBoardMapper;
	}
	
	@Override
	public int selectFreeBoardCount() {
		return freeBoardMapper.selectFreeBoardCount();
	}
	
	@Override
	public List<FreeBoardDTO> selectFreeBoardList(PageDTO page) {
		
		List<FreeBoardDTO> selectFreeBoardList = new ArrayList<>();
		selectFreeBoardList = freeBoardMapper.selectFreeBoardList(page);
		
		return selectFreeBoardList;
	}

	@Override
	public FreeBoardDTO selectFreeBoardDetail(int boardCode) {

		return freeBoardMapper.selectFreeBoardDetail(boardCode);
	}
	
	@Override
	public List<PictureDTO> selectFreeBoardImg(int boardCode) {

		List<PictureDTO> pictureList = new ArrayList<>();
		pictureList = freeBoardMapper.selectFreeBoardImg(boardCode);
		
		return pictureList;
	}

	@Override
	public List<BoardReplyDTO> selectFreeBoardReply(int boardCode) {
		
		List<BoardReplyDTO> replyList = new ArrayList<>();
		replyList = freeBoardMapper.selectFreeBoardReply(boardCode);
		
		return replyList;
	}

	@Override
	public int insertFreeBoardReply(FreeBoardReplyDTO reply) {

		return freeBoardMapper.insertFreeBoardReply(reply);
	}

	@Override
	public void updateFreeBoardViews(int boardCode) {

		freeBoardMapper.updateFreeBoardViews(boardCode);
	}

	@Override
	public int insertFreeBoardMessage(MessageTableDTO message) {

		return freeBoardMapper.insertFreeBoardMessage(message);
	}

	@Override
	public int insertFreeBoardReport(FreeBoardReportDTO report) {
		
		return freeBoardMapper.insertFreeBoardReport(report);
	}

	@Override
	public int insertFreeBoardReplyReport(FreeBoardReplyDTO replyReport) {

		return freeBoardMapper.insertFreeBoardReplyReport(replyReport);
	}

	@Override
	public FreeBoardDTO writeFreeBoard(int userCode) {
		
		return freeBoardMapper.writeFreeBoard(userCode);
	}

	@Override
	public int insertWriteFreeBoard(FreeBoardDTO freeBoard) {

		return freeBoardMapper.insertWriteFreeBoard(freeBoard);
	}

	@Override
	public int insertFreeBoardImg(PictureDTO picture) {
		
		// 위에서 insert한 boardCode 가져와서 넣어주기
		int boardCodeval = freeBoardMapper.selectBoardCode();
		picture.setBoardCode(boardCodeval);
		
		// 이미지 insert
		int result = freeBoardMapper.insertFreeBoardImg(picture);
		
		// 이미지 관레테이블 insert
		freeBoardMapper.insertFreeBoardImg2(picture);
		
		return result;
	}

	@Override
	public int updateModifyFreeBoard(FreeBoardDTO freeBoard) {
		return freeBoardMapper.updateModifyFreeBoare(freeBoard);
	}

}

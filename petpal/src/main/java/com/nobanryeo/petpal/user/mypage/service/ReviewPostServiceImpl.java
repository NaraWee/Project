package com.nobanryeo.petpal.user.mypage.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ReviewDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;
import com.nobanryeo.petpal.user.dto.ReviewReportDTO;
import com.nobanryeo.petpal.user.mypage.dao.ReviewMapper;

@Service
public class ReviewPostServiceImpl implements ReviewPostService {

	private ReviewMapper mapper;
	
	public ReviewPostServiceImpl(ReviewMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int selectReviewPostCount() {
		return mapper.selectReviewPostCount();
	}

	@Override
	public List<ReviewDTO> selectReviewPostList(PageDTO page) {
		return mapper.selectReviewPostList(page);
	}

	@Override
	public void updateViewsCount(int boardCode) {
		mapper.updateViewsCount(boardCode);
		
	}

	@Override
	public ReviewDTO selectReviewDetail(int boardCode) {
		return mapper.selectReviewDetail(boardCode);
	}

	@Override
	public List<ReviewReplyDTO> selectReviewReply(int boardCode) {
		return mapper.selectReviewReply(boardCode);
	}

	@Override
	public int insertWriteReviewBoard(ReviewDTO reviewDTO) {
		return mapper.insertWriteReviewBoard(reviewDTO);
	}

	@Override
	public int insertReviewBoardImg(PictureDTO picture) {
		
		// insert한 boardCode 가져오기
		int boardCodeval = mapper.selectBoardCode();
		picture.setBoardCode(boardCodeval);
		
		// 이미지 insert
		int result = mapper.insertReviewBoardImg(picture);
		
		// 이미지 관레테이블 insert
		mapper.insertReviewBoardImg2(picture);
		
		return result;
	}

	@Override
	public List<PictureDTO> selectReviewImg(int boardCode) {
		return mapper.selectReviewImg(boardCode);
	}

	@Override
	public int insertReviewBoardMessage(MessageTableDTO message) {
		return mapper.insertReviewBoardMessage(message);
	}

	@Override
	public int insertReviewBoardReport(ReviewReportDTO reportDTO) {
		return mapper.insertReviewBoardReport(reportDTO);
	}

	@Override
	public int insertReviewBoardReply(ReviewReplyDTO replyDTO) {
		return mapper.insertReviewBoardReply(replyDTO);
	}

	@Override
	public int insertReviewReplyReport(ReviewReplyDTO replyDTO) {
		return mapper.insertReviewReplyReport(replyDTO);
	}

	@Override
	public int updateReviewBoard(ReviewDTO reviewDTO) {
		return mapper.updateReviewBoard(reviewDTO);
	}

	@Override
	public List<AdDTO> selectRandomAd() {
		List<AdDTO> randomAd = new ArrayList<>();
		randomAd = mapper.selectRandomAd();
		
		return randomAd;
	}

	@Override
	public void insertAdViewsCount(Map<String, Object> codeMap) {
		mapper.insertAdViewsCount(codeMap);
	}

	@Override
	public AdDTO selectAd(int boardCode) {
		return mapper.selectAd(boardCode);
	}

	


}

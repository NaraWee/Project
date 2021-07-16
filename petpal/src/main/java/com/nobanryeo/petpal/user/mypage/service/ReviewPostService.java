package com.nobanryeo.petpal.user.mypage.service;

import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ReviewDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;
import com.nobanryeo.petpal.user.dto.ReviewReportDTO;

public interface ReviewPostService {

	int selectReviewPostCount();

	List<ReviewDTO> selectReviewPostList(PageDTO page);

	void updateViewsCount(int boardCode);

	ReviewDTO selectReviewDetail(int boardCode);

	List<ReviewReplyDTO> selectReviewReply(int boardCode);

	int insertWriteReviewBoard(ReviewDTO reviewDTO);

	int insertReviewBoardImg(PictureDTO picture);

	List<PictureDTO> selectReviewImg(int boardCode);

	int insertReviewBoardMessage(MessageTableDTO message);

	int insertReviewBoardReport(ReviewReportDTO reportDTO);

	int insertReviewBoardReply(ReviewReplyDTO replyDTO);

	int insertReviewReplyReport(ReviewReplyDTO replyDTO);

	int updateReviewBoard(ReviewDTO reviewDTO);

	List<AdDTO> selectRandomAd();

	void insertAdViewsCount(Map<String, Object> codeMap);

	AdDTO selectAd(int boardCode);


}

package com.nobanryeo.petpal.user.mypage.dao;

import java.util.HashMap;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.BoradAndCommentDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;

public interface BoardManageMapper {

	int selectMissingCount(BoradAndCommentDTO bcDTO);

	List<MissingDTO> selectMissing(HashMap<String, Object> map);

	int selectAdoptCount(BoradAndCommentDTO bcDTO);

	List<AdoptDTO> selectAdoptList(HashMap<String, Object> map);

	int selectInfoCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectInfoList(HashMap<String, Object> map);

	int selectFreeCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectFreeList(HashMap<String, Object> map);

	int selectShareCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectShareList(HashMap<String, Object> map);

	int selectReviewCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectReviewList(HashMap<String, Object> map);

//	int selectReplyCount(BoradAndCommentDTO bcDTO);

//	List<BoradAndCommentDTO> selectReplyList(HashMap<String, Object> map);

	int deleteMissingPost(int boardCode);

	int deleteAdoptPost(int boardCode);

	int deleteInfoPost(int boardCode);

	int deleteFreePost(int boardCode);

	int deletePostShare(int boardCode);

	int deletePostReview(int boardCode);

	int deleteReply(int boardCode);

	int selectReviewPostCount();

	List<BoradAndCommentDTO> selectReviewPostList(PageDTO page);

	List<ReviewReplyDTO> selectMissingReplyList(HashMap<String, Object> map);

	int selectMissingReplyCount(BoradAndCommentDTO bcDTO);

	int selectReplyCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectReplyList(HashMap<String, Object> map);

	int selectFriendlyCount(BoradAndCommentDTO bcDTO);

	List<BoradAndCommentDTO> selectFriendlyList(HashMap<String, Object> map);

	boolean deletePostFriendly(int boardCode);


}

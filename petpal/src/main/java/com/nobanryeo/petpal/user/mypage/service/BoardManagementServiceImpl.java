package com.nobanryeo.petpal.user.mypage.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.dto.AdoptDTO;
import com.nobanryeo.petpal.user.dto.BoradAndCommentDTO;
import com.nobanryeo.petpal.user.dto.MissingDTO;
import com.nobanryeo.petpal.user.dto.ReviewReplyDTO;
import com.nobanryeo.petpal.user.mypage.dao.BoardManageMapper;
@Service
public class BoardManagementServiceImpl implements BoardManagementService{

	private BoardManageMapper mapper;
	
	public BoardManagementServiceImpl(BoardManageMapper mapper) {
		this.mapper = mapper;
	}
	
	@Override
	public int selectMissingCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectMissingCount(bcDTO);
	}

	@Override
	public List<MissingDTO> selectMissing(HashMap<String, Object> map) {
		return mapper.selectMissing(map);
	}

	@Override
	public int selectAdoptCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectAdoptCount(bcDTO);
	}

	@Override
	public List<AdoptDTO> selectAdoptList(HashMap<String, Object> map) {
		return mapper.selectAdoptList(map);
	}

	@Override
	public int selectInfoCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectInfoCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectInfoList(HashMap<String, Object> map) {
		return mapper.selectInfoList(map);
	}

	@Override
	public int selectFreeCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectFreeCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectFreeList(HashMap<String, Object> map) {
		return mapper.selectFreeList(map);
	}

	@Override
	public int selectShareCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectShareCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectShareList(HashMap<String, Object> map) {
		return mapper.selectShareList(map);
	}

	@Override
	public int selectReviewCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectReviewCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectReviewList(HashMap<String, Object> map) {
		return mapper.selectReviewList(map);
	}

	@Override
	public boolean deletePost(int boardCode) {
		return mapper.deleteMissingPost(boardCode) > 0? true : false;
	}

	@Override
	public boolean deletePostAdopt(int boardCode) {
		return mapper.deleteAdoptPost(boardCode) > 0? true:false;
	}

	@Override
	public boolean deletePostInfo(int boardCode) {
		return mapper.deleteInfoPost(boardCode) > 0? true:false;
	}

	@Override
	public boolean deletePostFree(int boardCode) {
		return mapper.deleteFreePost(boardCode) > 0? true:false;
	}

	@Override
	public boolean deletePostShare(int boardCode) {
		return mapper.deletePostShare(boardCode) > 0? true:false;
	}

	@Override
	public boolean deletePostReview(int boardCode) {
		return mapper.deletePostReview(boardCode) > 0? true:false;
	}

	@Override
	public boolean deleteReply(int boardCode) {
		return mapper.deleteReply(boardCode) > 0? true:false;
	}

	@Override
	public List<ReviewReplyDTO> selectMissingReplyList(HashMap<String, Object> map) {
		return mapper.selectMissingReplyList(map);
	}

	@Override
	public int selectMissingReplyCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectMissingReplyCount(bcDTO);
	}

	@Override
	public int selectReplyCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectReplyCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectReplyList(HashMap<String, Object> map) {
		return mapper.selectReplyList(map);
	}

	@Override
	public int selectFriendlyCount(BoradAndCommentDTO bcDTO) {
		return mapper.selectFriendlyCount(bcDTO);
	}

	@Override
	public List<BoradAndCommentDTO> selectFriendlyList(HashMap<String, Object> map) {
		return mapper.selectFriendlyList(map);
	}

	@Override
	public boolean deletePostFriendly(int boardCode) {
		return mapper.deletePostFriendly(boardCode);
	}

	
}
















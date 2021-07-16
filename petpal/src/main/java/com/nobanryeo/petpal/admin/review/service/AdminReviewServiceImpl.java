package com.nobanryeo.petpal.admin.review.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDetailDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;
import com.nobanryeo.petpal.admin.review.dao.AdminReviewMapper;

@Service
public class AdminReviewServiceImpl implements AdminReviewService{
	private AdminReviewMapper mapper;
	
	@Autowired
	public AdminReviewServiceImpl(AdminReviewMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public int selectReviewCount(AdminPageInfoDTO cat) {
		// TODO Auto-generated method stub
		return mapper.selectReviewCount(cat);
	}

	@Override
	public List<AdminReviewDTO> selectReview(AdminPageInfoDTO paging) {
		// TODO Auto-generated method stub
		return mapper.selectReview(paging);
	}

	@Override
	public AdminReviewDetailDTO selectReviewDetail(Map param) {
		// TODO Auto-generated method stub
		return mapper.selectReviewDetail(param);
	}

	@Override
	public boolean insertDecision(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.insertDecision(decisionData)> 0 ? true : false;
	}

	@Override
	public boolean updateReport(DecisionDTO decisionData) {
		// TODO Auto-generated method stub
		return mapper.updateReport(decisionData)> 0 ? true : false;
	}
	
	

}

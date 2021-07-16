package com.nobanryeo.petpal.admin.review.dao;

import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDetailDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;

public interface AdminReviewMapper {
	int selectReviewCount(AdminPageInfoDTO cat);

	List<AdminReviewDTO> selectReview(AdminPageInfoDTO paging);
	AdminReviewDetailDTO selectReviewDetail(Map param);
	int insertDecision(DecisionDTO decisionData);

	int updateReport(DecisionDTO decisionData);
}

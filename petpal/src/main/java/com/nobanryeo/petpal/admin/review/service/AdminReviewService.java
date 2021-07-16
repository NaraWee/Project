package com.nobanryeo.petpal.admin.review.service;

import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDTO;
import com.nobanryeo.petpal.admin.dto.AdminReviewDetailDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;

public interface AdminReviewService {

	int selectReviewCount(AdminPageInfoDTO cat);

	List<AdminReviewDTO> selectReview(AdminPageInfoDTO paging);

	AdminReviewDetailDTO selectReviewDetail(Map param);

	boolean insertDecision(DecisionDTO decisionData);

	boolean updateReport(DecisionDTO decisionData);

}

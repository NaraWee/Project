package com.nobanryeo.petpal.admin.ad.dao;

import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;

public interface AdAdminMapper {

	int selectAdApply(AdminPageInfoDTO cat);
	
	List<AdAdminDTO> selectAdApproveList(AdminPageInfoDTO paging);

	List<AdAdminDTO> selectAdApproveDetail(int adCode);

	List<AdAdminDTO> selectAdApproveDecision(int adCode);

	int insertAdApprove(DecisionDTO decision);

	int searchAdApply(AdminPageInfoDTO cat);

	List<AdAdminDTO> searchAdApproveList(AdminPageInfoDTO paging);

	int updateAdApprove(DecisionDTO decision);

	int selectAdList(AdminPageInfoDTO cat);

	List<AdAdminDTO> selectAdAllList(AdminPageInfoDTO paging);

	List<AdAdminDTO> selectClickList(List<AdAdminDTO> selectAdList);

	List<AdAdminDTO> selectAdDetail(int adCode);

	int searchAdList(AdminPageInfoDTO cat);

	List<AdAdminDTO> searchAdAllList(AdminPageInfoDTO paging);

	List<AdAdminDTO> selectAdPopUp(int adCode);

	
}

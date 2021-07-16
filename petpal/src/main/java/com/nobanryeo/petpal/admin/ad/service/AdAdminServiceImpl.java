package com.nobanryeo.petpal.admin.ad.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.ad.dao.AdAdminMapper;
import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.DecisionDTO;

@Service
public class AdAdminServiceImpl implements AdAdminService  {

	// 매퍼 전역변수
	private AdAdminMapper adAdminMapper;
	
	// 생성자를 통한 DI
	@Autowired
	public AdAdminServiceImpl(AdAdminMapper adAdminMapper) {
		this.adAdminMapper = adAdminMapper;
	}

	// 광고 심사 총 갯수 조회
	@Override
	public int selectAdApply(AdminPageInfoDTO cat) {
		return adAdminMapper.selectAdApply(cat);
	}
	
	// 광고 심사 리스트 조회
	@Override
	public List<AdAdminDTO> selectAdApproveList(AdminPageInfoDTO paging) {
		return adAdminMapper.selectAdApproveList(paging);
	}
	

	// 광고 심사 디테일 조회
	@Override
	public List<AdAdminDTO> selectAdApproveDetail(int adCode) {
		return adAdminMapper.selectAdApproveDetail(adCode);
	}

	// 광고 심사 사유 조회
	@Override
	public List<AdAdminDTO> selectAdApproveDecision(int adCode) {
		return adAdminMapper.selectAdApproveDecision(adCode);
	}

	// 광고 심사 사유 입력
	@Override
	public boolean insertAdApprove(DecisionDTO decision) {
		return adAdminMapper.insertAdApprove(decision) > 0 ? true : false;
	}

	// 광고 심사 결과 업데이트
	@Override
	public boolean updateAdApprove(DecisionDTO decision) {
		return adAdminMapper.updateAdApprove(decision) > 0 ? true : false;
	}
	
	// 광고 심사 검색 총 갯수
	@Override
	public int searchAdApply(AdminPageInfoDTO cat) {
		return adAdminMapper.searchAdApply(cat);
	}

	// 광고 심사 검색 리스트
	@Override
	public List<AdAdminDTO> searchAdApproveList(AdminPageInfoDTO paging) {
		return adAdminMapper.searchAdApproveList(paging);
	}

	// 광고 검사 총 갯수
	@Override
	public int selectAdList(AdminPageInfoDTO cat) {
		return adAdminMapper.selectAdList(cat);
	}

	// 광고 관리 리스트 
	@Override
	public List<AdAdminDTO> selectAdAllList(AdminPageInfoDTO paging) {
		return adAdminMapper.selectAdAllList(paging);
	}

	// 광고 관리 게시 중 클릭 수 조회
	@Override
	public List<AdAdminDTO> selectClickList(List<AdAdminDTO> selectAdList) {
		return adAdminMapper.selectClickList(selectAdList);
	}
	
	// 광고 관리 디테일 조회
	@Override
	public List<AdAdminDTO> selectAdDetail(int adCode) {
		return adAdminMapper.selectAdDetail(adCode);
	}

	// 광고 관리 검색 총 갯수
	@Override
	public int searchAdList(AdminPageInfoDTO cat) {
		return adAdminMapper.searchAdList(cat);
	}
	
	// 광고 관리 검색 리스트
	@Override
	public List<AdAdminDTO> searchAdAllList(AdminPageInfoDTO paging) {
		return adAdminMapper.searchAdAllList(paging);
	}

	// 광고 관리 검색 게시 중 클릭 수 조회
	@Override
	public List<AdAdminDTO> selectClickAdList(List<AdAdminDTO> searchAdAllList) {
		return adAdminMapper.selectClickList(searchAdAllList);
	}

	// 광고 팝업
	@Override
	public List<AdAdminDTO> selectAdPopUp(int adCode) {
		return adAdminMapper.selectAdPopUp(adCode);
	}



	
	
}

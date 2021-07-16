package com.nobanryeo.petpal.admin.manage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.manage.dao.AdminManageMapper;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

@Service
public class AdminManageServiceImpl implements AdminManageService {
	
	private AdminManageMapper mapper;
	
	@Autowired
	public AdminManageServiceImpl(AdminManageMapper mapper) {
		this.mapper=mapper;
	}
	@Override
	public int selectListCount(AdminPageInfoDTO cat) {
		// TODO Auto-generated method stub
		return mapper.selectListCount(cat);
	}

	@Override
	public List<UserInfoDTO> selectAdminList(AdminPageInfoDTO paging) {
		// TODO Auto-generated method stub
		return mapper.selectAdminList(paging);
	}
	@Override
	public boolean insertAdmin(UserInfoDTO userInfo) {
		// TODO Auto-generated method stub
		return mapper.insertAdmin(userInfo)> 0 ? true : false;
	}
	@Override
	public UserInfoDTO selectAdminDetail(String boardCode) {
		// TODO Auto-generated method stub
		return mapper.selectAdminDetail(boardCode);
	}
	@Override
	public boolean updateAdmin(Map param) {
		// TODO Auto-generated method stub
		return mapper.updateAdmin(param)> 0 ? true : false;
	}
	@Override
	public boolean updateAdminTable(String userCode) {
		// TODO Auto-generated method stub
		return mapper.updateAdminTable(userCode)> 0 ? true : false;
	}


}

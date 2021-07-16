package com.nobanryeo.petpal.admin.blacklist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.admin.blacklist.dao.UserAdminMapper;
import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;

@Service
public class BlackListServiceImpl implements BlackListService{
	
	// 매퍼 전역변수
	private UserAdminMapper userAdminMapper;
	
	// 생성자를 통한 DI
	@Autowired
	public BlackListServiceImpl(UserAdminMapper userAdminMapper) {
		this.userAdminMapper = userAdminMapper;
	}

	@Override
	public int selectUserNumber(AdminPageInfoDTO cat) {
		return userAdminMapper.selectUserNumber(cat);
	}

	@Override
	public List<AdAdminDTO> selectUserList(AdminPageInfoDTO paging) {
		return userAdminMapper.selectUserList(paging);
	}

	@Override
	public int searchUserNumber(AdminPageInfoDTO cat) {
		return userAdminMapper.searchUserNumber(cat);
	}

	@Override
	public List<AdAdminDTO> searchUserList(AdminPageInfoDTO paging) {
		return userAdminMapper.searchUserList(paging);
	}

}

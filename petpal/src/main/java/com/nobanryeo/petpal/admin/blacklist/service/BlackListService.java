package com.nobanryeo.petpal.admin.blacklist.service;

import java.util.List;

import com.nobanryeo.petpal.admin.dto.AdAdminDTO;
import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;

public interface BlackListService {

	int selectUserNumber(AdminPageInfoDTO cat);

	List<AdAdminDTO> selectUserList(AdminPageInfoDTO paging);

	int searchUserNumber(AdminPageInfoDTO cat);

	List<AdAdminDTO> searchUserList(AdminPageInfoDTO paging);

}

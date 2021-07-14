package com.nobanryeo.petpal.admin.manage.service;

import java.util.List;
import java.util.Map;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AskDTO;
import com.nobanryeo.petpal.user.dto.UserInfoDTO;

public interface AdminManageService {

	int selectListCount(AdminPageInfoDTO cat);

	List<UserInfoDTO> selectAdminList(AdminPageInfoDTO paging);

	boolean insertAdmin(UserInfoDTO userInfo);

	UserInfoDTO selectAdminDetail(String boardCode);

	boolean updateAdmin(Map param);

	boolean updateAdminTable(String userCode);


}

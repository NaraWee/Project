package com.nobanryeo.petpal.admin.mainpage.dao;

import java.util.List;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.BoardTotalViewsDTO;

public interface AdminMainMapper {

	Integer selectMonthRevenue(AdminPageInfoDTO cat);

	List<BoardTotalViewsDTO> selectBoardTotalViews();

}

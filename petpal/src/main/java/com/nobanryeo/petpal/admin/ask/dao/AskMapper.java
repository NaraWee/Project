package com.nobanryeo.petpal.admin.ask.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.nobanryeo.petpal.admin.dto.AdminPageInfoDTO;
import com.nobanryeo.petpal.admin.dto.AskDTO;
import com.nobanryeo.petpal.admin.dto.AskDetailDTO;

public interface AskMapper {
	int selectListCount(AdminPageInfoDTO cat);
	List<AskDTO> selectList(AdminPageInfoDTO paging);
	AskDetailDTO selectListDetail(int boardCode);
	int selectSearchCount(AdminPageInfoDTO cat);
	List<AskDTO> selectSearchAsk(AdminPageInfoDTO paging);
	int updateReply(Map param);
	int updateState(int boardCode);

}

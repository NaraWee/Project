package com.nobanryeo.petpal.user.ad.dao;

import java.util.List;

import com.nobanryeo.petpal.user.dto.BoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

public interface FreeBoardMapper {
	
	int selectFreeBoardCount();

	List<FreeBoardDTO> selectFreeBoardList(PageDTO page);

	FreeBoardDTO selectFreeBoardDetail(int boardCode);
	
	List<PictureDTO> selectFreeBoardImg(int boardCode);

	List<BoardReplyDTO> selectFreeBoardReply(int boardCode);

	int insertFreeBoardReply(FreeBoardReplyDTO reply);

	void updateFreeBoardViews(int boardCode);

	int insertFreeBoardMessage(MessageTableDTO message);

	int insertFreeBoardReport(FreeBoardReportDTO report);

	int insertFreeBoardReplyReport(FreeBoardReplyDTO replyReport);

	FreeBoardDTO writeFreeBoard(int userCode);

	int insertWriteFreeBoard(FreeBoardDTO freeBoard);

	int insertFreeBoardImg(PictureDTO picture);

	int selectBoardCode();
	
	int insertFreeBoardImg2(PictureDTO picture);

	int updateModifyFreeBoare(FreeBoardDTO freeBoard);

}

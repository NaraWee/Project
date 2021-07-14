package com.nobanryeo.petpal.user.ad.service;

import java.util.List;

import com.nobanryeo.petpal.user.dto.BoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;

public interface FreeBoardService {

	public int selectFreeBoardCount();
	
	public List<FreeBoardDTO> selectFreeBoardList(PageDTO page);

	public FreeBoardDTO selectFreeBoardDetail(int boardCode);

	public List<PictureDTO> selectFreeBoardImg(int boardCode);
	
	public List<BoardReplyDTO> selectFreeBoardReply(int boardCode);

	public int insertFreeBoardReply(FreeBoardReplyDTO reply);

	public void updateFreeBoardViews(int boardCode);

	public int insertFreeBoardMessage(MessageTableDTO message);

	public int insertFreeBoardReport(FreeBoardReportDTO report);

	public int insertFreeBoardReplyReport(FreeBoardReplyDTO replyReport);

	public FreeBoardDTO writeFreeBoard(int userCode);

	public int insertWriteFreeBoard(FreeBoardDTO freeBoard);

	public int insertFreeBoardImg(PictureDTO picture);

	public int updateModifyFreeBoard(FreeBoardDTO freeBoard);


}


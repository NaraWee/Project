package com.nobanryeo.petpal.user.adopt.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.adopt.dao.ShareFreeMapper;
import com.nobanryeo.petpal.user.dto.AdoptReplyDTO;
import com.nobanryeo.petpal.user.dto.FreeBoardReportDTO;
import com.nobanryeo.petpal.user.dto.MessageTableDTO;
import com.nobanryeo.petpal.user.dto.PageDTO;
import com.nobanryeo.petpal.user.dto.PictureDTO;
import com.nobanryeo.petpal.user.dto.ShareFreeDTO;

@Service
public class ShareFreeServiceImpl implements ShareFreeService {
	
	private ShareFreeMapper sharefreeMapper;
	
	@Autowired
	public ShareFreeServiceImpl(ShareFreeMapper sharefreeMapper) {
		this.sharefreeMapper = sharefreeMapper;
	}

	@Override
	public int selectTotalCount() {
		int total = sharefreeMapper.selectTotalCount();
		return total;
	}


	@Override
	public List<ShareFreeDTO> selectShareFreeList(HashMap<String, Object> map) {
		
		List<ShareFreeDTO> shareAllList = sharefreeMapper.selectShareFreeList(map);
		return shareAllList;

	}

	@Override
	public int insertNewBoard(ShareFreeDTO shareDTO) {
		
		return sharefreeMapper.insertNewBoard(shareDTO);
	}


	@Override
	public int insertNewBoth(ShareFreeDTO shareDTO, PictureDTO picture) {
		
		int boardResult = sharefreeMapper.insertNewBoard(shareDTO);
		
		picture.setBoardCode(shareDTO.getBoardCode());
		int pictureResult = sharefreeMapper.insertNewPicture(picture);
		
		int bothResult = sharefreeMapper.insertMidBoard(picture);
		
		System.out.println("service result = "+boardResult+pictureResult+bothResult);
		return bothResult;
	}

	@Override
	public ShareFreeDTO selectBoardDetail(int code) {
		
		ShareFreeDTO shareDTO = sharefreeMapper.selectBoardDetail(code);
		
		return shareDTO;
	}


	@Override
	public void updateShareBoardViews(int code) {
		sharefreeMapper.updateShareBoardViews(code);
	}

	@Override
	public int putMissingStatus(int code) {
		
		return sharefreeMapper.putMissingStatus(code);
	}

	@Override
	public int insertMessage(MessageTableDTO messageDTO) {
		
		return sharefreeMapper.insertMessage(messageDTO);
	}

	@Override
	public int insertBoardReport(FreeBoardReportDTO boardreportDTO) {
		
		int insertBoardreport = sharefreeMapper.insertBoardReport(boardreportDTO);
		System.out.println("BoardReportresult in service: "+insertBoardreport );
		
		int insertBoardreportMid = sharefreeMapper.insertBoardReportMid(boardreportDTO);
		
		int result = 0;
		
		if(insertBoardreport>0 && insertBoardreportMid>0) {
			result = 1;
		}
		return result;
	}

	@Override
	public int updateBoth(ShareFreeDTO shareDTO, PictureDTO picture) {
		
		int result = 0;
		
		int updateBoardResult = sharefreeMapper.updateBoard(shareDTO);
		
		int updatePictureResult = sharefreeMapper.updatePicture(picture);
		
		if(updateBoardResult>0 && updatePictureResult>0) {
			System.out.println("###################$$$$$$$$$$ shareFree 보드 성공!!!");
			result = 1;
			
		}
		return result;
	}

	@Override
	public int selectTotalIngCount() {
		
		return sharefreeMapper.selectTotalIngCount();
	}

	@Override
	public List<ShareFreeDTO> selectIngList(HashMap<String, Object> map1) {
		
		List<ShareFreeDTO> shareAllIngList = sharefreeMapper.selectShareFreeIngList(map1);
		
		return shareAllIngList;
	}

	@Override
	public int selectTotalComCount() {
		
		return sharefreeMapper.selectTotalComCount();
	}

	@Override
	public List<ShareFreeDTO> selectComList(HashMap<String, Object> map2) {
		
		List<ShareFreeDTO> shareAllComList = sharefreeMapper.selectShareFreeComList(map2);
		
		return shareAllComList;
	}

	@Override
	public int selectTotalSearchCount(String keyword) {
		
		return sharefreeMapper.selectSearchCount(keyword);
	}

	@Override
	public List<ShareFreeDTO> selectSearchList(HashMap<String, Object> map3) {
		
		List<ShareFreeDTO> shareAllSearchList = sharefreeMapper.selectShareFreeSearchList(map3);
		
		return shareAllSearchList;
	}

	
	
	

}

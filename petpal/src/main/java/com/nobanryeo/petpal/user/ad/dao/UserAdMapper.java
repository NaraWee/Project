package com.nobanryeo.petpal.user.ad.dao;

import java.sql.Date;
import java.util.List;

import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.PageDTO;

public interface UserAdMapper {

	int selectAdListCount(AdDTO adDTO);
	
	List<AdDTO> selectAdList(AdDTO adDTO);

	List<AdDTO> selectAdPaymentList(AdDTO adDTO);

	AdDTO selectAdApplyDetail(AdDTO adDTO);

	int insertAdQnA(AdQnADTO adQnA);

	int insertAdSubmit(AdDTO adDTO);

	int insertAdSubmit2(AdDTO adDTO);

	int updateFirstAdPayment(AdDTO adDTO);

	String selectToday();
	
	int updateCancelAd(AdDTO adDTO);

	int updateCancelAd2(AdDTO adDTO);
	
	int updateAdMorePay(AdDTO adDTO);

	List<AdDTO> selectRandomAdNonPlace();

	List<AdDTO> selectRandomAdPlace();

	AdDTO selectAdDetail(int adCode);

	void insertAdClick(AdDTO adDTO);

	int selectAdClick(AdDTO adDTO);

	void insertAdClickNoUser(AdDTO adDTO);



}

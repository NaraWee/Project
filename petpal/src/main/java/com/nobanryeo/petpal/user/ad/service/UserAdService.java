package com.nobanryeo.petpal.user.ad.service;

import java.util.List;

import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.PageDTO;

public interface UserAdService {

	public int selectAdListCount(AdDTO adDTO);
	
	public List<AdDTO> selectAdList(AdDTO adDTO);

	public List<AdDTO> selectAdPaymentList(AdDTO adDTO);

	public AdDTO selectAdApplyDetail(AdDTO adDTO);

	public int insertAdQnA(AdQnADTO adQnA);

	public int insertAdSubmit(AdDTO adDTO);

	public int insertAdSubmit2(AdDTO adDTO);

	public int updateFirstAdPayment(AdDTO adDTO);

	public int updateCancelAd(AdDTO adDTO);

	public int updateAdMorePay(AdDTO adDTO);

	public List<AdDTO> selectRandomAdNonPlace();

	public List<AdDTO> selectRandomAdPlace();

	public AdDTO selectAdDetail(int adCode);

	public void insertAdClick(AdDTO adDTO);

	public int selectAdClick(AdDTO adDTO);

	public void insertAdClickNoUser(AdDTO adDTO);

}

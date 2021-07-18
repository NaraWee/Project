package com.nobanryeo.petpal.user.ad.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nobanryeo.petpal.user.ad.dao.UserAdMapper;
import com.nobanryeo.petpal.user.dto.AdDTO;
import com.nobanryeo.petpal.user.dto.AdQnADTO;
import com.nobanryeo.petpal.user.dto.PageDTO;

@Service
public class UserAdServiceImpl implements UserAdService {

	private final UserAdMapper adMapper;
	
	@Autowired
	public UserAdServiceImpl(UserAdMapper adMapper) {
		this.adMapper = adMapper;
	}

	@Override
	public int selectAdListCount(AdDTO adDTO) {
		return adMapper.selectAdListCount(adDTO);
	}
	
	@Override
	public List<AdDTO> selectAdList(AdDTO adDTO) {
		
		List<AdDTO> adList = new ArrayList<>();
		
		System.out.println(adDTO);
		
		adList = adMapper.selectAdList(adDTO);
		
		return adList;
	}

	@Override
	public List<AdDTO> selectAdPaymentList(AdDTO adDTO) {

		List<AdDTO> adPaymentList = new ArrayList<>();
		
		adPaymentList = adMapper.selectAdPaymentList(adDTO);
		
		return adPaymentList;
	}

	@Override
	public AdDTO selectAdApplyDetail(AdDTO adDTO) {
		
		AdDTO adApplyDetail = new AdDTO();
		adApplyDetail = adMapper.selectAdApplyDetail(adDTO);
			
		return adApplyDetail;
	}

	@Override
	public int insertAdQnA(AdQnADTO adQnA) {

		return adMapper.insertAdQnA(adQnA);
	}

	@Override
	public int insertAdSubmit(AdDTO adDTO) {

		return adMapper.insertAdSubmit(adDTO);
	}

	@Override
	public int insertAdSubmit2(AdDTO adDTO) {

		return adMapper.insertAdSubmit2(adDTO);
	}

	@Override
	public int updateFirstAdPayment(AdDTO adDTO) {

		return adMapper.updateFirstAdPayment(adDTO);
	}

	@Override
	public int updateCancelAd(AdDTO adDTO) {
		
		int result = 0;
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date today;
		
		try {
			today = dateFormat.parse(adMapper.selectToday());
			java.sql.Date todayy = new java.sql.Date(today.getTime());
			if(adDTO.getPayDate1st().equals(todayy)) {
				result = adMapper.updateCancelAd2(adDTO);		// 1차결제일과 취소일이 같을 때(결제후 광고게시 대기중)
			} else {
				result = adMapper.updateCancelAd(adDTO);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int updateAdMorePay(AdDTO adDTO) {
		return adMapper.updateAdMorePay(adDTO);
	}

	@Override
	public List<AdDTO> selectRandomAdNonPlace() {
		
		List<AdDTO> randomAd = new ArrayList<>();
		randomAd = adMapper.selectRandomAdNonPlace();
		
		return randomAd;
	}

	@Override
	public List<AdDTO> selectRandomAdPlace() {

		List<AdDTO> randomAd = new ArrayList<>();
		randomAd = adMapper.selectRandomAdPlace();
		
		return randomAd;
	}

	@Override
	public AdDTO selectAdDetail(int adCode) {
		return adMapper.selectAdDetail(adCode);
	}

	@Override
	public void insertAdClick(AdDTO adDTO) {
		adMapper.insertAdClick(adDTO);
	}

	@Override
	public int selectAdClick(AdDTO adDTO) {
		return adMapper.selectAdClick(adDTO);
	}

	@Override
	public void insertAdClickNoUser(AdDTO adDTO) {
		adMapper.insertAdClickNoUser(adDTO);
	}


}

package com.bonggeuda.sugbag.common.comparator;

import java.util.Comparator;

import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;

public class AscReviewScore implements Comparator<AccomoInfoDTO>{
	
	@Override
	public int compare(AccomoInfoDTO o1, AccomoInfoDTO o2) {
		int i = 0;
		
		if(o1.getReviewScore() > o2.getReviewScore()) {
			i = 1;
		} else {
			i= -1;
		}
		return i;
	}
}

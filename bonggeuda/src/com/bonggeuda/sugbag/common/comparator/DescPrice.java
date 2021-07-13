package com.bonggeuda.sugbag.common.comparator;

import java.util.Comparator;

import com.bonggeuda.sugbag.model.dto.AccomoInfoDTO;

public class DescPrice implements Comparator<AccomoInfoDTO>{

	@Override
	public int compare(AccomoInfoDTO o1, AccomoInfoDTO o2) {

		return o2.getMinPrice() - o1.getMinPrice();
	}
}

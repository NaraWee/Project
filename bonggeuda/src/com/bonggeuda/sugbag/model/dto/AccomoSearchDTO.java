package com.bonggeuda.sugbag.model.dto;

import java.util.Arrays;

public class AccomoSearchDTO {

	private String type;
	private String[] facility;
	private int personnal;
	private int category;
	
	public AccomoSearchDTO() {
	}

	public AccomoSearchDTO(String type, String[] facility, int personnal, int category) {
		super();
		this.type = type;
		this.facility = facility;
		this.personnal = personnal;
		this.category = category;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String[] getFacility() {
		return facility;
	}

	public void setFacility(String[] facility) {
		this.facility = facility;
	}

	public int getPersonnal() {
		return personnal;
	}

	public void setPersonnal(int personnal) {
		this.personnal = personnal;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "AccomoSearchDTO [type=" + type + ", facility=" + Arrays.toString(facility) + ", personnal=" + personnal
				+ ", category=" + category + "]";
	}
	
	
}

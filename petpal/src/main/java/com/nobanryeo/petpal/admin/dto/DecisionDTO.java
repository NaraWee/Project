package com.nobanryeo.petpal.admin.dto;

import java.sql.Date;

public class DecisionDTO {
	
	private int decisionCode;
	private String decisionReason;
	private Date decisionDate;
	private int stateCode;
	private int code; // 유저코드(관리자코드)
	private int adCode; // 광고코드
	private String category;
	private String boardCode;
	
	
	
	public DecisionDTO() {
		super();
	}

	public DecisionDTO(int decisionCode, String decisionReason, Date decisionDate, int stateCode, int code,
			int adCode) {
		super();
		this.decisionCode = decisionCode;
		this.decisionReason = decisionReason;
		this.decisionDate = decisionDate;
		this.stateCode = stateCode;
		this.code = code;
		this.adCode = adCode;
	}

	public DecisionDTO(String decisionReason, int stateCode, int code, int adCode) {
		super();
		this.decisionReason = decisionReason;
		this.stateCode = stateCode;
		this.code = code;
		this.adCode = adCode;
	}
	
	public DecisionDTO(String decisionReason, int stateCode, int code, int adCode , String category, String boardCode) {
		super();
		this.decisionReason = decisionReason;
		this.stateCode = stateCode;
		this.code = code;
		this.adCode = adCode;
		this.category = category;
		this.boardCode = boardCode;
	}
	
	public DecisionDTO(String decisionReason, int stateCode, int code,  String category, String boardCode) {
		super();
		this.decisionReason = decisionReason;
		this.stateCode = stateCode;
		this.code = code;
		this.category = category;
		this.boardCode = boardCode;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public String getDecisionReason() {
		return decisionReason;
	}

	public void setDecisionReason(String decisionReason) {
		this.decisionReason = decisionReason;
	}

	public Date getDecisionDate() {
		return decisionDate;
	}

	public void setDecisionDate(Date decisionDate) {
		this.decisionDate = decisionDate;
	}

	public int getStateCode() {
		return stateCode;
	}

	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getAdCode() {
		return adCode;
	}

	public void setAdCode(int adCode) {
		this.adCode = adCode;
	}

	
	
	public String getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}

	@Override
	public String toString() {
		return "DecisionDTO [decisionCode=" + decisionCode + ", decisionReason=" + decisionReason + ", decisionDate="
				+ decisionDate + ", stateCode=" + stateCode + ", code=" + code + ", adCode=" + adCode + "]";
	}

	
	
	
}

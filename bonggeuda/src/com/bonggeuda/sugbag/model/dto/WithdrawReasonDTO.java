package com.bonggeuda.sugbag.model.dto;

public class WithdrawReasonDTO {

	private int withdrawNo;
	private int memberNo;
	private String withdrawReason;
	private String writerType;
	
	public WithdrawReasonDTO() {}

	public WithdrawReasonDTO(int withdrawNo, int memberNo, String withdrawReason, String writerType) {
		super();
		this.withdrawNo = withdrawNo;
		this.memberNo = memberNo;
		this.withdrawReason = withdrawReason;
		this.writerType = writerType;
	}

	public int getWithdrawNo() {
		return withdrawNo;
	}

	public void setWithdrawNo(int withdrawNo) {
		this.withdrawNo = withdrawNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getWithdrawReason() {
		return withdrawReason;
	}

	public void setWithdrawReason(String withdrawReason) {
		this.withdrawReason = withdrawReason;
	}

	public String getWriterType() {
		return writerType;
	}

	public void setWriterType(String writerType) {
		this.writerType = writerType;
	}

	@Override
	public String toString() {
		return "WithdrawReasonDTO [withdrawNo=" + withdrawNo + ", memberNo=" + memberNo + ", withdrawReason="
				+ withdrawReason + ", writerType=" + writerType + "]";
	}
	
}

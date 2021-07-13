package com.bonggeuda.sugbag.model.dto;

public class CoronaDTO {
    private String date;  // 기준일시
    private String incDec;// 전일대비증감
    private  String defCnt;// 누적확진자수
    private String isolIngCnt; //격리중 환자수
    private String isolClearCnt; //격리해제 환자수
	public CoronaDTO() {
		super();
	}
	public CoronaDTO(String date, String incDec, String defCnt, String isolIngCnt, String isolClearCnt) {
		super();
		this.date = date;
		this.incDec = incDec;
		this.defCnt = defCnt;
		this.isolIngCnt = isolIngCnt;
		this.isolClearCnt = isolClearCnt;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIncDec() {
		return incDec;
	}
	public void setIncDec(String incDec) {
		this.incDec = incDec;
	}
	public String getDefCnt() {
		return defCnt;
	}
	public void setDefCnt(String defCnt) {
		this.defCnt = defCnt;
	}
	public String getIsolIngCnt() {
		return isolIngCnt;
	}
	public void setIsolIngCnt(String isolIngCnt) {
		this.isolIngCnt = isolIngCnt;
	}
	public String getIsolClearCnt() {
		return isolClearCnt;
	}
	public void setIsolClearCnt(String isolClearCnt) {
		this.isolClearCnt = isolClearCnt;
	}
	@Override
	public String toString() {
		return "CoronaDTO [date=" + date + ", incDec=" + incDec + ", defCnt=" + defCnt + ", isolIngCnt=" + isolIngCnt
				+ ", isolClearCnt=" + isolClearCnt + "]";
	}
    
    
    
}

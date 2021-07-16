package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class BoradAndCommentDTO {
	
	private int boardCode;	//게시글코드
	private String boardTitle;	//게시글제목
	private String boardContent;	//게시글내용
	private int views;	//조회수
	private Date postDate;	//포스팅날
	private String deleteYn;	//삭제여부
	private int dicisionCode;	//관리자승인여부(두개페이지)
	private String boardMap;	//지도값
	private int userCode;	//유저코드
	private int replyCode;  //댓글코드
	private String replyContent; //댓글내용
	private Date replyDate; //댓글작성날짜
	private String replyDeleteYn; //댓글삭제여부
	private String reportYn; //신고여부
	private String type;
	private int state; 		//심사코드에 따른 상태코드
	private String dReason;
	private String adoptDeleteYn;
	private String missingDeleteYn;

	public BoradAndCommentDTO() {
		
	}

	public BoradAndCommentDTO(int boardCode, String boardTitle, String boardContent, int views, Date postDate,
			String deleteYn, int dicisionCode, String boardMap, int userCode, int replyCode, String replyContent,
			Date replyDate, String replyDeleteYn, String reportYn, String type, int state, String dReason,
			String adoptDeleteYn, String missingDeleteYn) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.views = views;
		this.postDate = postDate;
		this.deleteYn = deleteYn;
		this.dicisionCode = dicisionCode;
		this.boardMap = boardMap;
		this.userCode = userCode;
		this.replyCode = replyCode;
		this.replyContent = replyContent;
		this.replyDate = replyDate;
		this.replyDeleteYn = replyDeleteYn;
		this.reportYn = reportYn;
		this.type = type;
		this.state = state;
		this.dReason = dReason;
		this.adoptDeleteYn = adoptDeleteYn;
		this.missingDeleteYn = missingDeleteYn;
	}

	public int getBoardCode() {
		return boardCode;
	}

	public void setBoardCode(int boardCode) {
		this.boardCode = boardCode;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public String getDeleteYn() {
		return deleteYn;
	}

	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}

	public int getDicisionCode() {
		return dicisionCode;
	}

	public void setDicisionCode(int dicisionCode) {
		this.dicisionCode = dicisionCode;
	}

	public String getBoardMap() {
		return boardMap;
	}

	public void setBoardMap(String boardMap) {
		this.boardMap = boardMap;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public int getReplyCode() {
		return replyCode;
	}

	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public String getReplyDeleteYn() {
		return replyDeleteYn;
	}

	public void setReplyDeleteYn(String replyDeleteYn) {
		this.replyDeleteYn = replyDeleteYn;
	}

	public String getReportYn() {
		return reportYn;
	}

	public void setReportYn(String reportYn) {
		this.reportYn = reportYn;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getdReason() {
		return dReason;
	}

	public void setdReason(String dReason) {
		this.dReason = dReason;
	}

	public String getAdoptDeleteYn() {
		return adoptDeleteYn;
	}

	public void setAdoptDeleteYn(String adoptDeleteYn) {
		this.adoptDeleteYn = adoptDeleteYn;
	}

	public String getMissingDeleteYn() {
		return missingDeleteYn;
	}

	public void setMissingDeleteYn(String missingDeleteYn) {
		this.missingDeleteYn = missingDeleteYn;
	}

	@Override
	public String toString() {
		return "BoradAndCommentDTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", views=" + views + ", postDate=" + postDate + ", deleteYn=" + deleteYn
				+ ", dicisionCode=" + dicisionCode + ", boardMap=" + boardMap + ", userCode=" + userCode
				+ ", replyCode=" + replyCode + ", replyContent=" + replyContent + ", replyDate=" + replyDate
				+ ", replyDeleteYn=" + replyDeleteYn + ", reportYn=" + reportYn + ", type=" + type + ", state=" + state
				+ ", dReason=" + dReason + ", adoptDeleteYn=" + adoptDeleteYn + ", missingDeleteYn=" + missingDeleteYn
				+ "]";
	}

	
	
	
	
	
	
}

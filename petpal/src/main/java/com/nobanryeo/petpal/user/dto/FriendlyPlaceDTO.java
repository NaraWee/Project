package com.nobanryeo.petpal.user.dto;

import java.sql.Date;

public class FriendlyPlaceDTO {

	private int boardCode;
	private String boardTitle;
	private String boardContent;
	private int boardViews;
	private Date boardPostDate;
	private String boardDeleteYn;
	private int decisionCode;
	private int userCode;
	private String placeName;
	private String placePhone;
	private String placeAddress;
	private String userNickName;
	private int pictureCode;
	private String pictureURL;
	private String pictureDeleteYN;
	private String pictureName;
	private String pictureNewName;
	private String pictureUtilPath;
	private String keyWord;
	private int nowPage; 	//현재 페이지
	private int startPage;	//시작페이지
	private int endPage;	//끝페이지
	private int total;		//게시글 총 갯수
	private int cntPerPage;	//페이지당 글 갯수
	private int lastPage;	//마지막페이지
	private int start;		//쿼리에 쓸 start
	private int end;		//쿼리에 쓸 end
	
	private int cntPage = 5;
	
	public FriendlyPlaceDTO() {
	}
	
	public FriendlyPlaceDTO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	public FriendlyPlaceDTO(int boardCode, String boardTitle, String boardContent, int boardViews, Date boardPostDate,
			String boardDeleteYn, int decisionCode, int userCode, String placeName, String placePhone,
			String placeAddress, String userNickName, int pictureCode, String pictureURL, String pictureDeleteYN,
			String pictureName, String pictureNewName, String pictureUtilPath, String keyWord, int nowPage,
			int startPage, int endPage, int total, int cntPerPage, int lastPage, int start, int end, int cntPage) {
		super();
		this.boardCode = boardCode;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardViews = boardViews;
		this.boardPostDate = boardPostDate;
		this.boardDeleteYn = boardDeleteYn;
		this.decisionCode = decisionCode;
		this.userCode = userCode;
		this.placeName = placeName;
		this.placePhone = placePhone;
		this.placeAddress = placeAddress;
		this.userNickName = userNickName;
		this.pictureCode = pictureCode;
		this.pictureURL = pictureURL;
		this.pictureDeleteYN = pictureDeleteYN;
		this.pictureName = pictureName;
		this.pictureNewName = pictureNewName;
		this.pictureUtilPath = pictureUtilPath;
		this.keyWord = keyWord;
		this.nowPage = nowPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.total = total;
		this.cntPerPage = cntPerPage;
		this.lastPage = lastPage;
		this.start = start;
		this.end = end;
		this.cntPage = cntPage;
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

	public int getBoardViews() {
		return boardViews;
	}

	public void setBoardViews(int boardViews) {
		this.boardViews = boardViews;
	}

	public Date getBoardPostDate() {
		return boardPostDate;
	}

	public void setBoardPostDate(Date boardPostDate) {
		this.boardPostDate = boardPostDate;
	}

	public String getBoardDeleteYn() {
		return boardDeleteYn;
	}

	public void setBoardDeleteYn(String boardDeleteYn) {
		this.boardDeleteYn = boardDeleteYn;
	}

	public int getDecisionCode() {
		return decisionCode;
	}

	public void setDecisionCode(int decisionCode) {
		this.decisionCode = decisionCode;
	}

	public int getUserCode() {
		return userCode;
	}

	public void setUserCode(int userCode) {
		this.userCode = userCode;
	}

	public String getPlaceName() {
		return placeName;
	}

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	public String getPlacePhone() {
		return placePhone;
	}

	public void setPlacePhone(String placePhone) {
		this.placePhone = placePhone;
	}

	public String getPlaceAddress() {
		return placeAddress;
	}

	public void setPlaceAddress(String placeAddress) {
		this.placeAddress = placeAddress;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public int getPictureCode() {
		return pictureCode;
	}

	public void setPictureCode(int pictureCode) {
		this.pictureCode = pictureCode;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public String getPictureDeleteYN() {
		return pictureDeleteYN;
	}

	public void setPictureDeleteYN(String pictureDeleteYN) {
		this.pictureDeleteYN = pictureDeleteYN;
	}

	public String getPictureName() {
		return pictureName;
	}

	public void setPictureName(String pictureName) {
		this.pictureName = pictureName;
	}

	public String getPictureNewName() {
		return pictureNewName;
	}

	public void setPictureNewName(String pictureNewName) {
		this.pictureNewName = pictureNewName;
	}

	public String getPictureUtilPath() {
		return pictureUtilPath;
	}

	public void setPictureUtilPath(String pictureUtilPath) {
		this.pictureUtilPath = pictureUtilPath;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getCntPerPage() {
		return cntPerPage;
	}

	public void setCntPerPage(int cntPerPage) {
		this.cntPerPage = cntPerPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getCntPage() {
		return cntPage;
	}

	public void setCntPage(int cntPage) {
		this.cntPage = cntPage;
	}

	@Override
	public String toString() {
		return "FriendlyPlaceDTO [boardCode=" + boardCode + ", boardTitle=" + boardTitle + ", boardContent="
				+ boardContent + ", boardViews=" + boardViews + ", boardPostDate=" + boardPostDate + ", boardDeleteYn="
				+ boardDeleteYn + ", decisionCode=" + decisionCode + ", userCode=" + userCode + ", placeName="
				+ placeName + ", placePhone=" + placePhone + ", placeAddress=" + placeAddress + ", userNickName="
				+ userNickName + ", pictureCode=" + pictureCode + ", pictureURL=" + pictureURL + ", pictureDeleteYN="
				+ pictureDeleteYN + ", pictureName=" + pictureName + ", pictureNewName=" + pictureNewName
				+ ", pictureUtilPath=" + pictureUtilPath + ", keyWord=" + keyWord + ", nowPage=" + nowPage
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", total=" + total + ", cntPerPage="
				+ cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end + ", cntPage=" + cntPage
				+ "]";
	}

}

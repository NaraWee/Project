package com.nobanryeo.petpal.admin.dto;

public class AdminPageInfoDTO {

	private int nowPage;    // 현재페이지
	private int startPage;  //시작페이지
	private int endPage;    //끝페이지
	private int total;      //게시글 총 갯수
	private int cntPerPage; //페이지당 글 갯수
	private int lastPage;   //마지막페이지
	private int start;      //SQL쿼리에 쓸 start
	private int end;        //SQL쿼리에 쓸 end
	private int cntPage = 5;
	private String category;
	private String searchCondition;
	private String searchValue;
	private String sortValue;
	private int fullMonth; // 월별 조회 
	
	public AdminPageInfoDTO() {
		super();
	}

	public AdminPageInfoDTO(int total, int nowPage, int cntPerPage, String category) {
	   setNowPage(nowPage);
	   setCntPerPage(cntPerPage);
	   setTotal(total);
	   setCategory(category);
	   calcLastPage(getTotal(), getCntPerPage());
	   calcStartEndPage(getNowPage(), cntPage);
	   calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	public AdminPageInfoDTO(String category) {
		   setCategory(category);
	}
	
	public AdminPageInfoDTO(int fullMonth) {
		   setFullMonth(fullMonth);
	}
	
	public AdminPageInfoDTO(String category, int fullMonth) {
		   setCategory(category);
		   setFullMonth(fullMonth);
		}

	public AdminPageInfoDTO(String category, String searchValue) {
		setCategory(category);
		setSearchValue(searchValue);
	}
	
	public AdminPageInfoDTO(String category, String searchCondition, String searchValue) {
		   setCategory(category);
		   setSearchCondition(searchCondition);
		   setSearchValue(searchValue);
		}
	
	public AdminPageInfoDTO(int nowPage, int cntPerPage, String category, String searchValue, int total) {
		   setNowPage(nowPage);
		   setCntPerPage(cntPerPage);
		   setTotal(total);
		   setCategory(category);
		   setSearchValue(searchValue);
		   calcLastPage(getTotal(), getCntPerPage());
		   calcStartEndPage(getNowPage(), cntPage);
		   calcStartEnd(getNowPage(), getCntPerPage());
		}
	
	public AdminPageInfoDTO(int total, int nowPage, int cntPerPage, String category
			,String searchCondition, String searchValue) {
		   setNowPage(nowPage);
		   setCntPerPage(cntPerPage);
		   setTotal(total);
		   setCategory(category);
		   setSearchCondition(searchCondition);
		   setSearchValue(searchValue);
		   calcLastPage(getTotal(), getCntPerPage());
		   calcStartEndPage(getNowPage(), cntPage);
		   calcStartEnd(getNowPage(), getCntPerPage());
		}
	
	// 월별 조회
	public AdminPageInfoDTO(int total, int nowPage, int cntPerPage, String category
			, int fullMonth) {
		   setNowPage(nowPage);
		   setCntPerPage(cntPerPage);
		   setTotal(total);
		   setCategory(category);
		   setFullMonth(fullMonth);
		   calcLastPage(getTotal(), getCntPerPage());
		   calcStartEndPage(getNowPage(), cntPage);
		   calcStartEnd(getNowPage(), getCntPerPage());
		}
	

	//임시로 만듦(성훈)(sort용)
	public AdminPageInfoDTO(int total, int nowPage, int cntPerPage, String category, String sortValue) {
		   setNowPage(nowPage);
		   setCntPerPage(cntPerPage);
		   setTotal(total);
		   setCategory(category);
		   setSortValue(sortValue);
		   calcLastPage(getTotal(), getCntPerPage());
		   calcStartEndPage(getNowPage(), cntPage);
		   calcStartEnd(getNowPage(), getCntPerPage());
		}
	
	public AdminPageInfoDTO(int total, int nowPage, int cntPerPage, String category
			,String searchCondition, String searchValue, String sortValue) {
		   setNowPage(nowPage);
		   setCntPerPage(cntPerPage);
		   setTotal(total);
		   setCategory(category);
		   setSearchCondition(searchCondition);
		   setSearchValue(searchValue);
		   setSortValue(sortValue);

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
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getSortValue() {
		return sortValue;
	}

	public void setSortValue(String sortValue) {
		this.sortValue = sortValue;
	}

	public int getFullMonth() {
		return fullMonth;
	}

	public void setFullMonth(int fullMonth) {
		this.fullMonth = fullMonth;
	}

	@Override
	public String toString() {
		return "AdminPageInfoDTO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
				+ total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end=" + end
				+ ", cntPage=" + cntPage + ", category=" + category + ", searchCondition=" + searchCondition
				+ ", searchValue=" + searchValue + ", sortValue=" + sortValue + ", fullMonth=" + fullMonth + "]";
	}

	

	 
	 
}

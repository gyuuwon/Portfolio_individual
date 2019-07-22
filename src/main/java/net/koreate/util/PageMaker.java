package net.koreate.util;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 10;
	
	Criteria cri;
	
	public void calPaging() {
		//[1] ~  [10]
		endPage = (int)(Math.ceil(cri.getPage()/(double)displayPageNum))*displayPageNum;
		startPage = (endPage - displayPageNum) +1;
		int maxPage = (int)Math.ceil((totalCount/(double)cri.getPerPageNum()));
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		prev = (startPage == 1) ? false : true;
		
		next = (endPage * cri.getPerPageNum() >= totalCount) ? false : true; 
		
	}
	

	public String makeSearchQuery(int page) {
		UriComponents uc = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword()).build();
		String query = uc.toString();
		System.out.println(query );
		return query;
	}




	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calPaging();
	}




	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}




	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}




	public void setPrev(boolean prev) {
		this.prev = prev;
	}




	public void setNext(boolean next) {
		this.next = next;
	}




	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}




	public void setCri(Criteria cri) {
		this.cri = cri;
	}

}

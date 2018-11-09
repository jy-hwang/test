package net.koreate.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
  
  int totalCount;
  int startPage;
  int endPage;
  boolean prev;
  boolean next;
  int displayPageNum = 10;
  Criteria cri;
  
  public void calData() {
    
    endPage = (int) Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum;
    
    startPage = (endPage - displayPageNum) + 1;
    
    int temp = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
    
    if (endPage > temp) {
      endPage = temp;
    }
    
    prev = startPage == 1 ? false : true;
    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
    
  }
  
  public int getTotalCount() {
    return totalCount;
  }
  
  public void setTotalCount(int totalCount) {
    this.totalCount = totalCount;
    calData();
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
  
  public boolean isPrev() {
    return prev;
  }
  
  public void setPrev(boolean prev) {
    this.prev = prev;
  }
  
  public boolean isNext() {
    return next;
  }
  
  public void setNext(boolean next) {
    this.next = next;
  }
  
  public int getDisplayPageNum() {
    return displayPageNum;
  }
  
  public void setDisplayPageNum(int displayPageNum) {
    this.displayPageNum = displayPageNum;
  }
  
  public Criteria getCri() {
    return cri;
  }
  
  public void setCri(Criteria cri) {
    this.cri = cri;
  }
  
  public String makeQuery(int page) {
    UriComponents uc = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", cri.getPerPageNum()).build();
    return uc.toString();
  }
  
  public String makeSearch(int page) {
    UriComponents uc = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", cri.getPerPageNum())
       .queryParam("searchType", ((SearchCriteria) cri).getSearchType()).queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword())).build();
    
    return uc.toString();
  }
  
  private String encoding(String keyword) {
    if (keyword == null || keyword.trim().length() == 0) {
      
      return "";
      
    }
    try {
      return URLEncoder.encode(keyword, "UTF-8");
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
      e.printStackTrace();
      return "";
    }
    
  }
  
}

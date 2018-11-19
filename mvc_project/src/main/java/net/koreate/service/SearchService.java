package net.koreate.service;

import java.util.List;

import net.koreate.vo.BookVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

public interface SearchService {

	List<BookVo> searchLibCriteria(SearchCriteria cri) throws Exception;

	PageMaker getPageMaker(SearchCriteria cri) throws Exception;
  
}

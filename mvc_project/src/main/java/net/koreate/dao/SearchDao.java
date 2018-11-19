package net.koreate.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import net.koreate.vo.BookVo;
import net.koreate.vo.SearchCriteria;

@Repository
public interface SearchDao {

	List<BookVo> searchLibCriteria(SearchCriteria cri) throws Exception;
  
}

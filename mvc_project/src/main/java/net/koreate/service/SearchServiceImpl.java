package net.koreate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.dao.SearchDao;
import net.koreate.vo.BookVo;
import net.koreate.vo.PageMaker;
import net.koreate.vo.SearchCriteria;

@Service
public class SearchServiceImpl implements SearchService {

	@Inject
	SearchDao dao;

	@Override
	public List<BookVo> searchLibCriteria(SearchCriteria cri) throws Exception {
		List<BookVo> list = dao.searchLibCriteria(cri);
		for (BookVo bv : list) {
		}

		return list;
	}

	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		return pageMaker;
	}

}

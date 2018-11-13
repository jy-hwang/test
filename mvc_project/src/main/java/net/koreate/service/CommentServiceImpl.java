package net.koreate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import net.koreate.dao.CommentDao;
import net.koreate.vo.CommentVo;
import net.koreate.vo.Criteria;
import net.koreate.vo.PageMaker;

@Service
public class CommentServiceImpl implements CommentService {
  
  @Inject
  CommentDao dao;
  
  @Override
  public void addComment(CommentVo vo) throws Exception {
    dao.create(vo);
  }
  
  @Override
  public List<CommentVo> commentList(int fno) throws Exception {
    
    return dao.list(fno);
  }
  
  // 페이징 처리 객체
  @Override
  public PageMaker getPageMaker(int page, int fno) throws Exception {
    Criteria cri = new Criteria();
    cri.setPage(page);
    ;
    int cnt = dao.count(fno);
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    pageMaker.setTotalCount(cnt);
    
    return pageMaker;
  }
  
  // 페이징 처리된 게시물의 정보
  @Override
  public List<CommentVo> listCommentPage(int fno, Criteria cri) throws Exception {
    Map<String, Object> map = new HashMap<>();
    map.put("fno", fno);
    map.put("cri", cri);
    
    return dao.listPage(map);
  }
  
}

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
	CommentDao cmdao;

	// comment 등록
	@Override
	public void addComment(CommentVo cmvo) throws Exception {
		cmdao.create(cmvo);

	}

	// bno 게시물의 모든 comment
	@Override
	public List<CommentVo> commentList(int bno) throws Exception {

		return cmdao.list(bno);
	}

	// 댓글 수정
	@Override
	public void modifyComment(CommentVo cmvo) throws Exception {
		cmdao.update(cmvo);

	}

	// 댓글삭제
	@Override
	public void removeComment(int cno) throws Exception {
		cmdao.delete(cno);

	}

	// 페이징 처리 객체
	@Override
	public PageMaker getPageMaker(int page, int bno) throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(page);
		;
		int cnt = cmdao.count(bno);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);

		return pageMaker;
	}

	// 페이징 처리된 게시물의 정보
	@Override
	public List<CommentVo> listCommentPage(int bno, Criteria cri) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("bno", bno);
		map.put("cri", cri);
		return cmdao.listPage(map);
	}

}

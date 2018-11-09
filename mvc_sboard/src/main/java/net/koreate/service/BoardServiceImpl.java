package net.koreate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.koreate.dao.BoardDao;
import net.koreate.vo.PageMaker;
import net.koreate.vo.ReplyBoardVo;
import net.koreate.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDao dao;

	@Transactional
	@Override
	public void registerReply(ReplyBoardVo boardVo) throws Exception {
		dao.registerReply(boardVo);
		/*
		 * int bno = boardVo.getBno(); dao.updateOrigin(bno);
		 */
		dao.updateOrigin();
		String[] files = boardVo.getFiles();
    if(files == null) return;

		
		for (String fullName : files) {
			/* System.out.println(fullName); */
			dao.addAttach(fullName);
		}
	}

	@Override
	public List<ReplyBoardVo> listReplyCriteria(SearchCriteria cri) throws Exception {
		List<ReplyBoardVo> list = dao.listReplyCriteria(cri);
	  for(ReplyBoardVo vo : list) {
	    vo.setCommentCnt(dao.getCommentCnt(vo.getBno()));
	  }
	  /*return dao.listReplyCriteria(cri);*/
	  return list;
	}

	// make PageMaker
	@Override
	public PageMaker getPageMaker(SearchCriteria cri) throws Exception {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		int cnt = dao.listReplyCount(cri);
		pageMaker.setTotalCount(cnt);
		return pageMaker;
	}

	@Override
	public void updateCnt(int bno) throws Exception {
		dao.updateCnt(bno);
	}

	@Override
	public ReplyBoardVo readReply(int bno) throws Exception {
		ReplyBoardVo boardVo = dao.readReply(bno);
		boardVo.setCommentCnt(dao.getCommentCnt(bno));
		/*
		 * List<String> list = dao.getAttach(bno);
		 * 
		 * for(String fullName : list) { boardVo }
		 */
		return boardVo;
	}

	@Override
	public void replyRegister(ReplyBoardVo boardVo) throws Exception {

		// 그룹 번호
		int origin = boardVo.getOrigin();
		// 그룹 수준번호(답변레벨)
		int depth = boardVo.getDepth();
		// 정렬수준(답변순서)
		int seq = boardVo.getSeq();

		dao.updateReply(boardVo);

		boardVo.setOrigin(origin);
		boardVo.setDepth(depth + 1);
		boardVo.setSeq(seq + 1);

		dao.replyRegister(boardVo);

	}

	// remove 관련 추가하기

	@Override
	public List<String> getAttach(int bno) throws Exception {

		return dao.getAttach(bno);
	}

	@Transactional
	@Override
	public void remove(int bno) throws Exception {
		dao.deleteAttach(bno);
	  dao.delete(bno);
	}

	@Transactional
	@Override
	public void modify(ReplyBoardVo board) throws Exception {
		dao.update(board);
		int bno = board.getBno();
		dao.deleteAttach(bno);
		String [] files = board.getFiles();
		
		if(files == null) return;
		for(String fullName : files) {
			Map<String,Object> map = new HashMap<>();
			map.put("bno",bno);
			map.put("fullName", fullName);
			dao.replaceAttach(map);
		}

	}

}

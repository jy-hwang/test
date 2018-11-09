package net.koreate.service;

import java.util.List;

import net.koreate.vo.PageMaker;
import net.koreate.vo.ReplyBoardVo;
import net.koreate.vo.SearchCriteria;

public interface BoardService {

	// 게시물 작성
	void registerReply(ReplyBoardVo boardVo) throws Exception;

	List<ReplyBoardVo> listReplyCriteria(SearchCriteria cri) throws Exception;

	PageMaker getPageMaker(SearchCriteria cri) throws Exception;

	void updateCnt(int bno) throws Exception;

	ReplyBoardVo readReply(int bno) throws Exception;

	void replyRegister(ReplyBoardVo boardVo) throws Exception;

	List<String> getAttach(int bno) throws Exception;

	void remove(int bno) throws Exception;

	void modify(ReplyBoardVo board) throws Exception;

}

package net.koreate.dao;

import java.util.List;
import java.util.Map;

import net.koreate.vo.ReplyBoardVo;
import net.koreate.vo.SearchCriteria;

public interface BoardDao {

	void registerReply(ReplyBoardVo boardVo) throws Exception;

	/*void updateOrigin(int bno) throws Exception;*/
	void updateOrigin() throws Exception;

	List<ReplyBoardVo> listReplyCriteria(SearchCriteria cri);

	int listReplyCount(SearchCriteria cri) throws Exception;

	void updateCnt(int bno) throws Exception;

	ReplyBoardVo readReply(int bno) throws Exception;

	void updateReply(ReplyBoardVo boardVo) throws Exception;

	void replyRegister(ReplyBoardVo boardVo) throws Exception;

	void addAttach(String fullName) throws Exception;

	List<String> getAttach(int bno)throws Exception;

	void delete(int bno) throws Exception;

	void update(ReplyBoardVo board) throws Exception;

	void deleteAttach(int bno) throws Exception;

	void replaceAttach(Map<String, Object> map) throws Exception;

  int getCommentCnt(int bno) throws Exception;

	
	
}

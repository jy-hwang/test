package net.koreate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.koreate.service.BoardService;
import net.koreate.vo.PageMaker;
import net.koreate.vo.ReplyBoardVo;
import net.koreate.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class ReplySearchController {

	@Inject
	BoardService service;

	@RequestMapping(value = "/listReply", method = RequestMethod.GET)
	public void replyList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		List<ReplyBoardVo> list = service.listReplyCriteria(cri);
		model.addAttribute("list", list);
		PageMaker pageMaker = service.getPageMaker(cri);
		model.addAttribute(pageMaker);
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void register() {

	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(ReplyBoardVo boardVo) throws Exception {
		System.out.println(boardVo);
		/*service.registerReply(boardVo);*/
		return "redirect:/board/listReply";
	}

	@RequestMapping(value = "/readPage", method = RequestMethod.GET)
	public String readPage(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		service.updateCnt(bno);
		rttr.addAttribute("bno", bno);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/readDetail";

	}

	@RequestMapping(value = "/readDetail", method = RequestMethod.GET)
	public String readDetail(@ModelAttribute("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		ReplyBoardVo boardVo = service.readReply(bno);
		model.addAttribute("boardVo", boardVo);
		return "/board/readPage";

	}

	@RequestMapping(value = "/replyRegister", method = RequestMethod.GET)
	public void replyRegister(@ModelAttribute("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model)
			throws Exception {
		model.addAttribute("boardVo", service.readReply(bno));
	}

	@RequestMapping(value = "/replyRegister", method = RequestMethod.POST)
	public String replyRegisterPOST(ReplyBoardVo boardVo, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception {
		System.out.println(boardVo);
		service.replyRegister(boardVo);
		rttr.addFlashAttribute("result", "SUCCESS");
		return "redirect:/board/listReply";

	}
	
	//삭제 메소드 추가할것
	@RequestMapping(value="/removePage",method=RequestMethod.POST)
	public String remove(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri,
			RedirectAttributes rttr) throws Exception{
		
		service.remove(bno);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("result","SUCCESS");
		
		
		return "redirect:/board/listReply";
		
	}
	
	//수정하기
	@RequestMapping(value="/modifyPage",method=RequestMethod.GET)
	public void modifyGET(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri,
			Model model) throws Exception{
		model.addAttribute("boardVo",service.readReply(bno));
		
	}
	@RequestMapping(value="/modifyPage",method=RequestMethod.POST)
	public String modifyPOST(ReplyBoardVo board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
		service.modify(board);
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		rttr.addAttribute("searchType",cri.getSearchType());
		rttr.addAttribute("keyword",cri.getKeyword());
		rttr.addFlashAttribute("results","SUCCESS");
		return "redirect:/board/listReply";
	}
	
	
	
	//tbl_attach 에서 파일불러와서 readPage 같이 볼수있게하기
	@RequestMapping(value ="/getAttach/{bno}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bno") int bno) throws Exception {
		List<String> list = service.getAttach(bno);
				return list;
	}

}

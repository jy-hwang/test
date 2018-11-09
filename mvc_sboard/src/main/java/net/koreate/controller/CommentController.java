package net.koreate.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import net.koreate.service.CommentService;
import net.koreate.vo.CommentVo;
import net.koreate.vo.PageMaker;

@RestController
@RequestMapping("/comments")
public class CommentController {

	@Inject
	CommentService service;

	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody CommentVo cmvo) {

		ResponseEntity<String> entity = null;

		try {
			service.addComment(cmvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		}

		return entity;

	}

	@RequestMapping(value = "/all/{bno}", method = RequestMethod.GET)
	public ResponseEntity<List<CommentVo>> list(@PathVariable("bno") int bno) {
		ResponseEntity<List<CommentVo>> entity = null;
		try {
			List<CommentVo> list = service.commentList(bno);
			entity = new ResponseEntity<List<CommentVo>>(list, HttpStatus.OK);
		} catch (Exception e) {

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;

	}

	@RequestMapping(value = "/{cno}", method = { RequestMethod.PUT, RequestMethod.PATCH })
	public ResponseEntity<String> update(@PathVariable("cno") int cno, @RequestBody CommentVo cmvo) {

		ResponseEntity<String> entity = null;

		try {
			cmvo.setCno(cno);
			service.modifyComment(cmvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);

		}
		return entity;
	}

	@RequestMapping(value = "/{cno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("cno") int cno) {
		ResponseEntity<String> entity = null;
		try {
			service.removeComment(cno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {

			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;

	}

	@RequestMapping(value = "/{bno}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bno") int bno, @PathVariable("page") int page) {
		// url 요청에 따른 값의 변화, 주소의 변화

		ResponseEntity<Map<String, Object>> entity = null;
		try {
			PageMaker pageMaker = service.getPageMaker(page, bno);

			// 2개의 객체를 보내기 위해 MAP 클래스 사용 key/value
			Map<String, Object> map = new HashMap<>();
			List<CommentVo> list = service.listCommentPage(bno, pageMaker.getCri());
			map.put("pageMaker", pageMaker);
			map.put("list", list);
			entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
			//map 객체와 상태코드를 함께 담아서 넘김
			
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}

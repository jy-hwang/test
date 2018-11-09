package net.koreate.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import net.koreate.util.MediaUtils;
import net.koreate.util.UploadFileUtils;

@Controller
public class UploadController {

	@Resource(name = "uploadPath")
	String uploadPath;

	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public String uploadFormPOST(MultipartFile file, Model model) throws IOException {
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());
		System.out.println(file.getContentType());

		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		model.addAttribute("savedName", savedName);
		return "uploadResult";

	}

	// 내부에서 사용하는 메소드
	public String uploadFile(String originalName, byte[] fileData) throws IOException {
		
		//파일명이 중복되지 않게 하기 위해 randomUUID 사용
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		File file = new File(uploadPath, savedName);

		//스프링에서 제공하는 파일입출력 라이브러리
		FileCopyUtils.copy(fileData, file);

		return savedName;
	}

	
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.GET)
	public void upoloadAjax() {
	}

	
	@ResponseBody
	//한글이 사용되면 깨짐현상이 발생할 수 있기에 produces 에 인코딩 설정
	@RequestMapping(value = "/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> upoloadAjax(MultipartFile file) throws Exception, IOException {
		
		System.out.println(file.getOriginalFilename());

		return new ResponseEntity<String>(
				UploadFileUtils.uploadFile(file.getOriginalFilename(), uploadPath, file.getBytes()),
				HttpStatus.CREATED);
	}

	
	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		InputStream is = null;
		ResponseEntity<byte[]> entity = null;

		System.out.println(fileName);

		try {
			String formatName = fileName.substring((fileName.lastIndexOf(".") + 1));
			System.out.println(formatName);

			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			is = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				headers.setContentType(mType);
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-disposition",
						"attachment;fileName=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");

			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(is), headers, HttpStatus.CREATED);
		} catch (Exception e) {

			e.printStackTrace();
		} finally {
			is.close();
		}
		return entity;
	}
	
	@RequestMapping(value="/deleteFile",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFile(String fileName){
		ResponseEntity<String> entity = null;
		
		System.out.println("삭제요청 : " + fileName);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		MediaType mType =  MediaUtils.getMediaType(formatName);
		
		if(mType != null) {
			System.out.println("이미지파일");
			String front = fileName.substring(0, 12);
			String end = fileName.substring(14);
			new File(uploadPath+(front+end).replace('/',File.separatorChar)).delete();
			
					
		}
		System.out.println("원본 파일 삭제");
		new File(uploadPath+fileName.replace('/',File.separatorChar)).delete();
		entity = new ResponseEntity<String>("deleted",HttpStatus.OK);	
		System.out.println("삭제완료");
		return entity;
	}
	
	@ResponseBody
	@RequestMapping(value="deleteAllFiles",method=RequestMethod.POST)
	public ResponseEntity<String> deleteFiles(@RequestParam("files[]") String[] files){
	  ResponseEntity<String> entity = null;
	  
	  if(files == null || files.length == 0) {
	    return new ResponseEntity<>("deleted",HttpStatus.OK);
	    
	  }
	  
	  for(String fileName : files) {
	    String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
	    MediaType mType = MediaUtils.getMediaType(formatName);
	    if(mType != null) {
	      String front = fileName.substring(0, 12);
	      String end = fileName.substring(14);
	      new File(uploadPath+(front + end).replace('/', File.separatorChar));
	    }
	    new File(uploadPath+fileName.replace('/', File.separatorChar));
	  }
	  return new ResponseEntity<String>("deleted",HttpStatus.OK);
	  
	  
	}
	
	
	
}

package org.ksw.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.ksw.model.AttachFileDTO;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class UploadController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "/sing/SingMain";
	}
	// 폴더의 날짜 경로 설정 
		private String getFolder() {
			// 날짜 표기 형식 지정 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String str = sdf.format(date);// 현재날짜(오늘날짜) Sun Dec 17 1995 03:24:00 GMT... ->1995-10-17
			return str.replace("-",File.separator);// -를 원화표시로 바꾼다 
		}
	// 사용자가 업로드한 파일의 이미지 타입인지를 검사하는 메소드 (이미지타입 : true ,아니면 fasle)
		private boolean checkImageType(File file) {
			try {
				// 파일 업로드된 경로의 마임타입 확인
				String contentType =Files.probeContentType(file.toPath());
				return contentType.startsWith("image");
			}catch(Exception e) {
				e.printStackTrace();
			}
			return false;
		}
	
	@RequestMapping(value="/uploadAjaxAction",produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method= RequestMethod.POST)
	public ResponseEntity<ArrayList<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadfile) {
		ArrayList<AttachFileDTO> list = new ArrayList<>();
		String uploadFolder="D:\\upload";
		// 폴더 생성 
		File uploadPath = new File(uploadFolder,getFolder());
		if(uploadPath.exists()==false) { // 만들고자하는 폴더가 없으면 
			uploadPath.mkdirs();// make directory : 폴더를 만든다.
		}
		// 		타입			변수명 		 배열명  	향상된 for문(배열을간단하게)     
		for(MultipartFile multipartFile:uploadfile) {
			//반복문 안에서 attachDTO 객체배열을 계속반복생성하여 여러 이미지 담는다
			//ArrayList 를이용하여 attachDTO를 ArrayList안에 저장 
			AttachFileDTO attachDTO = new AttachFileDTO();
			System.out.println("사용자가 업로드한 실제파일명 ="+multipartFile.getOriginalFilename());
			System.out.println("사용자가 업로드한 실제용량크기 ="+multipartFile.getSize());	
			
			String uploadFileName=multipartFile.getOriginalFilename();
			// uploadFileName을 AttachFileDTO에 fileName변수에 저장
			attachDTO.setFileName(uploadFileName);
			
			// UUID 문자열 생성
			UUID uuid = UUID.randomUUID();
			// UUID 문자열 + "_" + multipartFile.getOriginalFilename() 
			uploadFileName =uuid.toString()+"_"+uploadFileName;
			//getFolder()메소드에 의해 만들어진 폴더를 AttachFileDTO에 uploadPath변수에 저장
			attachDTO.setUploadPath(getFolder());
			// uuid문자열을 AttachFileDTO에 uuid변수에 저장
			attachDTO.setUuid(uuid.toString());
			
//			File saveFile = new File(파일업로드경로,파일명)
			File saveFile = new File(uploadPath,uploadFileName);
			//transferTo메서드(파일업로드)를 쓸때는 try-catch문이 필수 
			try {
				multipartFile.transferTo(saveFile);
				if(checkImageType(saveFile)) { //saveFile이 checkImageType에의해서 true면
					attachDTO.setImage(true);
					// 원본 이미지 파일은 그대로 둔 채로, 섬네일을 새로 만들기 위한...
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath,"s_"+uploadFileName));
					//섬네일 생성.						원본이미지 복사	새로운 이미지 생성(UUID_s_파일명),넓이,높이
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
					// 메모리에서 섬네일 회수
					thumbnail.close();
				}
				list.add(attachDTO);
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}//end for
		return new ResponseEntity<>(list,HttpStatus.OK);
	} // uploadAjaxPost end
	
	//이미지 주소만들기(localhost:8080/display?fileName=경로/파일명)
	@RequestMapping(value="/display",method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {
		File file = new File("D:\\upload\\"+fileName);
		ResponseEntity<byte[]> result= null;
		try {
			HttpHeaders headers = new HttpHeaders();
			// 현재파일의 jpg나 png의 타입정보를 넘겨줌 
			headers.add("Content-Type",Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//다운로드 주소 만들기 (localhost:8080/download?fileName=경로/파일명)
	// 웹브라우저가 다운로드 할수있게끔, application/octet-stream 지정 
	@RequestMapping(value="/download",produces=MediaType.APPLICATION_OCTET_STREAM_VALUE,method=RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		Resource resource = new FileSystemResource("D:\\upload\\"+fileName);
		
		String resourceName=resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();
		try {
			// 다운로드했을때 파일명이 한글깨짐을 방지 
			headers.add("Content-Disposition","attachment;filename="+new String(resourceName.getBytes("UTF-8"),"ISO-8859-1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<Resource>(resource,headers,HttpStatus.OK);
	}
	
}
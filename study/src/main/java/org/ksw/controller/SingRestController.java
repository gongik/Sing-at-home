package org.ksw.controller;

import java.util.ArrayList;

import org.ksw.model.AttachFileDTO;
import org.ksw.model.SingDTO;
import org.ksw.service.SingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SingRestController {

	@Autowired
	SingService Siservice;
	
	@RequestMapping(value="/reply/write",consumes = "application/json",produces= {MediaType.TEXT_PLAIN_VALUE},method=RequestMethod.POST)
	public ResponseEntity<String> add(@RequestBody SingDTO ssdto){
		int result = Siservice.add(ssdto);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				// 그렇지않으면 에러 처리
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
		@RequestMapping(value="/reply/list/{bno}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE,
				//xml형식
				MediaType.APPLICATION_XML_VALUE},method=RequestMethod.GET)
			public ResponseEntity<ArrayList<SingDTO>> list(@PathVariable("bno")int bno){
				return new ResponseEntity<>(Siservice.list(bno),HttpStatus.OK);
	}
		@RequestMapping(value="/reply/detail/{rno}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE,
				MediaType.APPLICATION_XML_VALUE},method=RequestMethod.GET)
			public ResponseEntity<SingDTO> detail(@PathVariable("rno")int rno){
			//통신이 정상적이면 select된 결과를 ajax함수의 success에 보내라
			return new ResponseEntity<>(Siservice.detail(rno),HttpStatus.OK);
		}
												//ajax를 통해 화면에서 서버에게 전달받은 데이터의 타입              success : function(data)에 해당메서드를통해 응답할 데이터 형식  (텍스트형식)
		@RequestMapping(value="/reply/modify",consumes = "application/json",produces= {MediaType.TEXT_PLAIN_VALUE},method=RequestMethod.PUT)
		public ResponseEntity<String> modify(@RequestBody SingDTO ssdto) {
			int result=Siservice.modify(ssdto); //update가 되었으면 1값, 안됬으면 0값 result 에 저장 
			return result==1?new ResponseEntity<>("success",HttpStatus.OK)
					:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		@RequestMapping(value="/reply/remove/{rno}",method=RequestMethod.DELETE,produces= {MediaType.TEXT_PLAIN_VALUE})
		//응답할값과 상태코드까지보내준다 
		public ResponseEntity<String> remove(@PathVariable("rno")int rno){
			int result = Siservice.remove(rno);
			return result==1?new ResponseEntity<>("success",HttpStatus.OK)
					:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		// sing/detail 사진 보기								서버->화면에게 json형식으로 반환하는 데이터타입
		@RequestMapping(value="/sing/attach",produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method=RequestMethod.GET)
		public ResponseEntity<ArrayList<AttachFileDTO>> getAttachList(int bno){
			System.out.println(bno);
			Siservice.AttachList(bno);
			return new ResponseEntity<>(Siservice.AttachList(bno),HttpStatus.OK);
		}
		@RequestMapping(value="/user/idCheck",method=RequestMethod.GET)
		@ResponseBody
		public Integer idCheck(@RequestParam("userId") String user_id) {
			return Siservice.userIdCheck(user_id);
		}
		@RequestMapping(value="/play/list",consumes = "application/json",produces= {MediaType.TEXT_PLAIN_VALUE},method=RequestMethod.POST)
		public ResponseEntity<String> playAdd(@RequestBody SingDTO ssdto){
			int result = Siservice.playAdd(ssdto);
			
			return result==1?new ResponseEntity<>("success",HttpStatus.OK)
					// 그렇지않으면 에러 처리
					:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		@RequestMapping(value="/play/confirm/{id}",produces= {MediaType.APPLICATION_JSON_UTF8_VALUE},method=RequestMethod.GET)
		public ResponseEntity<ArrayList<SingDTO>> playList(@PathVariable("id") String id) {
			return new ResponseEntity<>(Siservice.playList(id),HttpStatus.OK);
		}
		
		@RequestMapping(value="/play/delete/{bno}",method=RequestMethod.DELETE,produces= {MediaType.TEXT_PLAIN_VALUE})
		//응답할값과 상태코드까지보내준다 
		public ResponseEntity<String> playDelete(@PathVariable("bno")int bno){
			int result = Siservice.playDelete(bno);
			return result==1?new ResponseEntity<>("success",HttpStatus.OK)
					:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		@RequestMapping(value="/sing/like",consumes = "application/json",produces= {MediaType.TEXT_PLAIN_VALUE},method=RequestMethod.POST)
		public ResponseEntity<String> singLike(@RequestBody SingDTO ssdto){
		int result = Siservice.SingLike(ssdto);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				// 그렇지않으면 에러 처리
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		@RequestMapping(value="/sing/likeDelete",consumes = "application/json",method=RequestMethod.DELETE)
		public ResponseEntity<String> singLikeDelete(@RequestBody SingDTO ssdto){
		int result = Siservice.SingLikeDelete(ssdto);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				// 그렇지않으면 에러 처리
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
				// 매개변수 두개이상받아올떄 url방식
		@RequestMapping(value = "/sing/list/{id}/{bno}",method=RequestMethod.GET)
				// GENERIC타입 = return값의 타입명시 
		public ResponseEntity<SingDTO> ajax(@PathVariable("id")String id,@PathVariable("bno")int bno) {
										//성공했을때 succes 혹은 받은 데이터값 js에 보냄
			return new ResponseEntity<>(Siservice.SingLikeList(id, bno),HttpStatus.OK);

			}
		}
		

package org.ksw.controller;

import javax.servlet.http.HttpSession;

import org.ksw.model.Criteria;
import org.ksw.model.PageDTO;
import org.ksw.model.SingDTO;
import org.ksw.service.SingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="sing",method=RequestMethod.GET)
public class SingController {

	@Autowired
	SingService Siservice;
	@GetMapping("main")
	public String SingMain() {
		return "sing/SingMain";
	}
	@GetMapping("signup")
	public String SingSign() {
		return "sing/SingSignUp";
	}
	@PostMapping("signupOn")
	public String SingSignUp(SingDTO ssdto) {
		Siservice.SingInsert(ssdto);
		
		return "redirect:/sing/main";
	}
	// HttpSession session 세션 사용 선언
	@PostMapping("loginOn")
	public String SingLogin(SingDTO ssdto, HttpSession session) {
	//결과 log에 저장 
		SingDTO log = Siservice.Login(ssdto);
		//log에 값이 있으면 세션값으로저장
		if(log!=null) {
			session.setAttribute("session",Siservice.Login(ssdto));
			return "redirect:/sing/main";
		}else {
			return"sing/SingLoginFailed";
		}
		
	}
	@GetMapping("login")
	public String login() {
		return "sing/SingLogin";
	}
	@GetMapping("logout")
	public String logout(HttpSession session) {
		//로그아웃할떄 사용하는 함수
		session.invalidate();
		return "redirect:/sing/main";
	}
	@GetMapping("board")
	public String BoardList(Model model,Criteria cri) {
		model.addAttribute("Slist",Siservice.SingList(cri));
		
		model.addAttribute("pageMaker",new PageDTO(cri,Siservice.getTotalCount(cri)));
		return "sing/SingBoard";
	}
	@GetMapping("detail")
	public String SingDetail(int bno, Model model) {
		model.addAttribute("Sdetail",Siservice.SingDetail(bno));
		return "sing/SingDetail";
	}
	@GetMapping("modify")
	public String SingModifyGet(int bno, Model model) {
		model.addAttribute("Smodify",Siservice.SingDetail(bno));
		return "sing/SingModify";
	}
	@PostMapping("modifyOn")
	public String SingModify(SingDTO ssdto) {
		Siservice.SingModify(ssdto);
		return "redirect:/sing/detail?bno="+ssdto.getBno();
	}
	@GetMapping("delete")
	public String SingDelete(int bno) {
		Siservice.SingDelete(bno);
		return "redirect:/sing/board";
	}
	@GetMapping("write")
	public String SingWrite() {
		return "sing/SingWrite";
	}
	@PostMapping("writeOn")
	public String SingWriteGet(SingDTO ssdto) {
		if(ssdto.getAttach()!=null) {
			ssdto.getAttach().forEach(attach->System.out.println(attach));
		}
		Siservice.SingWrite(ssdto);
		return "redirect:/sing/board";
	}
	@GetMapping("signModify")
	public String SingSignModify(String id, Model model) {
		model.addAttribute("Smodify",Siservice.SingSignModify(id));
		return "sing/SingSignModify";
	}
	@PostMapping("signModifyOn")
	public String SignModifyOn(SingDTO ssdto) {
		Siservice.SingSignModifyOn(ssdto);
		return "redirect:/sing/main";
	}
	@GetMapping("SignDelete")
	public String SignDelete(String id) {
		Siservice.SignDelete(id);
		return "redirect:/sing/login";
	}
}

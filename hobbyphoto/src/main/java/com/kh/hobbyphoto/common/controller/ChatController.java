package com.kh.hobbyphoto.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class ChatController {

	@RequestMapping("/chat")
	public String chat(Model model,HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginMember");
		
		model.addAttribute("userid",m);
		
		return "chat/chatDetailView";
	}
	
}

package com.kh.hobbyphoto.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hobbyphoto.common.model.service.ChatServiceImpl;
import com.kh.hobbyphoto.common.model.vo.Chat;
import com.kh.hobbyphoto.member.model.vo.Member;

@Controller
public class ChatController {
	@Autowired
	private ChatServiceImpl cService;

	@RequestMapping("chat")
	public String chat(Model model,HttpSession session, Chat c, ModelAndView mv) {
		
		Member m = (Member)session.getAttribute("loginMember");
		System.out.println("m : "+m);
		model.addAttribute("userid",m);
		return "chat/chatDetailView";
		
//		Member m = (Member)session.getAttribute("loginMember");
//		
//		int chatMake = cService.insertChat(c);
//		
//		if(chatMake>0) {
//			mv.setViewName("chat/chatDetailView");
//		}
//		
//		return "mv";
	}
	
}

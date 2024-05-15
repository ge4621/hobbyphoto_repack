package com.kh.hobbyphoto.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChatController {

	@RequestMapping("/echo")
	public String chat() {
		return "chat/chatDetailView";
	}
	
}

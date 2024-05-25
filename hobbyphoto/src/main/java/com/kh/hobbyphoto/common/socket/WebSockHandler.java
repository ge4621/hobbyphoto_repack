package com.kh.hobbyphoto.common.socket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.hobbyphoto.member.model.vo.Member;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class WebSockHandler extends TextWebSocketHandler {

    private static List<WebSocketSession> list = new ArrayList<>();
    private Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        System.out.println("payload : " + payload);

        for(WebSocketSession sess: list) {
            sess.sendMessage(message);
        }
    }

    /* Client가 접속 시 호출되는 메서드 */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        list.add(session);
        String sendId = currentUserName(session);
        userSessionsMap.put(sendId, session);
        System.out.println(session+"###사용자 접속");

    }

    /* Client가 접속 해제 시 호출되는 메서드드 */

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println(session+"###사용자 접속 해제");
    	
        list.remove(session);
        userSessionsMap.remove(currentUserName(session), session);
    }
    
    private String currentUserName(WebSocketSession session) {
    	Map<String,Object> httpSession = session.getAttributes();
    	Member loginUser = (Member)httpSession.get("loginMember");
    	if(loginUser == null) {
			String mid = session.getId();
			return mid;
		}
		String mid = loginUser.getUserId();
		return mid;
    	
    }
}

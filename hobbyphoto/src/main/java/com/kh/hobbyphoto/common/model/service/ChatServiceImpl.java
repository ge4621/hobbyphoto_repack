package com.kh.hobbyphoto.common.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.common.model.dao.ChatDao;
import com.kh.hobbyphoto.common.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ChatDao cDao;

	@Override
	public int insertChat(Chat c) {
		return cDao.insertChat(sqlSession,c);
	}
	
	
	
}

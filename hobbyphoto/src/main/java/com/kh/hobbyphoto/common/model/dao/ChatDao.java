package com.kh.hobbyphoto.common.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.hobbyphoto.common.model.vo.Chat;

@Repository
public class ChatDao {
	public int insertChat(SqlSessionTemplate sqlSession,Chat c) {
		return sqlSession.insert("chatMapper.insertChat",c);
	}
}

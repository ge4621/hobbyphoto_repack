package com.kh.hobbyphoto.group.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hobbyphoto.board.model.vo.Board;
import com.kh.hobbyphoto.common.model.vo.PageInfo;
import com.kh.hobbyphoto.group.model.dao.GroupDao;

@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupDao GDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int selectTgListCount() {
		return GDao.selectTgListCount(sqlSession);
	}

	public ArrayList<Board> selectTgList(PageInfo pi) {
		return GDao.selectTgList(sqlSession, pi);
	}
	

	
}

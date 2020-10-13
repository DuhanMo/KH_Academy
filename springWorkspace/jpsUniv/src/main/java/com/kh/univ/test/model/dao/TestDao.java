package com.kh.univ.test.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.univ.test.model.vo.Test;
@Repository("tDao")
public class TestDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Test> selectList() {
		return (ArrayList)sqlSession.selectList("testMapper.selectList");
	}

}

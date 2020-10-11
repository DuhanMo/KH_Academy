package com.kh.univ.test.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.univ.test.model.dao.TestDao;
import com.kh.univ.test.model.vo.Test;
@Service("tService")
public class TestServiceImpl implements TestService{
	@Autowired
	private TestDao tDao;
	@Override
	public ArrayList<Test> selectList() {
		return tDao.selectList();
	}

}

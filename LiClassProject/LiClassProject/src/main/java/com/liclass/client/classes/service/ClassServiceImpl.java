package com.liclass.client.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.classes.dao.ClassDAO;
import com.liclass.client.classes.vo.ClassVO;

import lombok.Setter;

@Service
public class ClassServiceImpl implements ClassService{
	
	@Setter(onMethod_ = @Autowired)
	private ClassDAO classDao;
	
	@Override
	public List<ClassVO> classList() {
		List<ClassVO> list = classDao.classList();
		return list;
	}

	@Override
	public ClassVO classDetail(ClassVO vo) {
		ClassVO cvo = classDao.classDetail(vo);
		return cvo;
	}
	
	

}

package com.liclass.client.classes.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.liclass.client.classes.vo.ClassVO;
@Service
public interface ClassService {
	
	//클래스 리스트
	public List<ClassVO> classList();
	
	//클래스 상세
	public ClassVO classDetail(ClassVO vo);
}

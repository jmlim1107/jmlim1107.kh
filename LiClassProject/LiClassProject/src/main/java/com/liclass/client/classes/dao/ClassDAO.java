package com.liclass.client.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.vo.ClassVO;

@Mapper
public interface ClassDAO {
	
	//클래스 리스트
	public List<ClassVO> classList();
	
	//클래스 상세
	public ClassVO classDetail(ClassVO vo);
	
	//클래스의 센터 조회
	public CenterVO centerDetail(ClassVO vo);
}

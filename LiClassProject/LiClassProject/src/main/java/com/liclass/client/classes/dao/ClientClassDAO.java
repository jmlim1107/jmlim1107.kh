package com.liclass.client.classes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.vo.ClientClassVO;

@Mapper
public interface ClientClassDAO {
	
	//클래스 리스트
	public List<ClientClassVO> clientClassList();
	
	//클래스 상세
	public ClientClassVO clientClassDetail(ClientClassVO vo);
	
	//클래스의 센터 조회
	public CenterVO clientCenterDetail(ClientClassVO vo);
}

package com.liclass.client.classes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.admin.management.center.vo.CenterVO;
import com.liclass.client.classes.dao.ClientClassDAO;
import com.liclass.client.classes.vo.ClientClassVO;

import lombok.Setter;

@Service
public class ClassServiceImpl implements ClientClassService{
	
	@Setter(onMethod_ = @Autowired)
	private ClientClassDAO classDao;
	
	@Override
	public List<ClientClassVO> clientClassList() {
		List<ClientClassVO> list = classDao.clientClassList();
		return list;
	}
	@Override
	public ClientClassVO clientClassDetail(ClientClassVO vo) {
		ClientClassVO  clientClassDetail = classDao.clientClassDetail(vo);
		return clientClassDetail;
	}
	@Override
	public List<ClientClassVO> clientClassDetailList(ClientClassVO vo) {
		List<ClientClassVO> clientClassList = classDao.clientClassDetailList(vo);
		return clientClassList;
	}
	@Override
	//클래스의 센터 조회
		public CenterVO clientCenterDetail(String ct_bizno) {
		CenterVO cvo = classDao.clientCenterDetail(ct_bizno);
		return cvo;
	}

	
	

}

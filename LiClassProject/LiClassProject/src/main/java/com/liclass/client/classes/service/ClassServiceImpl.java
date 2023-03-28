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
		ClientClassVO cvo = classDao.clientClassDetail(vo);
		return cvo;
	}
	@Override
	public CenterVO clientCenterDetail(ClientClassVO vo) {
		CenterVO cvo = classDao.clientCenterDetail(vo);
		return cvo;
	}
	

}

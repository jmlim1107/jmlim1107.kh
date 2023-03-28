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
	public List<ClientClassVO> classList() {
		List<ClientClassVO> list = classDao.classList();
		return list;
	}

	@Override
	public ClientClassVO classDetail(ClientClassVO vo) {
		ClientClassVO cvo = classDao.classDetail(vo);
		return cvo;
	}
	@Override
	public CenterVO centerDetail(ClientClassVO vo) {
		CenterVO cvo = classDao.centerDetail(vo);
		return cvo;
	}
	

}

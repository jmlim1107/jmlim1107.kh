package com.liclass.client.reserve.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.reserve.dao.ReserveDAO;
import com.liclass.client.reserve.vo.ReserveVO;

import lombok.Setter;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Setter(onMethod_=@Autowired )
	private ReserveDAO reserveDao;
	
	@Override
	public int reservInsert(ReserveVO rvo) {
		int result = 0;
		result = reserveDao.reservInsert(rvo);
		return result;
	}

	@Override
	public ReserveVO reservSelect(int r_no) {
		ReserveVO reserve = reserveDao.reservSelect(r_no);
		return reserve;
	}
	
	
}

package com.liclass.client.reserve.service;

import com.liclass.client.reserve.vo.ReserveVO;

public interface ReserveService {
	public int reservInsert(ReserveVO rvo);
	public ReserveVO reservSelect(int r_no);
}	

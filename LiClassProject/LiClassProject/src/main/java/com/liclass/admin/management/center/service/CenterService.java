package com.liclass.admin.management.center.service;

import java.util.List;

import com.liclass.admin.management.center.vo.CenterVO;

public interface CenterService {
	
	
	public List<CenterVO> centerList(CenterVO cvo);/* 검색 포함 리스트 */
	public int centerListCnt(CenterVO cvo);
	public int centerInsert(CenterVO cvo) throws Exception;
	public CenterVO centerDetail(CenterVO cvo);
	
	public CenterVO updateForm(CenterVO cvo);
	public int centerUpdate(CenterVO cvo) throws Exception ;
	public int centerDelete(CenterVO cvo) throws Exception ;
}

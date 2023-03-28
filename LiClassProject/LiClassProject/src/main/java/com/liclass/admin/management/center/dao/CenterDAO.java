package com.liclass.admin.management.center.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.admin.management.center.vo.CenterVO;

@Mapper
public interface CenterDAO {

	public List<CenterVO> centerList(CenterVO cvo);
	public int centerListCnt(CenterVO cvo);
	public int centerInsert(CenterVO cvo);

	public CenterVO centerDetail2(CenterVO cvo); /* 0328은아 admin-center.xml과 겹쳐서 수정합니다. */
	
	public int centerUpdate(CenterVO cvo);
	public int centerDelete(String ct_bizno); //수정,삭제는 1건식 처리되므로 int형이다 받아올때는 (괄호안에 타입 데이터명)
	public List<CenterVO> centerNameList();
	public List<CenterVO> centerlist2();
}

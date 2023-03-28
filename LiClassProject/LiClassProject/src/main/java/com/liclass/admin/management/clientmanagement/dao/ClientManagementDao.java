package com.liclass.admin.management.clientmanagement.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.liclass.client.login.vo.UserVO;

@Mapper
public interface ClientManagementDao {

	public List<UserVO> clientList(UserVO uservo);

	public int clientListCnt(UserVO uservo);

}

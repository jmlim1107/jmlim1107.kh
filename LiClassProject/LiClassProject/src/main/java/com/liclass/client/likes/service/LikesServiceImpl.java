package com.liclass.client.likes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liclass.client.likes.dao.LikesDAO;
import com.liclass.client.likes.vo.LikesVO;

import lombok.Setter;

@Service
public class LikesServiceImpl implements LikesService{
	@Setter(onMethod_ = @Autowired)
	private LikesDAO likesDao;
	
	@Override
	public int checkLikes(LikesVO vo) {
		int result = likesDao.checkLikes(vo);
		return result;
	}
	
	@Override
	public int addLikes(LikesVO vo) {
		int result = likesDao.addLikes(vo);
		return result;
	}

	@Override
	public int delLikes(LikesVO vo) {
		int result = likesDao.delLikes(vo);
		return result;
	}

	

}

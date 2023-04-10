package com.liclass.admin.classes.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.liclass.admin.classes.dao.AdminClassDAO;
import com.liclass.admin.classes.vo.AdminClassVO;
import com.liclass.admin.img.dao.AdminClassImgDAO;
import com.liclass.admin.img.vo.AdminClassImgVO;
import com.liclass.common.file.ClassFileUpload;

import lombok.Setter;

@Service
public class AdminClassServiceImpl implements AdminClassService {
	
	@Setter(onMethod_= @Autowired )
	private AdminClassDAO classDao;
	
	@Setter(onMethod_= @Autowired)
	private AdminClassImgDAO imgDao;
	
	@Override
	public List<AdminClassVO> classList(AdminClassVO liclass) {
		List<AdminClassVO> classlist = null;
		classlist = classDao.classList(liclass);
		return classlist;
	}

	@Override
	public int classListCnt(AdminClassVO liclass) {
		int cnt = 0;
		cnt = classDao.classListCnt(liclass);
		return cnt;
	}

	@Override
	public AdminClassVO classDetail(int c_no) {
		AdminClassVO liclass = null;
		liclass = classDao.classDetail(c_no);
		if(liclass !=null ) {
			liclass.setC_content(liclass.getC_content().toString().replaceAll("\n","<br/>")); 
		}
		return liclass;
	}

	@Override
	public int classInsert(AdminClassVO liclass) throws Exception {
		int result1 = 0;
		int result2 = 0;
		/*1) 클래스  insert*/
		result1 = classDao.classInsert(liclass);
		
		/*2) 클래스 이미지 insert*/
		if(result1==1 ) { 																				//클래스데이터의  insert 성공
			AdminClassImgVO img = new AdminClassImgVO(); 		//하나의 클래스 이미지 객체
			img.setC_no(liclass.getC_no());											// 1) 공통된 클래스 번호 부여
			for( MultipartFile file : liclass.getFileList() ) {	
				if(file.getSize() > 0) { 																					
					String fileName = ClassFileUpload.fileUpdload(file, "class");
					img.setC_img_file(fileName); 										// 2) 개별 이미지 이름부여
					String thumName = ClassFileUpload.makeThumbnail(fileName);
					img.setThumb_file(thumName);									// 3) 개별 썸네일 이름 부여
					result2 = imgDao.imgInsert(img);									// 4) 개별 DB 등록작업
				}
			}
		}
		return result2;
	}

	@Override
	public AdminClassVO updateForm(int c_no) {
		return  classDao.classDetail(c_no);
	}
	
	@Override
	public int classUpdate(AdminClassVO liclass) {
		int result = 0;
		result = classDao.classUpdate(liclass);
		return result;
	}

	@Override
	public int classDelete(AdminClassVO liclass) throws Exception {
		int result1 = 0;
		int result2 =0;
		/* 해당 이미지부터 삭제 */
		List<AdminClassImgVO> list = imgDao.imgList(liclass.getC_no());
		if(list.size()>0) {	
			for( AdminClassImgVO img : list ) {
				ClassFileUpload.fileDelete(img.getC_img_file());				//1) 물리적 이미지 파일 삭제
			}
		}
		result1 = imgDao.imgDel(liclass.getC_no());  								//2) 이미지 DB정보 삭제
		/*클래스 DB 삭제*/
		if(result1==1) {	//이미지 삭제 성공시 진행
			result2 = classDao.classDelete(liclass.getC_no());
		}
		return result2;
	}
	
	@Override
	public Map<String, String> classDetail2(int c_no) {
		Map<String, String> liclass = null;
		liclass = classDao.classDetail2(c_no);
		
		if(liclass !=null ) {
			String content = (String)liclass.get("C_CONTENT");
			String content2 = content.replaceAll("\n","<br/>");
			liclass.put("C_CONTENT", content2);
		}
	
		return liclass;
	}

	//********************** 이미지 관련 service들..************************//
	@Override
	public List<AdminClassImgVO> imgList(int c_no) { //model로 결과를 묶어보내야해서 단독으로 만들었다..
		List<AdminClassImgVO> list = null;
		list = imgDao.imgList(c_no);
		return list;
	}

	@Override
	public int imgDel2(AdminClassImgVO vo) throws Exception{ 
		int result = 0;
		// 1) 물리적 파일부터 삭제 (썸네일도 같이 삭제)
		ClassFileUpload.fileDelete(vo.getC_img_file());
		ClassFileUpload.fileDelete(vo.getThumb_file());
		// 2) DB데이터 삭제
		result = imgDao.imgDel2(vo);
		return result;
	}

	@Override
	public int imgUpd(AdminClassImgVO vo) throws Exception {
		int result = 0;
		//기존원본파일, 기존썸네일 삭제
		ClassFileUpload.fileDelete(vo.getC_img_file());
		ClassFileUpload.fileDelete(vo.getThumb_file());
		
		//새로운 MultipartFile을 등록하고 DB에 수정
		String newFile = ClassFileUpload.fileUpdload(vo.getFile(), "class");
		String newThumb = ClassFileUpload.makeThumbnail(newFile);
		vo.setC_img_file(newFile);
		vo.setThumb_file(newThumb);
		
		result = imgDao.imgUpd(vo);
		return result;
	}

	@Override
	public int imgInsert(AdminClassImgVO vo) throws Exception { //c_no, file만 가지고 있는 vo 이다.
		int result = 0;
		String c_img_file = ClassFileUpload.fileUpdload(vo.getFile(), "class");
		String thumb_file = ClassFileUpload.makeThumbnail(c_img_file);
		vo.setC_img_file(c_img_file);
		vo.setThumb_file(thumb_file);
		
		result = imgDao.imgInsert(vo);
		return result;
	}

	@Override
	public int imgCnt(int c_no) {
		int cnt = imgDao.imgCnt(c_no);
		return cnt;
	}
	
}

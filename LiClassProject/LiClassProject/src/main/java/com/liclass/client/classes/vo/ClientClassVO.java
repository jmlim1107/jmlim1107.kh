package com.liclass.client.classes.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ClientClassVO {
	private int c_no;
	private String ct_bizno; //추후 강사테이블 상속으로 대체?
	private String c_title;
	private String c_img_file;
	private String c_content;
	private String c_category;
	private String c_level;
	private String c_area;
	private int c_luv;
	private int c_leadtime;
	private int c_maxcnt;
	private int c_mincnt;
	private String c_date;
	private int c_state;
	
	private String thumb_file       ="";      // 썸네일 
	
}

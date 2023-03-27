package com.liclass.client.review.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewVO {
	private int review_no;
	private String review_name;
	private String review_title;
	private String review_content;
	private String review_date;
	private String review_update;
	private int review_status;
	private String review_img;
	private String review_thumb_file;
	private int c_no;
	private long user_no;
	
}

package com.liclass.client.likes.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikesVO{ //은아
	
		//4개의 필드(컬럼)
		private int like_no=0;
		private String like_regdate="";
		private long user_no=0;
		private int c_no=0;
		
}

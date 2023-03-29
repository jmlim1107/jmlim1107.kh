package com.liclass.client.qnaboard.vo;


import com.liclass.common.vo.CommonVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
public class ClientQnaBoardVO extends CommonVO{
	
		//은아-마이페이지 문의내역구현)총 12개 필드(컬럼), 민섭님 sql문에 user_no 추가했는데 가능할까요?
		private int qna_no=0;
		private int admin_no=0;
		private long user_no=0;
		private String qna_title="";
		private String qna_content="";
		private int qna_status=0; //은아) 답변전/후 판별을 위한 임의의 필드 (테이블엔 없음)
		private String qna_date="";
		private String qna_date_fix="";
		private String qna_category="";
		private int qna_top_state=0;
		private int group=0;
		private int indent=0;
		private int step=0;
}

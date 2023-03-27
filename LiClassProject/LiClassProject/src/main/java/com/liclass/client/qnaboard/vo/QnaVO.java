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
public class QnaVO extends CommonVO{
	private int qna_no=0;
	private long user_no=0;
	private int qna_status=0;
	private String qna_title="";
	private String qna_content="";
	private String qna_date="";
	private String qna_date_fix="";
}

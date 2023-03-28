package com.liclass.client.classes.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
public class ClientClassImgVO extends ClientClassVO {
	private int cImgNo;
	private String cImgFile;
	private String thumbFile;
	private String cImgDate;
}

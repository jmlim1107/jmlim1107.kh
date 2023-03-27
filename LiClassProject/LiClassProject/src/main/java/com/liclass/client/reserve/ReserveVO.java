package com.liclass.client.reserve;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReserveVO {
	   private long user_no =0;
	   private int r_no=0;
	   private int r_price=0;
	   private int ep_no =0;
	   private String r_date;
	   private int r_state;
	   private int r_cnt;
}

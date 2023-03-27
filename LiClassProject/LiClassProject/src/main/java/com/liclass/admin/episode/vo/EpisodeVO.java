package com.liclass.admin.episode.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class EpisodeVO {
	private int ep_no;
	private int c_no;
	private int ep_price;
	private String ep_date;
	private int ep_state;
	private int ep_cnt;
}

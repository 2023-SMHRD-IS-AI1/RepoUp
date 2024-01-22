package com.trendypeop.myapp.entity;

import java.time.LocalDate;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@RequiredArgsConstructor
@ToString
@AllArgsConstructor

public class Keyword {
	
	@NonNull private String collected_at;
	private String top1;
	private String top2;
	private String top3;
	private String top4;
	private String top5;
	private String top6;
	private String top7;
	private String top8;
	private String top9;
	private String top10;
	
	private Double top1_rate;
	private Double top2_rate;
	private Double top3_rate;
	private Double top4_rate;
	private Double top5_rate;
	private Double top6_rate;
	private Double top7_rate;
	private Double top8_rate;
	private Double top9_rate;
	private Double top10_rate;
	
	private String news_title;
	private String news_url;
	
	
//	public Keyword(String now_string) {
//		super();
//		this.collected_at = now_string;
//	}
	
	
//		public Keyword(int style_idx, String user_id) {
//		super();
//		this.style_idx = style_idx;
//		this.user_id = user_id;
//	}
}

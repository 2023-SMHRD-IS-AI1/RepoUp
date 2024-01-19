package com.trendypeop.myapp.entity;

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
public class Cody {
	@NonNull private int cody_idx;
	@NonNull private String cody_name;
	@NonNull private String cody_img_url;
	private String cody_season;
	private String cody_look;
	private String cody_style_tag;
	private String user_id;
	private String item_name;
	private String item_img_url;
	private String item_url;
	
	public Cody(int cody_idx, String user_id) {
		super();
		this.cody_idx = cody_idx;
		this.user_id = user_id;
	}
	
	public Cody(String cody_season, String cody_look, String cody_style_tag) {
		super();
		this.cody_season = cody_season;
		this.cody_look = cody_look;
		this.cody_style_tag = cody_style_tag;
	}
}

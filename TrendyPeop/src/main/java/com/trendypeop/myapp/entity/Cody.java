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
	
	public Cody(int cody_idx, String user_id) {
		super();
		this.cody_idx = cody_idx;
		this.user_id = user_id;
	}
}

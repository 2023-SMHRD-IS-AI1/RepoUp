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
	@NonNull private String cody_idx;
	@NonNull private String cody_name;
	@NonNull private String cody_img_url;
	private String cody_season;
	private String cody_look;
	private String cody_style_tag;
}

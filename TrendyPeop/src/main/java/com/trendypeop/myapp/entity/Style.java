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
public class Style {
	@NonNull private String style_idx;
	private String style_cate;
	private String style_item;
	@NonNull private String style_img_url;
	@NonNull private String style_color;
	@NonNull private String style_tag;
	@NonNull private String style_google;
}

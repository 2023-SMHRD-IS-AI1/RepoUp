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
public class User {
	
	@NonNull private String user_id;
	@NonNull private String user_pw;
	@NonNull private String user_name;
	@NonNull private String user_nick;
	private Date joined_at;
	@NonNull private String user_type;
}

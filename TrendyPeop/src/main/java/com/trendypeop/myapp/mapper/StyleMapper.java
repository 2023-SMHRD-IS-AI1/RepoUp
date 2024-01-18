package com.trendypeop.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.trendypeop.myapp.entity.Style;
import com.trendypeop.myapp.entity.User;

@Mapper
public interface StyleMapper {

	@Insert("insert into tb_user(user_id,user_pw,user_name,user_nick) values(#{user_id},#{user_pw},#{user_name},#{user_nick})")
	int signUpSuccess(User user);

	boolean selectId(String user_id); //중복 Id 검색
	
	public User userSelect(User user) ;

	public List<Style> styleList();
	
	public int checkStyleHeart(Style style);
	
	public int insertStyleHeart(Style style);

	public int deleteStyleHeart(Style style);
	
	public int checkCloset(Style style);
	
	public int insertCloset(Style style);

	public int deleteCloset(Style style);
}

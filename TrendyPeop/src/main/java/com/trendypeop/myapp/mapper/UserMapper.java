package com.trendypeop.myapp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.trendypeop.myapp.entity.User;

@Mapper
public interface UserMapper {

	@Insert("insert into tb_user(user_id,user_pw,user_name,user_nick) values(#{user_id},#{user_pw},#{user_name},#{user_nick})")
	int signUpSuccess(User user);

	boolean selectId(String user_id); //중복 Id 검색
	
	public User userSelect(User user) ;
}

package com.trendypeop.myapp.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import com.trendypeop.myapp.entity.User;

@Mapper
public interface UserMapper {

	@Insert("insert into tb_user(user_id,user_pw,user_name,user_nick) values(#{user_id},#{user_pw},#{user_name},#{user_nick})")
	int signUpSuccess(User user);

	boolean selectId(String user_id); //중복 Id 검색
	
	public User userSelect(User user) ;
	
	@Update("update tb_user set user_pw = #{user_pw}, user_nick = #{user_nick} where user_id = #{user_id}")
	int updateUser(User user);
}

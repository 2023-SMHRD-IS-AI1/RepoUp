package com.trendypeop.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.trendypeop.myapp.entity.Cody;
import com.trendypeop.myapp.entity.Style;
import com.trendypeop.myapp.entity.User;

@Mapper
public interface CodyMapper {

	@Insert("insert into tb_user(user_id,user_pw,user_name,user_nick) values(#{user_id},#{user_pw},#{user_name},#{user_nick})")
	int signUpSuccess(User user);

	boolean selectId(String user_id); //중복 Id 검색
	
	public User userSelect(User user) ;

	public List<Cody> codyList();
	
	public int checkCodyHeart(Cody cody);

	public int insertCodyHeart(Cody cody);

	public int deleteCodyHeart(Cody cody);
	
	public List<Cody> codyDetail(int cody_idx);
	
	public List<Cody> likeCodyList(String user_id);
	
}

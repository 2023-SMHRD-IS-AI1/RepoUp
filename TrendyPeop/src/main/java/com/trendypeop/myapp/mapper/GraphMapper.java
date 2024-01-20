package com.trendypeop.myapp.mapper;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.trendypeop.myapp.entity.Cody;
import com.trendypeop.myapp.entity.Keyword;
import com.trendypeop.myapp.entity.Style;
import com.trendypeop.myapp.entity.User;

@Mapper
public interface GraphMapper {

	public Keyword keywordListing(String collected_at);

}
   
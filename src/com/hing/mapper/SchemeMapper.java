package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Scheme;

public interface SchemeMapper {
	public int add(Scheme scheme);
	
	public void delete(String id);
	
	public int update(Scheme scheme);
	
	public Scheme get(String id);//按照班级号查找方案，具体处理见SchemeServiceImpl
	
	public List<Scheme> list();
}

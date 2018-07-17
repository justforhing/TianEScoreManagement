package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Teach;

public interface TeachMapper {
	public int add(Teach teach);
	
	public void delete(String id);
	
	public int update(Teach teach);
	
	public List<Teach> getTeachByCourse(String id);
	
	public List<Teach> getTeachByTeacher(String id);
	
	public List<Teach> list();

}

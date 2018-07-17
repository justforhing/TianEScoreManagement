package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Class;

public interface ClassMapper {
	public int add(Class c);
	
	public void delete(String id);
	
	public int update(Class c);
	
	public Class get(String id);
	
	public List<Class> list();
	
	public List<Class> getClassByTeacher(String id);

}

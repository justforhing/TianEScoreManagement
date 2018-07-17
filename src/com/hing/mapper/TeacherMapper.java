package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Teacher;

public interface TeacherMapper {
	public int add(Teacher teacher);
	
	public void delete(String id);
	
	public int update(Teacher teacher);
	
	public Teacher get(String id);
	
	public List<Teacher> list();
}
 
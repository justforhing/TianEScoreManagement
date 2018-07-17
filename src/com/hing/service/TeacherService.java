package com.hing.service;

import java.util.List;

import com.hing.pojo.Teacher;



public interface TeacherService {
	public void add(Teacher teacher);
	
	public void delete(String id);
	
	public void update(Teacher teacher);
	
	public Teacher get(String id);
	
	public List<Teacher> list();
}

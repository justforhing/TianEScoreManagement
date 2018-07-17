package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Course;

public interface CourseMapper {
	public int add(Course course);
	
	public void delete(String id);
	
	public int update(Course course);
	
	public Course get(String id);
	
	public List<Course> getCourseByScheme(String id);
	
	public List<Course> list();
}

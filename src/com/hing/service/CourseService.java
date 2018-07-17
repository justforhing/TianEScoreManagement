package com.hing.service;

import java.util.List;

import com.hing.pojo.Course;

public interface CourseService {
	public void add(Course course);
	
	public void delete(String id);
	
	public void update(Course course);
	
	public Course get(String id);
	
	public List<Course> getCourseByScheme(String id);
	
	public List<Course> list();
}

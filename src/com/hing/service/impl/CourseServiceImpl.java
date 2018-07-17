package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.CourseMapper;
import com.hing.pojo.Course;
import com.hing.service.CourseService;
@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	CourseMapper courseMapper;
	@Override
	public void add(Course course) {
		courseMapper.add(course);
	}

	@Override
	public void delete(String id) {
		courseMapper.delete(id);
	}

	@Override
	public void update(Course course) {
		courseMapper.update(course);
	}

	@Override
	public Course get(String id) {
		return courseMapper.get(id);
	}

	@Override
	public List<Course> list() {
		return courseMapper.list();
	}

	@Override
	public List<Course> getCourseByScheme(String id) {
		return courseMapper.getCourseByScheme(id);
	}

}

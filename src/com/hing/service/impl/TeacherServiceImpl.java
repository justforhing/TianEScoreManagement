package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.TeacherMapper;
import com.hing.pojo.Teacher;
import com.hing.service.TeacherService;
@Service
public class TeacherServiceImpl implements TeacherService {
	@Autowired
	TeacherMapper teacherMapper;
	@Override
	public void add(Teacher teacher) {
		teacherMapper.add(teacher);
	}

	@Override
	public void delete(String id) {
		teacherMapper.delete(id);
	}

	@Override
	public void update(Teacher teacher) {
		teacherMapper.update(teacher);
	}

	@Override
	public Teacher get(String id) {
		return teacherMapper.get(id);
	}

	@Override
	public List<Teacher> list() {
		return teacherMapper.list();
	}

}

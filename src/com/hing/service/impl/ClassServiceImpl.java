package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.ClassMapper;
import com.hing.pojo.Class;
import com.hing.service.ClassService;
@Service
public class ClassServiceImpl implements ClassService{
	@Autowired
	ClassMapper classMapper;
	@Override
	public void add(Class c) {
		classMapper.add(c);
	}

	@Override
	public void delete(String id) {
		classMapper.delete(id);
	}

	@Override
	public void update(Class c) {
		classMapper.update(c);
	}
	
	public Class get(String id) {
		return classMapper.get(id);
	}
	
	@Override
	public List<Class> list() {
		return classMapper.list();
	}

	@Override
	public List<Class> getClassByTeacher(String id) {
		return classMapper.getClassByTeacher(id);
	}

}

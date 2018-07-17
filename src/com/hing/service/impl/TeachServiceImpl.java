package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.TeachMapper;
import com.hing.pojo.Teach;

import com.hing.service.TeachService;
@Service
public class TeachServiceImpl implements TeachService {
	@Autowired TeachMapper teachMapper;

	@Override
	public void add(Teach teach) {
		teachMapper.add(teach);
	}

	@Override
	public void delete(String id) {
		teachMapper.delete(id);
	}

	@Override
	public void update(Teach teach) {
		teachMapper.update(teach);
	}

	@Override
	public List<Teach> getTeachByCourse(String id) {
		return teachMapper.getTeachByCourse(id);
	}
	@Override
	public List<Teach> getTeachByTeacher(String id) {
		return teachMapper.getTeachByTeacher(id);
	}
	
	@Override
	public List<Teach> list() {
		return teachMapper.list();
	}

}

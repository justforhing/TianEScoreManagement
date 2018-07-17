package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.StudentMapper;
import com.hing.pojo.Student;
import com.hing.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	StudentMapper studentMapper;
	  
	

	@Override
	public void add(Student student) {
		studentMapper.add(student);
	}

	@Override
	public void delete(String id) {
		studentMapper.delete(id);
	}

	@Override
	public void update(Student student) {
		studentMapper.update(student);
	}

	@Override
	public Student get(String id) {
		return studentMapper.get(id);
	}
	
	public List<Student> list() {
		return studentMapper.list();
	}

	@Override
	public List<Student> getStudentByClass(String id) {
		return studentMapper.getStudentByClass(id);
	}

	@Override
	public List<Student> getStudentByCourse(String id) {
		
		return studentMapper.getStudentByCourse(id);
	}

}

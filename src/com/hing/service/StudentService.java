package com.hing.service;

import java.util.List;

import com.hing.pojo.Student;

public interface StudentService {
	public void add(Student student);
	
	public void delete(String id);
	
	public void update(Student student);
	
	public Student get(String id);
	
	public List<Student> getStudentByClass(String id);
	
	public List<Student> getStudentByCourse(String id);
	
	public List<Student> list();
}

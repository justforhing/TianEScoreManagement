package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Student;
public interface StudentMapper {
	public int add(Student student);
	
	public void delete(String id);
	
	public int update(Student student);
	
	public Student get(String id);
	
	public List<Student> getStudentByClass(String id);
	
	public List<Student> getStudentByCourse(String id);
	
	public List<Student> list();
}

package com.hing.service;
import java.util.List;

import com.hing.pojo.Teach;
public interface TeachService {
	public void add(Teach teach);
	
	public void delete(String id);
	
	public void update(Teach teach);
	
	public List<Teach> getTeachByCourse(String id);
	
	public List<Teach> getTeachByTeacher(String id);
	
	public List<Teach> list();
}

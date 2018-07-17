package com.hing.service;
import java.util.List;

import com.hing.pojo.Class;
public interface ClassService {
	public void add(Class c);
	
	public void delete(String id);
	
	public void update(Class c);
	
	public Class get(String id);
	
	public List<Class> list();
	
	public List<Class> getClassByTeacher(String id);
}

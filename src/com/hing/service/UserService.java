package com.hing.service;

import java.util.List;


import com.hing.pojo.User;

public interface UserService {
public void add(User user);
	
	public void delete(String id);
	
	public void update(User user);
	
	public User get(String id);
	
	public List<User> list();
	
	public List<User> getTeachers();
	
	public List<User> getStudents();
	
	public boolean isExist(String id);
}

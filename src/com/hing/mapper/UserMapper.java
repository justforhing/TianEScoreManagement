package com.hing.mapper;

import java.util.List;

import com.hing.pojo.User;

public interface UserMapper {
	public int add(User user);
	
	public void delete(String id);
	
	public int update(User user);
	
	public User get(String id);
	
	public List<User> list();
	
	public List<User> getUserByType(int type);
}

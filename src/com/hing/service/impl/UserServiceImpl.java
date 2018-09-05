package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hing.mapper.UserMapper;
import com.hing.pojo.User;
import com.hing.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> list() {
		return userMapper.list();
	}

	@Override
	public void add(User user) {
		userMapper.add(user);
	}

	@Override
	public void delete(String id) {
		userMapper.delete(id);
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	@Override
	public User get(String id) {
		return userMapper.get(id);
	}

	@Override
	public List<User> getTeachers() {
		int type = 2;
		return userMapper.getUserByType(type);
	}

	@Override
	public List<User> getStudents() {
		int type = 3;
		return userMapper.getUserByType(type);
	}

	@Override
	public boolean isExist(String id) {
		User user = userMapper.get(id);
		if(user == null) {
			return false;
		}
		return true;
	}

}

package com.hing.service;

import java.util.List;

import com.hing.pojo.Scheme;


public interface SchemeService {
	public void add(Scheme scheme);
	
	public void delete(String id);
	
	public void update(Scheme scheme);
	
	public Scheme get(String id);
	
	
	public List<Scheme> list();
}

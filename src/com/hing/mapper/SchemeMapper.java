package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Scheme;

public interface SchemeMapper {
	public int add(Scheme scheme);
	
	public void delete(String id);
	
	public int update(Scheme scheme);
	
	public Scheme get(String id);//���հ༶�Ų��ҷ��������崦���SchemeServiceImpl
	
	public List<Scheme> list();
}

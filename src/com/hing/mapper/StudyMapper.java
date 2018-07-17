package com.hing.mapper;

import java.util.List;

import com.hing.pojo.Study;

public interface StudyMapper {
	public int add(Study study);
	
	public void delete(String id);
	
	public int update(Study study);
	
	public List<Study> getStudyByStudent(String id);//根据学号获取
	
	public List<Study> getStudyByCourse(String id);
	
	public List<Study> list();

}

package com.hing.service;
import java.util.List;

import com.hing.pojo.Study;
public interface StudyService {
	public void add(Study study);
	
	public void delete(String id);
	
	public void update(Study study);
	
	public List<Study> getStudyByStudent(String id);//根据学号获取
	
	public List<Study> getStudyByCourse(String id);
	
	public List<Study> list();
}

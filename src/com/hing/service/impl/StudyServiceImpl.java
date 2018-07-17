package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.StudyMapper;
import com.hing.pojo.Study;
import com.hing.service.StudyService;
@Service
public class StudyServiceImpl implements StudyService {
	@Autowired StudyMapper studyMapper;

	@Override
	public void add(Study study) {
		studyMapper.add(study);
	}

	@Override
	public void delete(String id) {
		studyMapper.delete(id);
	}

	@Override
	public void update(Study study) {
		studyMapper.update(study);
	}

	@Override
	public List<Study> getStudyByStudent(String id) {
		return studyMapper.getStudyByStudent(id);
	}

	@Override
	public List<Study> list() {
		return studyMapper.list();
	}

	@Override
	public List<Study> getStudyByCourse(String id) {
		return studyMapper.getStudyByCourse(id);
	}


}

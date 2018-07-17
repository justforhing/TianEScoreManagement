package com.hing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hing.mapper.SchemeMapper;
import com.hing.pojo.Scheme;
import com.hing.service.SchemeService;
@Service
public class SchemeServiceImpl implements SchemeService {
	@Autowired
	SchemeMapper schemeMapper;
	@Override
	public void add(Scheme scheme) {
		schemeMapper.add(scheme);
	}

	@Override
	public void delete(String id) {
		schemeMapper.delete(id);
	}

	@Override
	public void update(Scheme scheme) {
		schemeMapper.update(scheme);
	}

	@Override
	public Scheme get(String id) {
		return schemeMapper.get(id);
	}

	@Override
	public List<Scheme> list() {
		return schemeMapper.list();
	}


}

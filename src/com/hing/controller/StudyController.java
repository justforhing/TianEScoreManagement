package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Study;
import com.hing.service.StudyService;
@Controller
@RequestMapping("")
public class StudyController {
	@Autowired
	StudyService studyService;
	@RequestMapping("/checkMyScore")
	public ModelAndView checkMyScore(String id) {
		ModelAndView mav = new ModelAndView();
		List<Study> ss = studyService.getStudyByStudent(id);
		
		mav.addObject("ss",ss);
		mav.setViewName("showMyScore");
		return mav;
	}
	
	@RequestMapping("/listStudy")
	public ModelAndView listStudy() {
		ModelAndView mav = new ModelAndView();
		List<Study> us = studyService.list();
		mav.addObject("us",us);
		
		mav.setViewName("listStudy");
		return mav;
		
	}

	@RequestMapping("/updateStudy")
	public ModelAndView updateStudy(Study study) {
		ModelAndView mav = new ModelAndView();
		
		studyService.update(study);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteStudy")
	public ModelAndView deleteStudy(String id) {
		ModelAndView mav = new ModelAndView();
		
		studyService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addStudy")
	public ModelAndView addStudy(Study study) {
		ModelAndView mav = new ModelAndView();
		studyService.add(study);
		
		mav.setViewName("admin_index");
		return mav;
	}
}

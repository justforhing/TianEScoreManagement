package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Teacher;
import com.hing.service.ClassService;
import com.hing.service.TeacherService;


@Controller
@RequestMapping
public class ClassController {
	@Autowired
	ClassService classService;
	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("/listClass")
	public ModelAndView listClass() {
		ModelAndView mav = new ModelAndView();
		List<com.hing.pojo.Class> cs = classService.list();
		List<Teacher> ts = teacherService.list();
		mav.addObject("cs",cs);
		mav.addObject("ts",ts);
		mav.setViewName("classList");
		return mav;
	}
	
	@RequestMapping("/updateClass")
	public ModelAndView updateClass(com.hing.pojo.Class myclass) {
		ModelAndView mav = new ModelAndView();
		classService.update(myclass);
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteClass")
	public ModelAndView deleteClass(String id) {
		ModelAndView mav = new ModelAndView();
		classService.delete(id);
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addClass")
	public ModelAndView addClass(com.hing.pojo.Class myclass) {
		ModelAndView mav = new ModelAndView();
		classService.add(myclass);
		mav.setViewName("admin_index");
		return mav;
	}
}

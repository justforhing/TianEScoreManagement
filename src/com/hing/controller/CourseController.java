package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Course;
import com.hing.pojo.Scheme;
import com.hing.service.CourseService;
import com.hing.service.SchemeService;

@Controller
@RequestMapping("")
public class CourseController {
	@Autowired
	CourseService courseService;
	@Autowired
	SchemeService schemeService;
	
	@RequestMapping("/listCourse")
	public ModelAndView listCourse() {
		ModelAndView mav = new ModelAndView();
		
		List<Course> ss = courseService.list();
		List<Scheme> scs = schemeService.list();
		mav.addObject("scs",scs);
		mav.addObject("ss",ss);
		mav.setViewName("courseList");
		
		return mav;
	}
	@RequestMapping("/showCourseByScheme")
	public ModelAndView showCourseByScheme(String id) {
		ModelAndView mav = new ModelAndView();
		
		List<Course> ss = courseService.getCourseByScheme(id);
		
		Scheme scheme = schemeService.get(id);
		System.out.println(ss+"scheme:"+scheme);
		mav.addObject("scheme",scheme);
		mav.addObject("ss",ss);
		mav.setViewName("courseListOfScheme");
		
		return mav;
	}
	@RequestMapping("/updateCourse")
	public ModelAndView updateCourse(Course course) {
		ModelAndView mav = new ModelAndView();
		courseService.update(course);
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteCourse")
	public ModelAndView deleteCourse(String id) {
		ModelAndView mav = new ModelAndView();
		
		courseService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addCourse")
	public ModelAndView addCourse(Course course) {
		ModelAndView mav = new ModelAndView();
		courseService.add(course);
		
		mav.setViewName("admin_index");
		return mav;
	}
}

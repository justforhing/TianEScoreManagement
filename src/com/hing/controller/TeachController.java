package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Teach;
import com.hing.service.TeachService;

@Controller
@RequestMapping("")
public class TeachController {
	@Autowired
	TeachService teachService;
	
	@RequestMapping("listTeach")
	public ModelAndView listTeach() {
		ModelAndView mav = new ModelAndView();
		List<Teach> ts = teachService.list();
		mav.addObject("ts",ts);
		
		mav.setViewName("listTeach");
		return mav;
	}
	
	@RequestMapping("/updateTeach")
	public ModelAndView updateTeach(Teach teach) {
		ModelAndView mav = new ModelAndView();
		
		teachService.update(teach);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteTeach")
	public ModelAndView deleteTeach(String id) {
		ModelAndView mav = new ModelAndView();
		
		teachService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addTeach")
	public ModelAndView addTeach(Teach teach) {
		ModelAndView mav = new ModelAndView();
		teachService.add(teach);
		
		mav.setViewName("admin_index");
		return mav;
	}
	
}

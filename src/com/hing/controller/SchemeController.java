package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Scheme;
import com.hing.service.SchemeService;


@Controller
@RequestMapping("")
public class SchemeController {
	@Autowired
	SchemeService schemeService;
	
	@RequestMapping("listScheme")
	public ModelAndView listScheme() {
		ModelAndView mav = new ModelAndView();
		List<Scheme> ss = schemeService.list();
		mav.addObject("ss",ss);
		
		mav.setViewName("schemeList");
		return mav;
	}
	
	@RequestMapping("/updateScheme")
	public ModelAndView updateScheme(Scheme scheme) {
		ModelAndView mav = new ModelAndView();
		
		schemeService.update(scheme);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteScheme")
	public ModelAndView deleteScheme(String id) {
		ModelAndView mav = new ModelAndView();
		
		schemeService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addScheme")
	public ModelAndView addTeach(Scheme scheme) {
		ModelAndView mav = new ModelAndView();
		schemeService.add(scheme);
		
		mav.setViewName("admin_index");
		return mav;
	}
}

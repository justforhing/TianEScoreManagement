package com.hing.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Student;
import com.hing.service.StudentService;
@Controller
@RequestMapping("")
public class StudentController {
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/listStudent")
	public ModelAndView listStudent() {
		ModelAndView mav = new ModelAndView();
		List<Student> ss = studentService.list();
		mav.addObject("ss",ss);
		
		mav.setViewName("studentList");
		
		return mav;
	}
	@RequestMapping("/showMyInformation")
	public ModelAndView editMyInformation(String id) {
		ModelAndView mav = new ModelAndView();
		Student currentUser = studentService.get(id);
		
		System.out.println(currentUser.getMyclass().getId());
		mav.addObject("currentUser",currentUser);
		
		mav.setViewName("editMyInformation");
		return mav;
	}
	@RequestMapping("/editMyInformation")
	public ModelAndView editMyInformation(Student student) {
		ModelAndView mav = new ModelAndView();
		studentService.update(student);
		System.out.println(student.getSex());
		mav.setViewName("student_index");
		return mav;
	}
	@RequestMapping("/updateStudent")
	public ModelAndView updateStudent(Student student) {
		ModelAndView mav = new ModelAndView();
		System.out.println(student.getSex());
		studentService.update(student);
		
		mav.setViewName("teacher_index");
		return mav;
	}
	
	@RequestMapping("/deleteStudent")
	public ModelAndView deleteStudent(String id) {
		ModelAndView mav = new ModelAndView();
		
		studentService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/addStudent")
	public ModelAndView addStudent(Student student) {
		ModelAndView mav = new ModelAndView();
		studentService.add(student);
		
		mav.setViewName("admin_index");
		return mav;
	}
}

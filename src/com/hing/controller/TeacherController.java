package com.hing.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Course;
import com.hing.pojo.Scheme;
import com.hing.pojo.Student;
import com.hing.pojo.Study;
import com.hing.pojo.Teacher;
import com.hing.service.ClassService;
import com.hing.service.CourseService;
import com.hing.service.SchemeService;
import com.hing.service.StudentService;
import com.hing.service.StudyService;
import com.hing.service.TeachService;
import com.hing.service.TeacherService;
@Controller
@RequestMapping("")
public class TeacherController {
	@Autowired
	TeacherService teacherService;
	
	@Autowired
	ClassService classService;
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	CourseService courseService;
	
	@Autowired
	StudyService studyService;
	
	@Autowired
	SchemeService schemeService;
	
	@Autowired
	TeachService teachService;
	
	@RequestMapping("/showClassStudents")
	public ModelAndView showMyStudents(String class_id) {
		ModelAndView mav = new ModelAndView();
		List<Student> ss = studentService.getStudentByClass(class_id);
		List<com.hing.pojo.Class> cs = classService.list();
		mav.addObject("ss",ss);
		mav.addObject("cs",cs);
		mav.setViewName("studentList");
		return mav;
	}
	
	@RequestMapping("/showCourseScore")
	public ModelAndView showCourseScore(String course_id , String time) {
		ModelAndView mav = new ModelAndView();
		List<Study> ss = studyService.getStudyByCourse(course_id);
		
		List<Study> data = new ArrayList<Study>();
		
		for(int i = 0 ; i < ss.size() ; i++) {
			if(ss.get(i).getTime().toString().equals(time)) {
				data.add(ss.get(i));
			}
		}
		mav.addObject("data",data);
		mav.setViewName("showCourseScore");
		return mav;
	}
	@RequestMapping("/editStudentScore")
	public ModelAndView showStudentScore(Study study) {
		
		
		ModelAndView mav = new ModelAndView();
		studyService.update(study);
		
		mav.setViewName("showCourseScore");
		
		return mav;
		
	}
	
	@RequestMapping("/showClassScore")
	public ModelAndView showClassScore(String class_id) {
		
		ModelAndView mav = new ModelAndView();
		com.hing.pojo.Class myclass = classService.get(class_id);
		String schemeId = myclass.getId().substring(4, 6);
		Scheme scheme = schemeService.get(schemeId);
		
		List<Course> cs = courseService.getCourseByScheme(scheme.getId());
		
		List<Object[]> result = new ArrayList<Object[]>();
		
		List<Student> ss = studentService.getStudentByClass(class_id);
		
		int studentCount = ss.size();
		 
		for(int i = 0 ; i < studentCount ; i ++) {
			List<Study> ss1 = studyService.getStudyByStudent(ss.get(i).getId());
			Object[] obj = {ss1.get(0).getStudent().getName(),ss1};
			result.add(obj);
		}//of for i  
		
		mav.addObject("result",result);
		mav.addObject("myclass",myclass);
		mav.addObject("cs",cs);
		mav.setViewName("showClassScore");
		
		return mav;
	}
	
	@RequestMapping("/listTeacher")
	public ModelAndView listTeacher() {
		ModelAndView mav = new ModelAndView();
		List<Teacher> ts = teacherService.list();
		
		mav.addObject("ts",ts);
		
		mav.setViewName("teacherList");
		return mav;
	}
	
	@RequestMapping("/updateTeacher")
	public ModelAndView updateTeacher(Teacher teacher) {
		ModelAndView mav = new ModelAndView();
		
		teacherService.update(teacher);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/deleteTeacher")
	public ModelAndView deleteTeacher(String id) {
		ModelAndView mav = new ModelAndView();
		
		teacherService.delete(id);
		
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("addTeacher")
	public ModelAndView addTeacher(Teacher teacher) {
		ModelAndView mav = new ModelAndView();
		teacherService.add(teacher);
		
		mav.setViewName("admin_index");
		return mav;
	}
}

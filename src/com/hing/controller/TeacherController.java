package com.hing.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Course;
import com.hing.pojo.Scheme;
import com.hing.pojo.Student;
import com.hing.pojo.Study;
import com.hing.pojo.Teach;
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
	
	//教师查看班级学生，非班主任无法查询
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
	//编辑科目成绩
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
		com.hing.pojo.Class myclass = classService.get(class_id);//根据教师获取班级
		String schemeId = myclass.getId().substring(4, 6);
		Scheme scheme = schemeService.get(schemeId);//根据班级获取方案
		
		List<Course> cs = courseService.getCourseByScheme(scheme.getId());//根据方案获取课程，作为表头
		
		List<Object[]> result = new ArrayList<Object[]>();//将会传递的数据
		
		List<Student> ss = studentService.getStudentByClass(class_id);//获取学生列表，用于获取学生人数和获取修读情况
	
		
		int studentCount = ss.size();//获取学生人数
		 
		for(int i = 0 ; i < studentCount ; i ++) {
			List<Study> ss1 = studyService.getStudyByStudent(ss.get(i).getId());//根据学号获取当前学生的所有修读情况
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

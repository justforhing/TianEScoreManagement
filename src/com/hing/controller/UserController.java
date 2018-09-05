package com.hing.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.hing.pojo.User;
import com.hing.service.ClassService;
import com.hing.service.CourseService;
import com.hing.service.SchemeService;
import com.hing.service.StudentService;
import com.hing.service.StudyService;
import com.hing.service.TeachService;
import com.hing.service.TeacherService;
import com.hing.service.UserService;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	StudentService studentService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	TeachService teachService;
	@Autowired
	CourseService courseService;
	@Autowired
	ClassService classService;
	@Autowired
	SchemeService schemeService;
	@Autowired
	StudyService studyService;
	
	@RequestMapping("/listUser")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView();
		List<User> us = userService.list();
		
		mav.addObject("us",us);
		
		mav.setViewName("listUser");
		
		return mav;
	}
	@RequestMapping("/logOut")
	public ModelAndView logOut(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("currentUser");
		mav.setViewName("index");
		return mav;
	}
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(User user,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		User currentUser = userService.get(user.getId());
		if(currentUser.getPassword().equals(user.getPassword())) {
			session.setAttribute("currentUser", currentUser);
			if(currentUser.getType() == 0) {
				List<com.hing.pojo.Class> cs = classService.list();
				List<Teacher> ts = teacherService.list();
				List<Scheme> scs = schemeService.list();
				List<Course> ss = courseService.list();
				List<User> us = userService.list();
 				session.setAttribute("scs",scs);
				session.setAttribute("cs",cs);
				session.setAttribute("ts",ts);
				session.setAttribute("ss",ss);
				session.setAttribute("us",us);
				mav.setViewName("admin_index");
			}else if(currentUser.getType()==1) {
				mav.setViewName("headmaster_index");
			}else if(currentUser.getType() == 2) {
				Teacher teacher = teacherService.get(currentUser.getId());
				List<Teach> ts = teachService.getTeachByTeacher(teacher.getId());
				List<com.hing.pojo.Class> cs = classService.getClassByTeacher(teacher.getId());
				List<Object[]> courseData = new ArrayList<Object[]>(); 
				if(ts != null) {
					for(int i = 0 ; i < ts.size() ; i++) {
						Course course = courseService.get(ts.get(i).getCourse().getId());
						Date dateTime = ts.get(i).getTime();
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");  
						String time = df.format(dateTime);  
						
						Object[] obj= {course,time,dateTime};
						courseData.add(obj);
					}//of for i
				}else {
					courseData = null;
				}//of if
				session.setAttribute("courseData",courseData);
				session.setAttribute("cs",cs);
				session.setAttribute("teacher", teacher);
				mav.setViewName("teacher_index");
			}else if(currentUser.getType() == 3) {
				Student student = studentService.get(currentUser.getId());
				List<Study> ss = studyService.getStudyByStudent(student.getId());
				session.setAttribute("student", student);
				session.setAttribute("ss", ss);
				mav.setViewName("student_index");
			}else {
				mav.setViewName("index");
			}
		}else{
			mav.setViewName("index");
		}
		return mav;
	}
	@RequestMapping("/showAllUser")
	public ModelAndView showAllUser(){
		ModelAndView mav = new ModelAndView();
		List<User> us = userService.list();
		mav.addObject("us",us);
		mav.setViewName("userList");
		
		return mav;
	}
	@RequestMapping("/updateUser")
	public ModelAndView updateUser(User user){
		ModelAndView mav = new ModelAndView();
		
		userService.update(user);
		
		mav.setViewName("index");
		
		return mav;
	}
	@RequestMapping("/importTeachers")
	public ModelAndView importTeachers() {
		ModelAndView mav = new ModelAndView();
		List<User> us = userService.getTeachers();
		int ucount= us.size();
		List<Teacher> ts = teacherService.list();
		int tcount = ts.size();
		if(ucount < tcount) {
			for(int i = 0 ; i < tcount ; i++) {
				if(!userService.isExist(ts.get(i).getId())) {
					User user = new User();
					user.setId(ts.get(i).getId());
					user.setPassword("123456");
					user.setType(2);
					userService.add(user);
				}
			}
		}
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/importStudents")
	public ModelAndView importStudents() {
		ModelAndView mav = new ModelAndView();
		List<User> us = userService.getStudents();
		int ucount= us.size();
		List<Student> ss = studentService.list();
		int scount = ss.size();
		if(ucount < scount) {
			for(int i = 0 ; i < scount ; i++) {
				if(!userService.isExist(ss.get(i).getId())) {
					User user = new User();
					user.setId(ss.get(i).getId());
					user.setPassword("123456");
					user.setType(3);
					userService.add(user);
				}
			}
		}
		
		mav.setViewName("admin_index");
		return mav;
	}
	@RequestMapping("/deleteUser")
	public ModelAndView deleteUser(String id){
		ModelAndView mav = new ModelAndView();
		
		userService.delete(id);
		
		mav.setViewName("admin_index");
		
		return mav;
	}
	@RequestMapping("/checkMyInformation")
	public ModelAndView checkMyInformation(String id) {
		ModelAndView mav = new ModelAndView();
		User user = userService.get(id);
		if(user.getType() == 0) {
			mav.addObject("currentUser",user);
			mav.setViewName("showMyInformationAsAdmin");
		}else if(user.getType() == 1){
			mav.setViewName("showMyInformationAsTeacher");
		}else if(user.getType() == 2) {
			mav.setViewName("showMyInformationAsStudent");
		}
		
		return mav;
	}
	@RequestMapping("/addUser")
	public ModelAndView addUser(User user){
		ModelAndView mav = new ModelAndView();
		
		userService.add(user);
		
		mav.setViewName("admin_index");
		
		return mav;
	}
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("index");
		
		return mav;
	}
}

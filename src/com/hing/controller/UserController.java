package com.hing.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hing.pojo.Course;
import com.hing.pojo.Scheme;
import com.hing.pojo.Student;
import com.hing.pojo.Teach;
import com.hing.pojo.Teacher;
import com.hing.pojo.User;
import com.hing.service.ClassService;
import com.hing.service.CourseService;
import com.hing.service.SchemeService;
import com.hing.service.StudentService;
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
	
	@RequestMapping("/listUser")
	public ModelAndView listUser() {
		ModelAndView mav = new ModelAndView();
		List<User> us = userService.list();
		
		mav.addObject("us",us);
		
		mav.setViewName("listUser");
		
		return mav;
	}
	@RequestMapping("/loginCheck")
	public ModelAndView loginCheck(User user) {
		ModelAndView mav = new ModelAndView();
		User current = userService.get(user.getId());
		int type = current.getType();
		mav.addObject("type",type);
		if(current.getPassword().equals(user.getPassword())) {
			if(current.getType() == 0) {
				List<com.hing.pojo.Class> cs = classService.list();
				List<Teacher> ts = teacherService.list();
				List<Scheme> scs = schemeService.list();
				mav.addObject("scs",scs);
				mav.addObject("cs",cs);
				mav.addObject("ts",ts);
				mav.addObject("currentUser",user);
				mav.setViewName("admin_index");
			}else if(current.getType()==1) {
				mav.setViewName("headmaster_index");
			}else if(current.getType() == 2) {
				/**
				 * 加载所教科目信息
				 * 1.根据教师ID获取Teach对象和时间
				 * 2.根据Teach.courseID获取Course对象
				 * 3.前端展示course名字和时间
				 * @param id
				 * @return
				 */
				Teacher currentUser = teacherService.get(current.getId());
				List<Teach> ts = teachService.getTeachByTeacher(currentUser.getId());
				List<com.hing.pojo.Class> cs = classService.getClassByTeacher(currentUser.getId());
				List<Object[]> courseData = new ArrayList<Object[]>(); //每个对象数组包含一个课程对象和时间
				if(ts != null) {
					for(int i = 0 ; i < ts.size() ; i++) {
						Course course = courseService.get(ts.get(i).getCourse().getId());
						Date dateTime = ts.get(i).getTime();
						DateFormat df = new SimpleDateFormat("yyyy-MM-dd日 hh:mm:ss");  
						String time = df.format(dateTime);  
						
						Object[] obj= {course,time,dateTime};
						courseData.add(obj);
					}//of for i
				}else {
					courseData = null;
				}//of if
				mav.addObject("courseData",courseData);
				mav.addObject("cs",cs);
				mav.addObject("currentUser",currentUser);
				mav.setViewName("teacher_index");
			}else if(current.getType() == 3) {
				Student currentUser = studentService.get(current.getId());
				mav.addObject("currentUser",currentUser);
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
		/**
		 * step1:查找还没有导入的教师列表
		 * step2:利用循环来逐个导入
		 */
		List<User> us = userService.list();
		int ucount = us.size();
		List<Teacher> ts = teacherService.list();
		int tcount = ts.size();
		System.out.println(ucount+":"+tcount);
		
		mav.setViewName("admin_index");
		return mav;
	}
	
	@RequestMapping("/importStudents")
	public ModelAndView importStudents() {
		ModelAndView mav = new ModelAndView();
		
		
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
			Teacher teacher = teacherService.get(id);
			mav.addObject("currentUser",teacher);
			mav.setViewName("showMyInformationAsTeacher");
		}else if(user.getType() == 2) {
			Student student = studentService.get(id);
			mav.addObject("currentUser",student);
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

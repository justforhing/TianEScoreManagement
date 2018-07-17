package com.hing.pojo;

import java.util.Date;

public class Teach {
	private Course course;
	private Teacher teacher;
	private Date time;
	
	@Override
	public String toString() {
		return "Teach [course=" + course + ", teacher=" + teacher + ", time=" + time + "]";
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}

package com.hing.pojo;
//学生类，该类用于表征学生的基本信息
public class Student {
	private String id;
	private String name;
	private String sex;
	private int age;
	private String email;
	private String tel;
	private String id_number;
	private Class myclass;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getId_number() {
		return id_number;
	}
	public void setId_number(String id_number) {
		this.id_number = id_number;
	}
	public Class getMyclass() {
		return myclass;
	}
	public void setMyclass(Class myclass) {
		this.myclass = myclass;
	}
}

package com.sterling.dto;


public class Course {
	
	private int id = 0;
	private String courseName = null;
	private String courseDetails = null;
	private int coursePrice = 0;
	
	
	public int getCoursePrice() {
		return coursePrice;
	}
	public void setCoursePrice(int coursePrice) {
		this.coursePrice = coursePrice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseDetails() {
		return courseDetails;
	}
	public void setCourseDetails(String courseDetails) {
		this.courseDetails = courseDetails;
	}
	
	

}

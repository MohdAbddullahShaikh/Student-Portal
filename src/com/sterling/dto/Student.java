package com.sterling.dto;



public class Student {

	private int id = 0;
	private String name = null;
	private String email = null;
	private String password = null;
	private long mobileNumber = 0l;
	private String address = null;
	private String type = null;
	
//	private List<Post> posts = new ArrayList<Post>();
//	private List<Announcement> announcements = new ArrayList<Announcement>();
//	
//	
//	
//	public List<Announcement> getAnnouncements() {
//		return announcements;
//	}
//
//
//
//
//
//
//
//	public void setAnnouncements(List<Announcement> announcements) {
//		this.announcements = announcements;
//	}







//	public List<Post> getPosts() {
//		return posts;
//	}
//
//
//
//
//
//
//
//	public void setPosts(List<Post> posts) {
//		this.posts = posts;
//	}







	public Student() {
		
	}



	



	public Student(String name, String email, String password, long mobileNumber, String address, String type) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.mobileNumber = mobileNumber;
		this.address = address;
		this.type = type;
	}







	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}

	


	public long getMobileNumber() {
		return mobileNumber;
	}



	public void setMobileNumber(long mobileNumber) {
		this.mobileNumber = mobileNumber;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}
	
	
	
}

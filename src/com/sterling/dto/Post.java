package com.sterling.dto;

public class Post {
	
	private int pid = 0;
	private String postTitle = null;
	private String postContent = null;
	private byte[] postPhoto = null;
	private String photoName = null;
	private Student poster = null;
	
	
	public Student getPoster() {
		return poster;
	}
	public void setPoster(Student poster) {
		this.poster = poster;
	}
	public String getPhotoName() {
		return photoName;
	}
	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}
	public String getPostContent() {
		return postContent;
	}
	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}
	public byte[] getPostPhoto() {
		return postPhoto;
	}
	public void setPostPhoto(byte[] postPhoto) {
		this.postPhoto = postPhoto;
	}
	
	

}

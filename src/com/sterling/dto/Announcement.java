package com.sterling.dto;


public class Announcement {

	private int aid = 0;
	private String title = null;
	private String content = null;
	private Student announcerId = null;
	
	
	public Student getAnnouncerId() {
		return announcerId;
	}
	public void setAnnouncerId(Student announcerId) {
		this.announcerId = announcerId;
	}
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}

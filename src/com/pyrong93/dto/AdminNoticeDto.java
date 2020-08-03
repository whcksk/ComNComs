package com.pyrong93.dto;

import java.sql.Timestamp;

public class AdminNoticeDto {
	private int no;
	private String title;
	private String content;
	private Timestamp date;
	public AdminNoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminNoticeDto(int no, String title, String content, Timestamp date) {
		super();
		this.no = no;
		this.title = title;
		this.content = content;
		this.date = date;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "AdminnoticeDto [no=" + no + ", title=" + title + ", content=" + content + ", date=" + date + "]";
	}
}

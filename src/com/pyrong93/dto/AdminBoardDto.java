package com.pyrong93.dto;

import java.sql.Timestamp;

public class AdminBoardDto {
	private int no;
	private String name;
	private String title;
	private String content;
	private int hit;
	private Timestamp date;
	private String file;
	
	public AdminBoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminBoardDto(int no, String name, String title, String content, int hit, Timestamp date, String file) {
		super();
		this.no = no;
		this.name = name;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.date = date;
		this.file = file;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	@Override
	public String toString() {
		return "AdminBoardDto [no=" + no + ", name=" + name + ", title=" + title + ", content=" + content + ", hit="
				+ hit + ", date=" + date + ", file=" + file + "]";
	}
}

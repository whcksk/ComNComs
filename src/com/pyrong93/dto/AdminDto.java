package com.pyrong93.dto;

public class AdminDto {
	private int no;
	private String id;
	private String name;
	private String pass;
	public AdminDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminDto(int no, String id, String name, String pass) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.pass = pass;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
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
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	
	@Override
	public String toString() {
		return "AdminDto [no=" + no + ", id=" + id + ", name=" + name + ", pass=" + pass + "]";
	}
}

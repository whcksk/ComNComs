package com.pyrong93.dto;

public class Admin_authoDto {
	private String admin_id;
	private String autho_name;
	private String mode;

	public Admin_authoDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin_authoDto(String admin_id, String autho_name, String mode) {
		super();
		this.admin_id = admin_id;
		this.autho_name = autho_name;
		this.mode = mode;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAutho_name() {
		return autho_name;
	}

	public void setAutho_name(String autho_name) {
		this.autho_name = autho_name;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	@Override
	public String toString() {
		return "Admin_authoDto [admin_id=" + admin_id + ", autho_name=" + autho_name + ", mode=" + mode + "]";
	}
}

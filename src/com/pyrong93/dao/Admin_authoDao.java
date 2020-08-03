package com.pyrong93.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import com.pyrong93.dbmanager.DBManager;
import com.pyrong93.dto.Admin_authoDto;

public class Admin_authoDao {
	DBManager db = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	public int create(Admin_authoDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "insert into admin_autho(admin_id, autho_name, mode) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getAdmin_id());
			pstmt.setString(2, dto.getAutho_name());
			pstmt.setString(3, dto.getMode());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public HashMap<String, String> select(String id) {
		HashMap<String, String> dto = new HashMap<String, String>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin_autho where admin_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				dto.put(rset.getString(2), rset.getString(3));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public HashMap<String, HashMap<String, String>> selectAll(){
		HashMap<String, HashMap<String, String>> dtos = new HashMap<String, HashMap<String,String>>();	//id, name, mode
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin_autho";
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			String id = "";
			while(rset.next()) {
				HashMap<String, String> tmp;
				if(!id.equals(rset.getString(1))) {
					id = rset.getString(1);
					tmp = new HashMap<String, String>();
				} else {
					tmp = dtos.get(id);
				}
				tmp.put(rset.getString(2), rset.getString(3));
				dtos.put(id, tmp);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
	}
	
	public int update(Admin_authoDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "update admin_autho set mode=? where admin_id=? and autho_name=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getMode());
			pstmt.setString(2, dto.getAdmin_id());
			pstmt.setString(3, dto.getAutho_name());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public int delete(String id) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "delete from admin_autho where admin_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public void connClose() {
		if (rset != null) {
			try {
				rset.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

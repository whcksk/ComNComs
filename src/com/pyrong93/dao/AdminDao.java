package com.pyrong93.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pyrong93.dbmanager.DBManager;
import com.pyrong93.dto.AdminDto;

public class AdminDao {
	DBManager db = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	public int create(AdminDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "insert into admin(id, name, pass) values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getPass());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public AdminDto select(String id) {
		AdminDto dto = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				dto = new AdminDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public ArrayList<AdminDto> selectAll(){
		ArrayList<AdminDto> dtos = new ArrayList<AdminDto>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin";
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				dtos.add(new AdminDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4)));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
	}
	
	public int update(AdminDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "update admin set name=?, pass=? where id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getId());
			
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
			String sql = "delete from admin where id=?";
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
	
	public AdminDto login(AdminDto dto) {
		AdminDto res = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin where id=? and pass=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				res = new AdminDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4));
			}
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

package com.pyrong93.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pyrong93.dbmanager.DBManager;
import com.pyrong93.dto.AdminDto;
import com.pyrong93.dto.AuthoDto;

public class AuthoDao {
	DBManager db = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	public int create(AuthoDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "insert into authority(name) values(?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public AuthoDto select(String name) {
		AuthoDto dto = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from authority where name=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				dto = new AuthoDto(rset.getInt(1), rset.getString(2));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public ArrayList<AuthoDto> selectAll(){
		ArrayList<AuthoDto> dtos = new ArrayList<AuthoDto>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from authority";
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				dtos.add(new AuthoDto(rset.getInt(1), rset.getString(2)));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
	}
	
	public int update(AuthoDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "update authority set name=? where no=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getNo());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public int delete(int no) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "delete from authority where no=?";
			
			pstmt.setInt(1, no);
			
			pstmt = conn.prepareStatement(sql);
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public ArrayList<AuthoDto> getAuthos(AdminDto admin){
		ArrayList<AuthoDto> dtos = new ArrayList<AuthoDto>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from admin_autho where no=?";
			pstmt.setInt(1, admin.getNo());
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dtos.add(new AuthoDto(rset.getInt(1), rset.getString(2)));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
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

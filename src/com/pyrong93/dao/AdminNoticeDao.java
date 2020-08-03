package com.pyrong93.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pyrong93.dbmanager.DBManager;
import com.pyrong93.dto.AdminNoticeDto;

public class AdminNoticeDao {
	DBManager db = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;

	public int create(AdminNoticeDto dto){
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "insert into adminnotice(title, content) values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			
			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public ArrayList<AdminNoticeDto> selectAll(){
		ArrayList<AdminNoticeDto> dtos = new ArrayList<AdminNoticeDto>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from adminnotice";
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dtos.add(new AdminNoticeDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getTimestamp(4)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
	}
	
	public AdminNoticeDto select(int no) {
		AdminNoticeDto dto = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from adminnotice where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dto = new AdminNoticeDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getTimestamp(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public int update(AdminNoticeDto dto) {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "update from adminnotice set title=? content=? where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNo());
			
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
			String sql = "select * from adminnotice where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			
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

package com.pyrong93.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.pyrong93.controller.admin.Admin;
import com.pyrong93.dbmanager.DBManager;
import com.pyrong93.dto.AdminBoardDto;

public class AdminBoardDao {
	DBManager db = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rset = null;

	public int create(AdminBoardDto dto){
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "insert into adminboard(name, title, content, file) values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getFile());

			res = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public AdminBoardDto select(int no) {
		AdminBoardDto dto = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from adminboard where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				dto = new AdminBoardDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getInt(5), rset.getTimestamp(6), rset.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public AdminBoardDto select(String name) {
		AdminBoardDto dto = null;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from adminboard where name=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				dto = new AdminBoardDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getInt(5), rset.getTimestamp(6), rset.getString(7));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dto;
	}
	
	public ArrayList<AdminBoardDto> selectAll(){
		ArrayList<AdminBoardDto> dtos = new ArrayList<AdminBoardDto>();
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select * from adminboard";
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				dtos.add(new AdminBoardDto(rset.getInt(1), rset.getString(2), rset.getString(3), rset.getString(4), rset.getInt(5), rset.getTimestamp(6), rset.getString(7)));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return dtos;
	}
	
	public int selectCnt() {
		int res = -1;
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "select count(*) from adminboard";
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				res = rset.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			connClose();
		}
		return res;
	}
	
	public int update(AdminBoardDto dto){
		int res = -1;     
		try {
			db = new DBManager();
			conn = db.getConnection();
			String sql = "update adminboard set title=?, content=?, date=null, file=? where no=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getFile());
			pstmt.setInt(4, dto.getNo());
			
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
			String sql = "delete from adminboard where no=?";
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

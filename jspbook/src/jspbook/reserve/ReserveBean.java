package jspbook.reserve;

import java.sql.*;
import java.util.*;

public class ReserveBean {

	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jsptest"; 
	
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url,"jspbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public boolean insertDB(Reserve reserve) {
		connect();
				
		String sql ="insert into reserve_table(pid,reserve_date,movie_title,movie_time) values(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,reserve.getPid());
			pstmt.setString(2,reserve.getReserve_date());
			pstmt.setString(3,reserve.getMovie_title());
			pstmt.setString(4,reserve.getMovie_time());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
		return true;
	}

	
	public ArrayList<MovieTitle> getDBList() {
		connect();	
		ArrayList<MovieTitle> datas = new ArrayList<MovieTitle>();
		
		String sql = "select movie_title from movie_table";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();	
			while(rs.next()) {
				MovieTitle mt = new MovieTitle();
				
				mt.setMovie_title(rs.getString("movie_title"));
				
				datas.add(mt);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas;
	}
}

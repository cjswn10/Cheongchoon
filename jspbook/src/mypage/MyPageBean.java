package mypage;

import java.sql.*;
import java.util.*;

import java.sql.DriverManager;

public class MyPageBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jsptest";
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn = DriverManager.getConnection(jdbc_url, "jspbook","1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean updateDB(MyPage mypage) {
		connect();
		
		String sql = "update login_table set login_pw=?, login_name=?, login_email=? where login_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mypage.getLogin_pw());
			pstmt.setString(2, mypage.getLogin_name());
			pstmt.setString(3, mypage.getLogin_email());
			pstmt.setString(4, mypage.getLogin_id());
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
	
	public ArrayList<MyReserve> getDBList(String login_id) {
		connect();
		
		ArrayList<MyReserve> data = new ArrayList<MyReserve>();
		
		String sql = "select * from reserve_table where pid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				MyReserve myreserve = new MyReserve();
				
					myreserve.setPid(rs.getString("pid"));
					myreserve.setMovie_title(rs.getString("movie_title"));
					myreserve.setReserve_date(rs.getString("reserve_date"));
					myreserve.setMovie_time(rs.getString("movie_time"));
					data.add(myreserve);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return data;
	}	
	
	public MyPage getDB(String login_id) {
		connect();
		
		String sql = "select * from login_table where login_id=?";
		MyPage mypage = new MyPage();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			mypage.setLogin_id(rs.getString("login_id"));
			mypage.setLogin_pw(rs.getString("login_pw"));
			mypage.setLogin_name(rs.getString("login_name"));
			mypage.setLogin_email(rs.getString("login_email"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return mypage;
	}
	
}
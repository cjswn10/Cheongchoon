package jspbook3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jsptest";
	
	void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn = DriverManager.getConnection(jdbc_url, "jspbook", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean check(Login login) {
		connect();
		
		String sql = "select login_pw from login_table where login_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, login.getLogin_id());
			ResultSet rs = pstmt.executeQuery();
		
			if (rs.next()) {
				if (login.getLogin_pw().equals(rs.getString(1))) {
					rs.close();
					return true;
				}
				else
					return false;
			}
			else {
				rs.close();
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		finally {
			disconnect();
		}
	
	}
	

	
}
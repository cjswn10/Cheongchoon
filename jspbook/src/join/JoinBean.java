package join;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import movie.MovieInfo;

public class JoinBean {
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
	
	public boolean insertDB(MyPage mypage) {
		connect();
		
		String sql = "insert into login_table(login_id,login_pw,login_email,login_name) values(?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mypage.getLogin_id());
			pstmt.setString(2, mypage.getLogin_pw());;
			pstmt.setString(3, mypage.getLogin_email());
			pstmt.setString(4, mypage.getLogin_name());
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
	public ArrayList<MyPage> getDBList(){
		connect();
		ArrayList<MyPage> datas = new ArrayList<MyPage>();
		
		String sql = "select * from login_table";
		
		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				MyPage mypage = new MyPage();
				
				mypage.setLogin_id(rs.getString("login_id"));
				mypage.setLogin_pw(rs.getString("login_pw"));
				mypage.setLogin_name(rs.getString("login_name"));
				mypage.setLogin_email(rs.getString("login_email"));

				datas.add(mypage);
			}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		finally{
			disconnect();
			
		}
		return datas;
	}
}

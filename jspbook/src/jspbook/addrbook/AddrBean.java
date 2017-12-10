package jspbook.addrbook;

import java.sql.*;
import java.util.*;

/**
 * File : AddrBean.java
 * Desc : 二쇱?��濡� �봽濡쒓?���옩 DAO �겢�옒�뒪
 * @author �솴�씗�젙(dinfree@dinfree.com)
 */
public class AddrBean { 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/jspdb"; 
	
	// DB�뿰寃� 硫붿꽌��?
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
	
	// �닔�젙�맂 二쇱?��濡� �궡�슜 媛깆?���쓣 �쐞�븳 硫붿꽌��?
	public boolean updateDB(AddrBook addrbook) {
		connect();
		
		String sql ="update addrbook set ab_name=?, ab_email=?, ab_birth=?, ab_tel=?, ab_comdept=?, ab_memo=? where ab_id=?";		
		 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3,addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
			pstmt.setInt(7,addrbook.getAb_id());
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
	
	// �듅�젙 二쇱?��濡� 寃뚯?��湲� �궘�젣 硫붿꽌��?
	public boolean deleteDB(int gb_id) {
		connect();
		
		String sql ="delete from addrbook where ab_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
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
	
	// �떊洹� 二쇱?��濡� 硫붿?��吏� ?��붽� 硫붿꽌��?
	public boolean insertDB(AddrBook addrbook) {
		connect();
		// sql ?��몄옄�뿴 , gb_id �뒗 �옄�룞 �벑濡� �릺誘�濡� �엯�젰�븯吏� �븡�뒗�떎.
				
		String sql ="insert into addrbook(ab_name,ab_email,ab_birth,ab_tel,ab_comdept,ab_memo) values(?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,addrbook.getAb_name());
			pstmt.setString(2,addrbook.getAb_email());
			pstmt.setString(3, addrbook.getAb_birth());
			pstmt.setString(4,addrbook.getAb_tel());
			pstmt.setString(5,addrbook.getAb_comdept());
			pstmt.setString(6,addrbook.getAb_memo());
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

	// �듅�젙 二쇱?��濡� 寃뚯?��湲� 媛��졇�삤�뒗 硫붿꽌��?
	public AddrBook getDB(int gb_id) {
		connect();
		
		String sql = "select * from addrbook where ab_id=?";
		AddrBook addrbook = new AddrBook();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,gb_id);
			ResultSet rs = pstmt.executeQuery();
			
			// �뜲�씠�꽣媛� �븯�굹留� �엳�쑝誘�濡� rs.next()?���? �븳踰덈�? �떎�뻾 �븳�떎.
			rs.next();
			addrbook.setAb_id(rs.getInt("ab_id"));
			addrbook.setAb_name(rs.getString("ab_name"));
			addrbook.setAb_email(rs.getString("ab_email"));
			addrbook.setAb_birth(rs.getString("ab_birth"));
			addrbook.setAb_tel(rs.getString("ab_tel"));
			addrbook.setAb_comdept(rs.getString("ab_comdept"));
			addrbook.setAb_memo(rs.getString("ab_memo"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return addrbook;
	}
	
	// �쟾泥� 二쇱?��濡� 紐⑸줉�?�� 媛��졇�삤�뒗 硫붿꽌��?
	public ArrayList<AddrBook> getDBList() {
		connect();
		ArrayList<AddrBook> datas = new ArrayList<AddrBook>();
		
		String sql = "select * from addrbook order by ab_id desc";
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				AddrBook addrbook = new AddrBook();
				
				addrbook.setAb_id(rs.getInt("ab_id"));
				addrbook.setAb_name(rs.getString("ab_name"));
				addrbook.setAb_email(rs.getString("ab_email"));
				addrbook.setAb_comdept(rs.getString("ab_comdept"));
				addrbook.setAb_birth(rs.getString("ab_birth"));
				addrbook.setAb_tel(rs.getString("ab_tel"));
				addrbook.setAb_memo(rs.getString("ab_memo"));
				datas.add(addrbook);
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
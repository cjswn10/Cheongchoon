package movie;

import java.sql.*;
import java.util.*;

public class MovieBean {
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

	
	public boolean updateDB(MovieInfo mv_info){
		connect();
		
		String sql="update movie_table set movie_title=?, director=?, actor=?,genre=?,synopsis=?,picture=?, grade=?,movie_id=?, score=?";
		
		try{
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, mv_info.getMovie_title());
			pstmt.setString(2, mv_info.getDirector());
			pstmt.setString(3, mv_info.getActor());
			pstmt.setString(4, mv_info.getGenre());
			pstmt.setString(5, mv_info.getSynopsis());
			pstmt.setString(6, mv_info.getPicture());
			pstmt.setInt(7, mv_info.getGrade());
			pstmt.setString(8, mv_info.getMovie_id());
			pstmt.setInt(9, mv_info.getScore());
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		finally{
			disconnect();
		}
		return true;
	}
	
	public boolean deleteDB(String movie_id){
		connect();
		
		String sql="delete from movie_table where moive_id=?";
		
		try{
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		finally{
			disconnect();
			
		}
		return true;
	}
	
	public boolean insertDB (Comment co_info) {
		connect();
		
		String sql="insert into comment_table(movie_title, id, content) values(?,?,?)";
		
		try{
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, co_info.getMovie_title());
			pstmt.setString(2, co_info.getId());
			pstmt.setString(3, co_info.getContent());
			
			pstmt.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
			return false;
		}
		finally{
			disconnect();
			
		}
		return true;
	}
	
	public MovieInfo getDB(String movie_id){
		connect();
		
		String sql="select * from movie_table where movie_id=?";
		MovieInfo mv_info = new MovieInfo();
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movie_id);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			mv_info.setMovie_title(rs.getString("movie_title"));
			mv_info.setDirector(rs.getString("director"));
			mv_info.setActor(rs.getString("actor"));
			mv_info.setGenre(rs.getString("genre"));
			mv_info.setSynopsis(rs.getString("synopsis"));
			mv_info.setPicture(rs.getString("picture"));
			mv_info.setGrade(rs.getInt("grade"));
			mv_info.setScore(rs.getInt("score"));
			mv_info.setMovie_id(rs.getString("movie_id"));
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		finally{
			disconnect();
			
		}
		return mv_info;
	}
	public ArrayList<Comment> getCDBList(){
		connect();
		ArrayList<Comment> datas = new ArrayList<Comment>();
		
		String sql = "select * from comment_table";
		
		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				Comment co_info = new Comment();
				
				co_info.setMovie_title(rs.getString("movie_title"));
				co_info.setId(rs.getString("id"));
				co_info.setContent(rs.getString("content"));
				
				datas.add(co_info);
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
	
	public ArrayList<MovieInfo> getDBList(){
		connect();
		ArrayList<MovieInfo> datas = new ArrayList<MovieInfo>();
		
		String sql = "select * from movie_table";
		
		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				MovieInfo mv_info = new MovieInfo();
				
				mv_info.setMovie_title(rs.getString("movie_title"));
				mv_info.setDirector(rs.getString("director"));
				mv_info.setActor(rs.getString("actor"));
				mv_info.setGenre(rs.getString("genre"));
				mv_info.setSynopsis(rs.getString("synopsis"));
				mv_info.setPicture(rs.getString("picture"));
				mv_info.setGrade(rs.getInt("grade"));
				mv_info.setScore(rs.getInt("score"));
				mv_info.setMovie_id(rs.getString("movie_id"));
				datas.add(mv_info);
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
	
	public int like(MovieInfo movieinfo) {
		connect();
		
		
		String sql = "update movie_table set score=?";
		
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, movieinfo.getMovie_title());
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			
		
			pstmt.setString(1, movieinfo.getMovie_title());
			
			pstmt.executeUpdate();
			
			
			
			
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
			
		}
		finally{
			disconnect();
			
		}
		return movieinfo.getScore();
	}
}

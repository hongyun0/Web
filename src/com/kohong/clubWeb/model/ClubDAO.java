package com.kohong.clubWeb.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ClubDAO {
	private Connection conn;

//	public ClubDAO(){}
	
	public ClubDAO(Connection conn) throws ClassNotFoundException, SQLException {		
		this.conn = conn;
	}
	
	public boolean isClubName(String clubName) {
		boolean result = false;
		String query = "select club_name from clubs where club_name = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, clubName);
			result = ps.executeQuery().next();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return result;
	}	
	
	public List<String> getCategories() {
		List<String> categories = new ArrayList();
		String query = "select section from categories";

		try {
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(query);
			while(rs.next()) {
				categories.add(rs.getString(1));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return categories;
	}
	
	public List<String> getCateClubs(String category) {
		List<String> cateClubs = new ArrayList();
		String query = "select club_name from clubs where category=?";

		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, category);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				cateClubs.add(rs.getString(1));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cateClubs;
	}

	
	public List<ClubVO> getClubList (){
		List<ClubVO> clubs= new ArrayList<>();
		String sql = "select club_name, phone_num, email, category, limit, captain_id, creater_id from Clubs";
		
		try {
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while(rs.next()) {
				clubs.add(new ClubVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubs;		
	}
	
	public boolean createClub(String clubName, String phoneNumber, String email, String category, String limit,
			String captainId, String createrId) {
		String sql = "insert into clubs (club_name, phone_num, email, category, limit, captain_id, creater_id) values (?, ?, ?, ?, ?, ?, ?)";
		boolean result = false;
		try {
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, clubName);
			pstmt.setString(2, phoneNumber);
			pstmt.setString(3, email);
			pstmt.setString(4, category);
			pstmt.setString(5, limit);
			pstmt.setString(6, captainId);
			pstmt.setString(7, createrId);

			if(pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();	
			MemberDAO dao = new MemberDAO(conn);
			dao.clubJoin(createrId, clubName);
			dao.clubJoin(captainId, clubName);
			conn.commit();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
			
		return result;
	}

	
}

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

	
	public List<ClubVO> getClubList (String order){
		List<ClubVO> clubs= new ArrayList<>();
		String sql = "";
		switch(order){
		case "newest":
			sql = "SELECT c.club_name, c.phone_num, c.email, c.category, c.limit, c.captain_id, c.creater_id, To_char(c.create_date, 'yyyy/mm/dd') AS create_date, a.count FROM   clubs c,  (SELECT club_name, Count(member_id) AS count FROM   joined_clubs WHERE  flag = 1 and club_name IN(SELECT club_name FROM clubs) GROUP  BY club_name) a WHERE  c.club_name = a.club_name ORDER  BY create_date DESC";
			break;
		case "biggest":
			sql = "SELECT c.club_name, c.phone_num, c.email, c.category, c.limit, c.captain_id, c.creater_id, To_char(c.create_date, 'yyyy/mm/dd') AS create_date, a.count FROM   clubs c,  (SELECT club_name, Count(member_id) AS count FROM   joined_clubs WHERE  flag = 1 and club_name IN(SELECT club_name FROM clubs) GROUP  BY club_name) a WHERE  c.club_name = a.club_name  order by count desc";
			break;
		case "alphabet":
			sql = "SELECT c.club_name, c.phone_num, c.email, c.category, c.limit, c.captain_id, c.creater_id, To_char(c.create_date, 'yyyy/mm/dd') AS create_date, a.count FROM   clubs c,  (SELECT club_name, Count(member_id) AS count FROM   joined_clubs WHERE  flag = 1 and club_name IN(SELECT club_name FROM clubs) GROUP  BY club_name) a WHERE  c.club_name = a.club_name  order by club_name asc";
			break;
		}
		try {
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			while(rs.next()) {
				ClubVO vo = new ClubVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				if(vo.getLimit() == null) {
					vo.setLimit("∞");
				}
				clubs.add(vo);
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
			if(!createrId.equals(captainId)){
				dao.clubJoin(captainId, clubName);
			}
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

	public List<ClubVO> getSomeClubs() {
		List<ClubVO> clubs= new ArrayList<>();
		String sql = "SELECT c.club_name, c.phone_num, c.email, c.category, c.limit, c.captain_id, c.creater_id, To_char(c.create_date, 'yyyy/mm/dd') AS create_date, a.count FROM   clubs c,  (SELECT club_name, Count(member_id) AS count FROM   joined_clubs WHERE  flag = 1 and club_name IN(SELECT club_name FROM clubs) GROUP  BY club_name) a WHERE  c.club_name = a.club_name ORDER  BY create_date DESC";
		String sql2 = "SELECT c.club_name, c.phone_num, c.email, c.category, c.limit, c.captain_id, c.creater_id, To_char(c.create_date, 'yyyy/mm/dd') AS create_date, a.count FROM   clubs c,  (SELECT club_name, Count(member_id) AS count FROM   joined_clubs WHERE  flag = 1 and club_name IN(SELECT club_name FROM clubs) GROUP  BY club_name) a WHERE  c.club_name = a.club_name  order by count desc";
		try {
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(sql);
			for(int i = 0; i < 2; i++) {
				rs.next();
				ClubVO vo = new ClubVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				if(vo.getLimit() == null) {
					vo.setLimit("∞");
				}
				clubs.add(vo);
			}
			rs.close();
			ps.close();
			
			ps = conn.createStatement();
			rs = ps.executeQuery(sql2);
			for(int i = 0; i < 2; i++) {
				rs.next();
				ClubVO vo = new ClubVO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				if(vo.getLimit() == null) {
					vo.setLimit("∞");
				}
				clubs.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubs;		
	}

	public boolean updateCaptain(String clubName, String newCaptainId){
		String sql = "update clubs set captain_id = ? where club_name = ?";
		boolean result = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newCaptainId);
			pstmt.setString(2, clubName);
			if(pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();	
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return result;
	}
}

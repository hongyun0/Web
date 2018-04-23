package com.kohong.clubWeb.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MemberDAO {
	private Connection conn;
	
//	public MemberDAO(){}
	
	public MemberDAO(Connection conn) throws ClassNotFoundException, SQLException{
		this.conn = conn;
	}
	
	public boolean isMemberId(String id) {
		boolean result = false;
		String query = "select member_id from members where member_id = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, id);
			result = ps.executeQuery().next();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return result;
	}
	
	public boolean isNickname(String nickname) {
		boolean result = false;
		String query = "select nickname from members where nickname = ?";
		try {
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, nickname);
			result = ps.executeQuery().next();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 

		return result;
	}
	
	public Map<String, String> login(String id, String pw){
		String sql = "select nickname from members where member_id = ? and password = ?";
		Map<String, String> result = new HashMap();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()){
				result.put("nickname", rs.getString(1));
			}
			rs.close();
			pstmt.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return result;
		
		
	}
	
	public boolean join(MemberVO vo){
		String sql = "insert into members (member_id, password, name, nickname, gender, birth_date, phone_num, email, city) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
		boolean result = false;
		
		try {
			conn.setAutoCommit(false);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickname());
			pstmt.setString(5, vo.getGender());
			pstmt.setString(6, vo.getBirthDate());
			pstmt.setString(7, vo.getPhoneNumber());
			pstmt.setString(8, vo.getEmail());
			pstmt.setInt(9, Integer.parseInt(vo.getCity()));
			if(pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();		
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return result;
		
	}
	
	public void setCommit(){
		try {
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public boolean clubJoin(String id, String clubName){
		if(isClubMember(id, clubName)){
			return false;
		}
		String sql = "insert into joined_clubs (joined_num, join_date, club_name, member_id) values (joined_num_seq.nextval,?, ?, ?)";
		if(isDroppedMember(id, clubName)){
			sql = "update joined_clubs set flag = 1 , join_date =? where club_name=? and member_id=?";
		}
		
		boolean result = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			LocalDate now = LocalDate.now();
			String month;
			if(now.getMonthValue() < 10) {
				month = "0" + String.valueOf(now.getMonthValue());
			} else {
				month = String.valueOf(now.getMonthValue());
			}
			String day;
			if(now.getDayOfMonth() < 10) {
				day = "0" + String.valueOf(now.getDayOfMonth());
			} else {
				day = String.valueOf(now.getDayOfMonth());
			}
			String today = String.valueOf(now.getYear()) + month + day;
			pstmt.setString(1, today);
			pstmt.setString(2, clubName);
			pstmt.setString(3, id);
			if(pstmt.executeUpdate() == 1) {
				result = true;
			}
			pstmt.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Map<String, String> getCities() {
		Map<String, String> cities = new HashMap();
		String query = "select city_code, name from cities";

		try {
			Statement ps = conn.createStatement();
			ResultSet rs = ps.executeQuery(query);
			while(rs.next()) {
				cities.put(rs.getString(1), rs.getString(2));
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return cities;
	}

	public String getMyPhone(String id) {
		String sql = "select phone_num from members where member_id = ?";
		String result = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()){
				result = rs.getString(1);
			}
			rs.close();
			pstmt.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return result;
		
	}

	public String getMyEmail(String id) {
		String sql = "select email from members where member_id = ?";
		String result = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs=pstmt.executeQuery();
			if (rs.next()){
				result = rs.getString(1);
			}
			rs.close();
			pstmt.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return result;
		
	}

	
	public List<String> getMyJoinedClubs (String id) {
		List<String> clubs = new ArrayList<>();
		String sql = "select club_name from (select j.club_name , j.flag, j.member_id, c.captain_id from joined_clubs j , clubs c where j.club_name = c.club_name and j.member_id =?) where captain_id=? ";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				clubs.add(rs.getString(1));
				}	
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubs;
	}

	public List<String> getMyManagingClubs (String id) {
		List<String> clubs = new ArrayList<>();
		String sql = "select club_name from (select j.club_name , j.flag, j.member_id, c.captain_id from joined_clubs j , clubs c where j.club_name = c.club_name and j.member_id =?) where not captain_id=?";
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				clubs.add(rs.getString(1));
				}	
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubs;
	}

	public Map<String, String> getClubInfo(String clubName){
		Map<String, String> clubInfo = new HashMap<>();
		String sql = "select category, email, phone_num ,captain_id, limit from clubs where club_name=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, clubName);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				clubInfo.put("category", rs.getString(1));
				clubInfo.put("email", rs.getString(2));
				clubInfo.put("phoneNumber", rs.getString(3));
				clubInfo.put("captainId", rs.getString(4));
				clubInfo.put("limit", rs.getString(5));
				clubInfo.put("count", String.valueOf(getMemberCount(clubName)));
				clubInfo.put("clubName", clubName);
			}
			rs.close();
			ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clubInfo;
		
	}
	
	 public int getMemberCount(String clubName){
	      int memberCount = -1;
	      String sql="select count(member_id) from joined_clubs where club_name=? and flag=1";
	      try {
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ps.setString(1, clubName);
	         ResultSet rs = ps.executeQuery();
	         if(rs.next()){
	            memberCount = rs.getInt(1);
	         }
	         rs.close();
	         ps.close();
	      } catch (SQLException e) {
	      
	         e.printStackTrace();
	      }
	      return memberCount;
	      
	   
	}
	
	 public boolean isClubMember(String memberId, String clubName){
		 boolean result = false;
			String query = "select flag from joined_clubs where member_id = ? and club_name = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setString(1, memberId);
				ps.setString(2, clubName);
				ResultSet rs = ps.executeQuery();
				if(rs.next() && rs.getInt(1) == 1) {
					result= true;
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 

			return result;
	 }

	 public boolean isDroppedMember(String memberId, String clubName){
		 boolean result = false;
			String query = "select flag from joined_clubs where member_id = ? and club_name = ?";
			try {
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setString(1, memberId);
				ps.setString(2, clubName);
				ResultSet rs = ps.executeQuery();
				if(rs.next() && rs.getInt(1) == 0) {
					result= true;
				}
				rs.close();
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 

			return result;
	 }

	public boolean clubDrop(String id, String clubName) {
		if(!isClubMember(id, clubName)){
			return false;
		}
		String sql = "update joined_clubs set flag = 0 where member_id= ? and club_name= ?";
		boolean result = false;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, clubName);
			if(pstmt.executeUpdate() >= 1) {
				result = true;
			}
			pstmt.close();			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
}

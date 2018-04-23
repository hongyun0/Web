package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class GetMyPageAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String id = (String)request.getSession().getAttribute("id");
		
		MemberDAO dao = null;
		List<String> clubNames = null;
		Collection<Map<String, String>> myJoinedClubs = new ArrayList();
		Collection<Map<String, String>> myManagingClubs = new ArrayList();
		try {
			dao = new MemberDAO(ConnectionPool.getConnection());
			clubNames = dao.getMyJoinedClubs(id);
			for(String clubName : clubNames){
				myJoinedClubs.add(dao.getClubInfo(clubName));
			}
			clubNames = dao.getMyManagingClubs(id);
			for(String clubName : clubNames){
				myManagingClubs.add(dao.getClubInfo(clubName));
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("myJoinedClubs", myJoinedClubs);
		request.setAttribute("myManagingClubs", myManagingClubs);
		return "results/getMyPage.jsp";
	}

}

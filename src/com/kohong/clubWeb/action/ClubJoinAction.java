package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class ClubJoinAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		if(request.getSession(true).getAttribute("id") == null){
			return "loginSession.jsp";
		}
		String clubName = request.getParameter("clubName");
		boolean result = false;
		String id = (String) request.getSession().getAttribute("id");
		try {
			result = new MemberDAO(ConnectionPool.getConnection()).clubJoin(id, clubName);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		String page = "results/clubJoinError.jsp";
		if(result) {
			page = "results/clubJoinOK.jsp";
		}
		return page;
	}

}

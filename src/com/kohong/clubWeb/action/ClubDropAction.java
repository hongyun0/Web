package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class ClubDropAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String clubName = request.getParameter("clubName");
		boolean result = false;
		String id = (String) request.getSession().getAttribute("id");
		try {
			result = new MemberDAO(ConnectionPool.getConnection()).clubDrop(id, clubName);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		String page = "results/clubDropError.jsp";
		if(result) {
			page = "results/clubDropOK.jsp";
		}
		
		return page;
	}

}

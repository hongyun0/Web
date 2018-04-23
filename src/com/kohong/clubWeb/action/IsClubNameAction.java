package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ClubDAO;
import com.kohong.clubWeb.model.ConnectionPool;

public class IsClubNameAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String clubName = request.getParameter("clubName");
		boolean result = false;
		try {
			result = new ClubDAO(ConnectionPool.getConnection()).isClubName(clubName);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		return "results/isExist.jsp";
	}

}

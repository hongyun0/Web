package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ClubDAO;
import com.kohong.clubWeb.model.ConnectionPool;

public class UpdateCaptainAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String clubName = request.getParameter("clubName");
		String newCaptainId = request.getParameter("captainId");
		boolean result = false;

		try {
			result = new ClubDAO(ConnectionPool.getConnection()).updateCaptain(clubName, newCaptainId);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "results/clubUpdateError.jsp";
		if(result) {
			page = "results/clubUpdateOK.jsp";
		}
		
		return page;
	}

}

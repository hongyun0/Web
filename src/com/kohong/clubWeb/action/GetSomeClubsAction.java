package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ClubDAO;
import com.kohong.clubWeb.model.ClubVO;
import com.kohong.clubWeb.model.ConnectionPool;

public class GetSomeClubsAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		List<ClubVO> clubs = new ArrayList<>();
		try {
			clubs = new ClubDAO(ConnectionPool.getConnection()).getSomeClubs();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("clubs", clubs);
		return "results/getSomeClubs.jsp";
	
	}

}

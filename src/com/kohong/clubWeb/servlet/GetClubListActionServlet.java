package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.ClubDAO;
import com.kohong.clubWeb.model.ClubVO;
import com.kohong.clubWeb.model.ConnectionPool;

@WebServlet("/getClubListAction")
public class GetClubListActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<ClubVO> clubs = new ArrayList<>();
		try {
			Connection conn = ConnectionPool.getConnection();
			clubs = new ClubDAO(conn).getClubList();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String page = "/results/getClubList.jsp";
		request.setAttribute("clubs", clubs);
		request.getRequestDispatcher(page).forward(request, response);
	}
    

}

package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.ClubDAO;

@WebServlet("/isClubNameAction")
public class IsClubNameActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String clubName = request.getParameter("clubName");
		boolean result = false;
		try {
			result = new ClubDAO().isClubName(clubName);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/results/isExist.jsp").forward(request, response);
	}
}

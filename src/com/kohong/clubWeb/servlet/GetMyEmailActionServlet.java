package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.MemberDAO;

@WebServlet("/getMyEmailAction")
public class GetMyEmailActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String result = "";
		try {
			result = new MemberDAO().getMyEmail(id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/results/getMyInfo.jsp").forward(request, response);
	}
}

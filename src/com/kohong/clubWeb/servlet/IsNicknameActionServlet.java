package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.MemberDAO;

@WebServlet("/isNicknameAction")
public class IsNicknameActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		boolean result = false;
		try {
			result = new MemberDAO().isNickname(nickname);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		request.getRequestDispatcher("/results/isExist.jsp").forward(request, response);
	}
}

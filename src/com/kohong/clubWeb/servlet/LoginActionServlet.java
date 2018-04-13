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
import javax.servlet.http.HttpSession;

import com.kohong.clubWeb.model.MemberDAO;



@WebServlet("/loginAction")
public class LoginActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Map<String, String> result = new HashMap();
		try {
			result=new MemberDAO().login(id, pw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		String page = "loginError.jsp";
		
		if(!result.isEmpty()) {
			page = "loginOK.jsp";
			request.setAttribute("nickname", result.get("nickname"));
			HttpSession session = request.getSession(true);
			session.setAttribute("id", id);
		}
		request.getRequestDispatcher("/results/" + page).forward(request, response);
	}
    

}

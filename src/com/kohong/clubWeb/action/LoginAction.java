package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class LoginAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		Map<String, String> result = new HashMap();
		try {
			result=new MemberDAO(ConnectionPool.getConnection()).login(id, pw);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		String page = "results/loginError.jsp";
		
		if(!result.isEmpty()) {
			page = "results/loginOK.jsp";
			HttpSession session = request.getSession(true);
			session.setAttribute("nickname", result.get("nickname"));
			session.setAttribute("id", id);
		}
		
		return page;
	}

}

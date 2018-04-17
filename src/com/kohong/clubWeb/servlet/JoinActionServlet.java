package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

@WebServlet("/joinAction")
public class JoinActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String[]> inputs = request.getParameterMap();
		boolean result[] = null;
		
		try {
			Connection conn = ConnectionPool.getConnection();
			Set<String> keys = inputs.keySet();
			result = new MemberDAO(conn).join(inputs.get("id")[0], inputs.get("pw")[0], inputs.get("name")[0], inputs.get("nickname")[0], inputs.get("gender")[0], inputs.get("birthyear")[0]+inputs.get("birthmonth")[0]+inputs.get("birthday")[0], inputs.get("telefront")[0]+inputs.get("teleback")[0], inputs.get("email")[0], inputs.get("city")[0], inputs.get("club")[0]);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "joinError.jsp";
		if(result[0] && result[1]) {
			page = "joinOK.jsp";
		}
		request.getRequestDispatcher("/results/"+page).forward(request, response);
	}
}

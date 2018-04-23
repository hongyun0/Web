package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class GetCitiesAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		Map<String, String> result = new HashMap();
		try {
			result = new MemberDAO(ConnectionPool.getConnection()).getCities();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("result", result);
		return "results/getCities.jsp";
	}

}

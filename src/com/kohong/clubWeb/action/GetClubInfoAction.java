package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;

public class GetClubInfoAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		Map<String, String> clubInfo = new HashMap();
		try {
			clubInfo = new MemberDAO(ConnectionPool.getConnection()).getClubInfo(request.getParameter("clubName"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("club", clubInfo);
		return "results/getClubInfo.jsp";
	}

}

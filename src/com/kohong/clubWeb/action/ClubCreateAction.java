package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ClubDAO;
import com.kohong.clubWeb.model.ConnectionPool;

public class ClubCreateAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		Map<String, String[]> inputs = request.getParameterMap();
		boolean result = false;
		String id = (String) request.getSession().getAttribute("id");
		try {
			String category = inputs.get("field")[0];
			if(inputs.get("field")[0] == "직접입력"){
				category = inputs.get("fieldInput")[0];
			}
			String telefront = inputs.get("telefront")[0];
			if(telefront.equals("---")){
				telefront = "";
			}

			result = new ClubDAO(ConnectionPool.getConnection()).createClub(inputs.get("clubName")[0], telefront + inputs.get("teleback")[0], inputs.get("email")[0], category, inputs.get("limit")[0], inputs.get("id")[0], id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "results/clubCreateError.jsp";
		if(result) {
			page = "results/clubCreateOK.jsp?clubName=" + inputs.get("clubName")[0];
		}
		
		return page;
	}

}

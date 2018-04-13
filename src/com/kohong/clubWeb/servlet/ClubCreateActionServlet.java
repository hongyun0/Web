package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.model.ClubDAO;

@WebServlet("/clubCreateAction")
public class ClubCreateActionServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

			//System.out.println(inputs.get("clubName")[0]+"/"+ inputs.get("telefront")[0] + inputs.get("teleback")[0]+"/"+inputs.get("email")[0]+"/"+category+"/"+inputs.get("limit")[0]+"/"+inputs.get("id")[0]+"/"+ id);
			result = new ClubDAO().createClub(inputs.get("clubName")[0], telefront + inputs.get("teleback")[0], inputs.get("email")[0], category, inputs.get("limit")[0], inputs.get("id")[0], id);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "clubCreateError.jsp";
		if(result) {
			page = "clubCreateOK.jsp?clubName=" + inputs.get("clubName")[0];
		}
		request.getRequestDispatcher("/results/"+page).forward(request, response);
	}
}

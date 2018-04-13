package com.kohong.clubWeb.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kohong.clubWeb.model.MemberDAO;

@WebServlet("/getMyPageAction")
public class GetMyPageActionServlet extends HttpServlet {       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		MemberDAO dao = null;
		List<String> clubNames = null;
		Collection<Map<String, String>> clubInfos = new ArrayList();
		try {
			dao = new MemberDAO();
			clubNames = dao.getMyJoinedClubs(id);
			for(String clubName: clubNames){
				Map<String, String> map= dao.getClubInfo(clubName);
				clubInfos.add(map);
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "/results/getMyPage.jsp";
		request.setAttribute("clubInfos", clubInfos);
		request.getRequestDispatcher(page).forward(request, response);
		
	}
}

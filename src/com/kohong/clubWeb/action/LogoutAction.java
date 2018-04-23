package com.kohong.clubWeb.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		HttpSession session=request.getSession();
		
		if(session !=null) {
			session.invalidate(); 
		}
		
		return "home.jsp";
	}

}

package com.kohong.clubWeb.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

public class MenuUI implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		return "menu.jsp";
	}

}

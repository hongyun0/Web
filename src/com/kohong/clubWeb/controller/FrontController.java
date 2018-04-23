package com.kohong.clubWeb.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kohong.clubWeb.action.Action;
import com.kohong.clubWeb.action.ActionFactory;

@WebServlet("/controller")
public class FrontController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String cmd = request.getParameter("cmd");
		Action action = ActionFactory.getAction(cmd);
		
		String page = "index.html";
		if(action != null) {
			page = action.excute(request);
		}
		
		request.getRequestDispatcher("/"+page).forward(request, response);
	}

}

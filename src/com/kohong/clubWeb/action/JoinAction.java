package com.kohong.clubWeb.action;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

import com.kohong.clubWeb.model.ConnectionPool;
import com.kohong.clubWeb.model.MemberDAO;
import com.kohong.clubWeb.model.MemberVO;

public class JoinAction implements Action {

	@Override
	public String excute(HttpServletRequest request) throws ServletException, IOException {
		Map<String, String[]> inputs = request.getParameterMap();
		boolean result = false;
		try {
			MemberDAO dao = new MemberDAO(ConnectionPool.getConnection());
			if(dao.join(new MemberVO(inputs.get("id")[0], inputs.get("pw")[0], inputs.get("name")[0], 
					inputs.get("nickname")[0], inputs.get("gender")[0], 
					inputs.get("birthyear")[0]+inputs.get("birthmonth")[0]+inputs.get("birthday")[0], 
					inputs.get("telefront")[0]+inputs.get("teleback")[0], 
					inputs.get("email")[0], inputs.get("city")[0]))) {
				result = dao.clubJoin(inputs.get("id")[0], inputs.get("club")[0]);
			}
			
			if(result){
				dao.setCommit();
			}
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		String page = "results/joinError.jsp";
		if(result){
			page = "results/joinOK.jsp";
		}
		
		return page;
	}

}

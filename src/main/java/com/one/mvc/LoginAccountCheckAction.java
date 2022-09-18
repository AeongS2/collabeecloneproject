package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.LoginAccountCheckDao;

public class LoginAccountCheckAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		LoginAccountCheckDao lACDao = new LoginAccountCheckDao();
		int result = lACDao.LoginAccountCheck(email, pw);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {	 //로그인 성공
			obj.put("result", "1");
		}else {	//로그인 실패
			obj.put("result", "0");
		}
		out.println(obj);
		
	}

}

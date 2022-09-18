package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.SignUpCheckEmailDao;

public class SignUpCheckEmailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SignUpCheckEmailDao sd = new SignUpCheckEmailDao();
		int result = sd.checkEmail(request.getParameter("email"));
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {	//일치하는 이메일있음
			obj.put("result", "1");
		}else {	//일치하는 이메일 없음
			obj.put("result", "0");
		}
		out.println(obj);
		
		
	}

}

package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.SignUpMakeCertDao;
import com.jm.dao.SignUpSendEmailDao;

public class SignUpSendEmailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SignUpMakeCertDao  sc = new SignUpMakeCertDao();
		
		String email = request.getParameter("email");
		int cert = sc.SignUpMakeCert();
		
		SignUpSendEmailDao su = new SignUpSendEmailDao();
		su.signUpSendEmail(email, cert);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		
		obj.put("cert", cert);

		out.println(obj);
	}

}

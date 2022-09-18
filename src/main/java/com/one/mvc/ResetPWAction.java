package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.ResetPWDao;
import com.jm.dao.SignUpCheckEmailDao;
import com.jm.dao.SignUpMakeCertDao;

public class ResetPWAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		//가입된 이메일인지 확인
		SignUpCheckEmailDao cDao = new SignUpCheckEmailDao();
		int result = cDao.checkEmail(email);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {	//가입됨
			SignUpMakeCertDao sMCDao = new SignUpMakeCertDao();
			int cert = sMCDao.SignUpMakeCert();
			ResetPWDao rDao = new ResetPWDao();
			rDao.resetPWSendEmail(email, cert);
			obj.put("result", "1");
			obj.put("cert", cert);
			out.println(obj);
		}else {	//가입안됨
			obj.put("result", "0");
			out.println(obj);
		}
		
	}

}

package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.jm.dao.GetMemberIdDao;
import com.jm.dao.SignUpKakaoDao;

public class SignUpKakaoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String kakao_id  = request.getParameter("email");
		String name = request.getParameter("name");
		String picture = request.getParameter("picture");
		
		SignUpKakaoDao sKDao = new SignUpKakaoDao();
		int result = sKDao.SignUpKakao(kakao_id, name, picture);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {	//가입완료
			obj.put("result", "1");
		}else {	//가입실패
			obj.put("result", "0");
		}
		out.println(obj);
	}

}

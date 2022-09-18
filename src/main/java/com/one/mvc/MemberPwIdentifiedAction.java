package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.MemberIdentifiedDao;

public class MemberPwIdentifiedAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		String pw = request.getParameter("password");
		System.out.println(pw);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		MemberIdentifiedDao dao = new MemberIdentifiedDao();
		String memberPw = dao.MemberPwIdentified(member_id);
		System.out.println(memberPw);
		if(pw.equals(memberPw)) {
			obj.put("result",1);
		} else {
			obj.put("result",0);
		}
		out.print(obj);
	}
}

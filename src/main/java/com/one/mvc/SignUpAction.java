package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jm.dao.GetMemberIdDao;
import com.jm.dao.SignUpDao;

public class SignUpAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		int cert = Integer.parseInt(request.getParameter("cert"));
		String name = request.getParameter("name");
		
		SignUpDao su = new SignUpDao();
		su.signUp(email, pw, cert, name);
		
		System.out.println("회원가입 완료");
		
		GetMemberIdDao gM = new GetMemberIdDao();
		int member_id = gM.GetMemberId(email);
		System.out.println(member_id);
		
		HttpSession session = request.getSession();
		session.setAttribute("member_id", member_id);
		response.sendRedirect("homehome.jsp");
		//request.getRequestDispatcher("0CollabeeHome.jsp").forward(request, response);
	}
	
}

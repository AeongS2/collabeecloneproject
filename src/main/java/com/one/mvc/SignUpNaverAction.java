package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jm.dao.GetMemberIdDao;
import com.jm.dao.SignUpNaverDao;

public class SignUpNaverAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		
		SignUpNaverDao sNDao = new SignUpNaverDao();
		sNDao.SignUpNaver(email, name);
		
		System.out.println("네아로 회원가입 완료");
		
		request.getRequestDispatcher("Controller?command=LoginCheck").forward(request, response);
		
		
	}

}

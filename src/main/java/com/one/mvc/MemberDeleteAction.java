package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.OptionDao;

public class MemberDeleteAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// member_id 값 받아오기
		//String memberId = String.valueOf(request.getAttribute("member_id"));
		//int member_id = Integer.parseInt(memberId);
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 10;
		OptionDao oDao = new OptionDao();
		oDao.setMemberOut(member_id);
		request.getRequestDispatcher("0main.jsp").forward(request, response); //메인페이지로 보내기
	}
}

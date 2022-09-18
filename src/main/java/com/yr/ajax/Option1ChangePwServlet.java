package com.yr.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.OptionDao;

@WebServlet("/Option1ChangePwServlet")
public class Option1ChangePwServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Pw = request.getParameter("newPassword");
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		OptionDao oDao = new OptionDao();
		oDao.setPw(Pw, member_id);
	}

}

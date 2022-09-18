package com.yr.ajax;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.OptionDao;

/**
 * Servlet implementation class Option1ChangeNameServlet
 */
@WebServlet("/Option1ChangeNameServlet")
public class Option1ChangeNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
		String name = request.getParameter("name");
		OptionDao oDao = new OptionDao();
		oDao.setName(name, member_id);
		//System.out.println("hello");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

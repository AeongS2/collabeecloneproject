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
 * Servlet implementation class Option1ChangeDeparmentServlet
 */
@WebServlet("/Option1ChangeJobServlet")
public class Option1ChangeJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
		String task = request.getParameter("task");
		OptionDao oDao = new OptionDao();
		oDao.setTask(task, member_id);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

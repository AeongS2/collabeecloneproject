package com.ta.Ajax;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ta.dao.PartnerDao;

@WebServlet("/ChattingRoomInviteServlet")
public class ChattingRoomInviteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search");
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		PartnerDao pDao = new PartnerDao();
		
	}
}

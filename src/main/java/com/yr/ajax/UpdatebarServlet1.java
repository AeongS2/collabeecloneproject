package com.yr.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.DBConnection;
import com.yr.dao.UpdatebarDao;

@WebServlet("/UpdatebarServlet1")
public class UpdatebarServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int news_id = Integer.parseInt(request.getParameter("newsId"));
		UpdatebarDao uDao = new UpdatebarDao();
		try {
			uDao.deleteNews(news_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

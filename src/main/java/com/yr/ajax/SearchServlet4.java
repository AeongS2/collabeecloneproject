package com.yr.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.yr.dao.DBConnection;
import com.yr.dao.SearchDao;
import com.yr.dto.SearchScheduleDto;

@WebServlet("/SearchServlet4")
public class SearchServlet4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("searchSchedule");
		int member_id = Integer.parseInt(request.getParameter("login_id"));
		SearchDao sDao = new SearchDao();
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchScheduleDto> list = null;
		try {
			if(word.length()>0)
				list = sDao.searchSchedule(word, member_id);
			else
				list = new ArrayList<SearchScheduleDto>();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter(); 
		JSONArray array = new JSONArray();
		for(SearchScheduleDto dto : list) {
			JSONObject obj = new JSONObject();   // "JSONObject" ---> json-simple
			obj.put("date",dto.getDate());
			obj.put("title",dto.getTitle());
			obj.put("color",dto.getColor());
			obj.put("name",dto.getName());
			obj.put("schedule_id",dto.getSchedule_id());
			obj.put("count",dto.getCount());
			array.add(obj);
		}
		out.println(array);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}

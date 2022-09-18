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
import com.yr.dto.SearchTodoDto;

@WebServlet("/SearchServlet3")
public class SearchServlet3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("searchTodo");
		int member_id = Integer.parseInt(request.getParameter("login_id"));
		SearchDao sDao = new SearchDao();
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchTodoDto> list = null;
		try {
			if(word.length()>0)
				list = sDao.searchTodo(word, member_id);
			else
				list = new ArrayList<SearchTodoDto>();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter(); 
		JSONArray array = new JSONArray();
		for(SearchTodoDto dto : list) {
			JSONObject obj = new JSONObject();   // "JSONObject" ---> json-simple
			obj.put("todo_cur_p",dto.getTodo_cur_p());
			obj.put("content",dto.getContent());
			obj.put("start_date",dto.getStart_date());
			obj.put("finish_date",dto.getFinish_date());
			obj.put("workspace_name",dto.getWorkspace_name());
			obj.put("title",dto.getTitle());
			obj.put("name",dto.getName());
			obj.put("todo_id",dto.getTodo_id());
			obj.put("workspace_id",dto.getWorkspace_id());
			obj.put("document_id",dto.getDocument_id());
			obj.put("name2",dto.getName2());
			array.add(obj);
		}
		out.println(array);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

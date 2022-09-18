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
import com.yr.dto.SearchDocumentDto;

@WebServlet("/SearchServlet1")
public class SearchServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("searchDocument");
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		SearchDao sDao = new SearchDao();
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchDocumentDto> list = null;
		try {
			if(word.length()>0)
				list = sDao.searchDocument(word, member_id);
			else
				list = new ArrayList<SearchDocumentDto>();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter(); 
		JSONArray array = new JSONArray();
		for(SearchDocumentDto dto : list) {
			JSONObject obj = new JSONObject();   // "JSONObject" ---> json-simple
			obj.put("title",dto.getTitle());
			obj.put("workspace_name",dto.getWorkspace_name());
			obj.put("name",dto.getName());
			obj.put("edit_date",dto.getEdit_date());
			obj.put("workspace_id",dto.getWorkspace_id());
			obj.put("document_id",dto.getDocument_id());
			array.add(obj);
		}
		out.println(array);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

package com.one.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.DraftsPostsDao;
import com.one.dto.DraftsPostsDto;


@WebServlet("/DraftsPostsServlet")
public class DraftsPostsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("memberId"));
		ArrayList<DraftsPostsDto> list = new ArrayList<DraftsPostsDto>();
		try {
			DraftsPostsDao dao = new DraftsPostsDao();
			list = dao.drafts_List(member_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(DraftsPostsDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("kanban_icon_p", dto.getK_icon_p());
			obj.put("document_id", dto.getDocument_id());
			obj.put("title", dto.getTitle());
			obj.put("content", dto.getContent());
			obj.put("date", dto.getEdit_date());
			obj.put("workspace_name", dto.getWorkspace_name());
			obj.put("Workspace_id", dto.getWorkspace_id());
			array.add(obj);
		}
		out.print(array);
	}

}

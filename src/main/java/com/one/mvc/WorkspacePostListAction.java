package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.WorkspacePostListDao;
import com.one.dto.WorkspacePostListDto;

public class WorkspacePostListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		
		WorkspacePostListDao dao = new WorkspacePostListDao();
		ArrayList<WorkspacePostListDto> list = dao.getDocument_List(workspace_id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(WorkspacePostListDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("name", dto.getName());
			obj.put("kanban_icon_p", dto.getKanban_icon_p());
			obj.put("title",dto.getTitle());
			obj.put("creation_date" ,dto.getCreation_date());
			obj.put("edit_date", dto.getEdit_date());
			obj.put("document_id", dto.getDocument_id());
			array.add(obj);
		}
		out.print(array);
	}
}

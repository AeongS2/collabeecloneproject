package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.WorkspaceFindManagerDao;
import com.one.dto.WorkspaceFindManagerDto;

public class WorkspaceFindManagerAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		
		WorkspaceFindManagerDao dao = new WorkspaceFindManagerDao();
		ArrayList<WorkspaceFindManagerDto> list = dao.findManager(workspace_id);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(WorkspaceFindManagerDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("member_id", dto.getMember_id());
			obj.put("private_fl", dto.getPrivate_fl());
			array.add(obj);
		}
		out.print(array);
	}

}

package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.KanbanDelDao;

public class KanbanDelAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kanban_id = request.getParameter("kanban_id");
		
		KanbanDelDao kd = new KanbanDelDao();
		int check = kd.kanbanDelete(kanban_id);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(check==0) {
			obj.put("check", "0");
		}else {
			obj.put("check", "1");
		}
		
		out.println(obj);
		
	}

}

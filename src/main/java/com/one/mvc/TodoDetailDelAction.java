package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.TodoDetailDelDao;

public class TodoDetailDelAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int toto_id = Integer.parseInt(request.getParameter("todo_id"));
		
		TodoDetailDelDao tDDDao = new TodoDetailDelDao();
		int result = tDDDao.TodoDetailDel(toto_id);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result >= 2) {
			obj.put("result", "1");
		}else {
			obj.put("result", "0");
		}
		out.println(obj);
	}

}

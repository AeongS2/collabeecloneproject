package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.TodoCurSelectorDao;

public class TodoCurSelectorAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		
		int todo_id = Integer.parseInt(request.getParameter("todo_id"));
		String todo_cur_id_str = request.getParameter("todo_cur_id_str");
		
		TodoCurSelectorDao tCSDao = new TodoCurSelectorDao();
		int result = tCSDao.TodoCurSelector(todo_cur_id_str, todo_id);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {
			obj.put("result", "OKAY");
		}else {
			obj.put("result", "FAIL");
		}
		out.println(obj);
		
	}

}

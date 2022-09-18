package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.TodoUpdateDao;

public class TodoDetailEditAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int todo_id = Integer.parseInt(request.getParameter("todo_id"));
		String content = request.getParameter("content");
		String start_date = request.getParameter("start_date");
		String finish_date = request.getParameter("finish_date");
		String des = request.getParameter("des");
		
		TodoUpdateDao tUDao = new TodoUpdateDao();
		tUDao.todoUpdate(todo_id, content, start_date, finish_date, des);
		
	}

}

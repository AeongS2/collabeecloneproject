package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.TodoListDao;
import com.jm.dao.TodoListWidgetDao;
import com.jm.dto.TodoListDto;

public class TodoAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int member_id = 1;
		
		TodoListDao tDao = new TodoListDao();
		ArrayList<TodoListDto> tDtoList = tDao.todoMyList(member_id); 
		
		TodoListWidgetDao todoW = new TodoListWidgetDao();
		ArrayList<TodoListDto> todoListW = todoW.todoWidgetFinish(member_id);
		
		request.setAttribute("tDtoList", tDtoList);
		request.setAttribute("todoListW", todoListW);
		request.getRequestDispatcher("Todo.jsp").forward(request, response);
	}

}

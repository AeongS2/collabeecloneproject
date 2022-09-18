package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.TodoInsertDao;
import com.jm.dao.TodoPicListDao;

public class TodoInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int member_id = 1;
		
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		String content = request.getParameter("content");
		String start_date = (String)request.getParameter("todo_startd");
		String finish_date = (String)request.getParameter("todo_finishd");
		String todo_des = (String)request.getParameter("todo_des");
		String pic = request.getParameter("assign_member_id");
		
		System.out.println(pic);
		TodoPicListDao tPDao = new TodoPicListDao();
		ArrayList<Integer> pic_list = tPDao.TodoPicList(pic, member_id);
		
		TodoInsertDao tIDao = new TodoInsertDao();
		tIDao.insertTODO(workspace_id, content, member_id, start_date, finish_date, todo_des, "null", pic_list);
		System.out.println("할일추가됨");
		
		//request.getRequestDispatcher("Controller?command=Todo").forward(request, response);
		response.sendRedirect("Controller?command=Todo");
	}

}

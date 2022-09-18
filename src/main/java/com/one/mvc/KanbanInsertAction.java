package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanInsertDao;

public class KanbanInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int workspace_id = Integer.parseInt( request.getParameter("workspace_id") );
		String kanban_name = request.getParameter("kanban_name");
		int kanban_icon_id = Integer.parseInt(request.getParameter("kanban_icon_id"));
		
		KanbanInsertDao kIDao = new KanbanInsertDao();
		kIDao.kanbanInsert(workspace_id, kanban_name, kanban_icon_id);
		
		//request.getRequestDispatcher("Controller?command=KanbanList").forward(request, response);
		response.sendRedirect("Controller?command=KanbanList");
	}

}

package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanOrderUpdateDao;

public class KanbanOrderUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int index = Integer.parseInt(request.getParameter("index"));
		String kanban_id = request.getParameter("kanban_id");
		
		KanbanOrderUpdateDao kOUpdate = new KanbanOrderUpdateDao();
		kOUpdate.kanbanOrderUpdate(index, kanban_id);
		
	}

}

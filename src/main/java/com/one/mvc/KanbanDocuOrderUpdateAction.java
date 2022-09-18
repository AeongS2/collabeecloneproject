package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanDocuOrderUpdateDao;

public class KanbanDocuOrderUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int index = Integer.parseInt( request.getParameter("index") );
		String kanban_id = request.getParameter("kanban_id");
		int document_id = Integer.parseInt( request.getParameter("document_id") );
		
		KanbanDocuOrderUpdateDao kdo = new KanbanDocuOrderUpdateDao();
		kdo.kanbanDocuOrderUpdate(index, kanban_id, document_id);
		
	}

}

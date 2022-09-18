package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.GetKanbanIdDao;
import com.jm.dao.KanbanSelectorChangeDao;

public class KanbanNewDocuAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		int document_id = Integer.parseInt(request.getParameter("document_id"));
		
		GetKanbanIdDao gKIDao = new GetKanbanIdDao();
		String kanban_id = gKIDao.GetKanbanId(workspace_id);
		
		KanbanSelectorChangeDao kSCDao = new KanbanSelectorChangeDao();
		kSCDao.KanbanSelectorChange(kanban_id, document_id);
		
		System.out.println("새 문서 칸반에 집어넣음");
	}

}

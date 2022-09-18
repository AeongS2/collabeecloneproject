package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanSelectorChangeDIdDao;
import com.jm.dao.KanbanSelectorChangeDao;
import com.jm.dao.KanbanSelectorChangeExDao;
import com.jm.dao.KanbanSelectorChangeExDao1;

public class KanbanSelectorChangeAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String kanban_id = request.getParameter("kanban_id").trim();
		int document_id = -1;
		
		String bookmark_id_str = request.getParameter("bookmark_id");
		int bookmark_id=-1;
		
		if(bookmark_id_str != null) {
			bookmark_id = Integer.parseInt(bookmark_id_str);
			KanbanSelectorChangeDIdDao kSCD = new KanbanSelectorChangeDIdDao();
			document_id = kSCD.KanbanSelectorChangeDId(bookmark_id);
		}else {
			document_id = Integer.parseInt(request.getParameter("document_id"));
		}
		
		System.out.println(kanban_id);
		System.out.println(document_id);
		
		KanbanSelectorChangeExDao1 kSECDao1 = new KanbanSelectorChangeExDao1();
		String exKanban_id = kSECDao1.KanbanSelectorChangeEx1(document_id);
		
		KanbanSelectorChangeDao kSCDao = new KanbanSelectorChangeDao();
		kSCDao.KanbanSelectorChange(kanban_id, document_id);
		
		KanbanSelectorChangeExDao kSCEDao = new KanbanSelectorChangeExDao();
		kSCEDao.KanbanSelectorChangeEx(exKanban_id);
		
		System.out.println("칸반 변경됨");
		
	}

}

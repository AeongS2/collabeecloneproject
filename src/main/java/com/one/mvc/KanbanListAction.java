package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanIconListDao;
import com.jm.dao.KanbanListDao;
import com.jm.dto.KanbanIconListDto;
import com.jm.dto.KanbanListDto;

public class KanbanListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		
		// int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		
		KanbanListDao kDao = new KanbanListDao();
		ArrayList<KanbanListDto> kList = kDao.kanbanList(8);
		
		KanbanIconListDao kIDao = new KanbanIconListDao();
		ArrayList<KanbanIconListDto> kIList = kIDao.KanbanIconList();
		
		request.setAttribute("kList", kList);
		request.setAttribute("kIList", kIList);
		request.getRequestDispatcher("Kanban.jsp").forward(request, response); 
		
	}

}

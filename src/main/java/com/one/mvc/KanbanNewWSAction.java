package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.KanbanNewWSDao;

public class KanbanNewWSAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 협업공간 생성시 자동으로 발의됨, 진행중, 일시중지, 완료 칸반 생성
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		
		KanbanNewWSDao kNDao = new KanbanNewWSDao();
		kNDao.newKanban(workspace_id);
		
		// 생성된 협업공간 페이지로 가기
	}

}

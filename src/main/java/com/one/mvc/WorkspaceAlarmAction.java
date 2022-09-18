package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collabee.jh.dao.WorkspaceAlarmDao;

public class WorkspaceAlarmAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		int onAlarm = Integer.parseInt(request.getParameter("onAlarm"));
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		
		WorkspaceAlarmDao dao = new WorkspaceAlarmDao();
		dao.setWorkspace_Alarm(onAlarm, member_id, workspace_id);
		
		request.getRequestDispatcher("newCollabee/workspace_index.jsp").forward(request, response);
	}

}

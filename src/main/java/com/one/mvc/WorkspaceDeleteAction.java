package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import collabee.jh.dao.WorkspaceDeleteDao;

public class WorkspaceDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		
		WorkspaceDeleteDao dao = new WorkspaceDeleteDao();
		dao.delWorkspace_1(workspace_id);
		
	}

}

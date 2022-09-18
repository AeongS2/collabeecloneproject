package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.NewsInsertDao;
import com.one.dao.WorkspaceUpdateInfoDao;

public class WorkspaceUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String workspace_name = request.getParameter("workspace_name");
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		
		WorkspaceUpdateInfoDao dao = new WorkspaceUpdateInfoDao();
		dao.setWorkspace_Name(workspace_id, title);
		dao.setWorkspace_Summary(summary, workspace_id);
		
		NewsInsertDao.setNews(member_id, workspace_name + " 협업공간이 " + title + " 협업공간으로 이름이 변경되었습니다.");
		
	}
}

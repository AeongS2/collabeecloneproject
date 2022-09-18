package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.WorkspaceUpdateInfo2Dao;

import collabee.jh.dao.NewsInsertDao;

public class WorkspaceUpdate2Action implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		WorkspaceUpdateInfo2Dao dao = new WorkspaceUpdateInfo2Dao();
		int result = 0;
		if(request.getParameter("confidential")==null) {
			result = dao.setWorkspace_Complete(Integer.parseInt(request.getParameter("complete")), workspace_id);
			//NewsInsertDao.setNews(member_id, workspace_name + " 협업공간이 " + title + " 협업공간으로 이름이 변경되었습니다.");
		} else if(request.getParameter("complete")==null){
			result = dao.setWorkspace_Confidential(Integer.parseInt(request.getParameter("confidential")), workspace_id);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("result", result);
		out.print(obj);
	}
}

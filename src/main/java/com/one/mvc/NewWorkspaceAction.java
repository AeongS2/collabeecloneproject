package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.NewWorkspaceDao;
import com.one.dto.NewWorkspaceDto;

public class NewWorkspaceAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String invite_url = "http://localhost:9090/WebProject1/workspace_index.jsp?workspaceId=&workspaceName="+title;
		String summary = request.getParameter("summary");
		/* String color = request.getParameter("color1"); */
		int loginId = 4;//Integer.parseInt(request.getParameter("loginId"));
		
		NewWorkspaceDao dao = new NewWorkspaceDao();
		int workspace_id= 0;
		int result3=0;
		int result = dao.setWorkspace(new NewWorkspaceDto(title, "#888888", summary, invite_url, loginId));
		if(result == 1) {
			workspace_id = dao.getNewWorkspace_id(title);
			if(workspace_id != 0) {
				result3 = dao.setWorkspaceMember(loginId, workspace_id);
					
			}
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		if(result3==1) {
			obj.put("result", "1"); 
			obj.put("workspaceId", workspace_id);
			obj.put("workspace_name", title);
		} else { 
			obj.put("result", "0"); 
		} 
		
		out.println(obj);
		
	}

}

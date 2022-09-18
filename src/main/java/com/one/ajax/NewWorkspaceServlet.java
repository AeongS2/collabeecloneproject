package com.one.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.NewWorkspaceDao;
import com.one.dto.NewWorkspaceDto;


@WebServlet("/NewWorkspaceServlet")
public class NewWorkspaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
		String invite_url = request.getParameter("invite_url1");
		String summary = request.getParameter("summary");
		String color = request.getParameter("color1");
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		
		NewWorkspaceDao dao = new NewWorkspaceDao();
		int workspace_id=0;
		int result3=0;
		int result = dao.setWorkspace(new NewWorkspaceDto(title, color, summary, invite_url, loginId));
		if(result == 1) {
			workspace_id = dao.getNewWorkspace_id(title);
			if(workspace_id != 0) {
				int result2 = dao.connectWorkspace(loginId, workspace_id);
				if(result2 == 1) {
					result3 = dao.setWorkspaceMember(loginId, workspace_id);
					
				}
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
		} else { obj.put("result", "0"); } 
		
		out.println(obj);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}

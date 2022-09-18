package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.WorkspaceManagerEtcDao;

public class WorkspaceManagerEtcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("manage 들어옴");
		String text = request.getParameter("text");
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		int member_id = Integer.parseInt(request.getParameter("memberId"));
		
		WorkspaceManagerEtcDao dao = new WorkspaceManagerEtcDao();
		switch(text) {
		case "관리자 선정" :
			dao.workspacePickManager(1, workspace_id, member_id);
			break;
		case "관리자 권한 해제" :
			dao.workspacePickManager(0, workspace_id, member_id);
			break;
		case "멤버 탈퇴" :
			dao.workspaceDelMember(workspace_id, member_id);
			break;
		}
		
	}
}

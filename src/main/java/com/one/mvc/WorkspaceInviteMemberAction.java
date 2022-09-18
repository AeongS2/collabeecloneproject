package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.WorkspaceInviteMemberDao;
import com.one.dto.WorkspaceInviteMemberDto;

public class WorkspaceInviteMemberAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("inviteAction 들어옴");
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		String inviteMember = request.getParameter("inviteMember");
		String[] list = inviteMember.split("_"); 
		
		WorkspaceInviteMemberDao dao = new WorkspaceInviteMemberDao();
		for(int i = 0; i < 2; i++) {
			dao.partner_invite(workspace_id, 7);
		}
		
		
		
	}

}

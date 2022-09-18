package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.ModalWorkspaceListDao;
import com.one.dto.ModalWorkspaceListDto;

public class SelWorkspaceListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//HttpSession session = request.getSession(); 
		//int member_id = (Integer)session.getAttribute("loginJH");
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		
		
		ModalWorkspaceListDao mWDao = new ModalWorkspaceListDao();
		ArrayList<ModalWorkspaceListDto> mWList = mWDao.workspaceList(member_id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(ModalWorkspaceListDto dto : mWList) {
			JSONObject obj = new JSONObject();
			obj.put("workspace_id", dto.getWorkspace_id());
			obj.put("workspace_name", dto.getWorkspace_name());
			array.add(obj);
		}	
		out.print(array);
	}

}

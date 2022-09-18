package com.one.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import collabee.jh.dao.MyWorkspaceListDao;
import collabee.jh.dto.MyWorkspaceListDto;


@WebServlet("/WorkspaceIndexServlet")
public class WorkspaceIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hi");
		ArrayList<MyWorkspaceListDto> list = null;
		String workspace_name = request.getParameter("workspace_name");
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		try{
			MyWorkspaceListDao dao = new MyWorkspaceListDao();
			list = dao.getMyWorkspace_List(member_id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(MyWorkspaceListDto dto : list) {
			JSONObject obj = new JSONObject();
			if(workspace_id == dto.getWorkspace_id()) {
				obj.put("summary", dto.getSummary());
				obj.put("invite_url", dto.getInvite_url());
				obj.put("complete", dto.getComplete());
				obj.put("date", dto.getCreation_date());
				array.add(obj);
			} 
		}
		out.println(array);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}

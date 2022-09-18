package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import collabee.jh.dao.MyPostDao;
import collabee.jh.dto.MyPostDto;

public class MyPostAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MyPostDto> list = null;
		try {
			int loginId = Integer.parseInt(request.getParameter("loginId"));
			
			MyPostDao dao = new MyPostDao();
			list = dao.getMyPost(1, loginId);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(MyPostDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("kanban_icon_p", dto.getKanban_icon_p());
			obj.put("title", dto.getTitle());
			obj.put("workspace_name", dto.getWorkspace_name());
			obj.put("date", dto.getDate());
			array.add(obj);
		}
		out.println(array);//writer로 그려주기
		
		
		
		
	}

}

package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.MyCommentsDao;
import com.one.dto.MyCommentsDto;

public class MyCmtAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MyCommentsDto> list = null;
			int loginId = Integer.parseInt(request.getParameter("loginId"));
			
			MyCommentsDao ddao = new MyCommentsDao();//사용하기위한 걍 객체
			list = ddao.getMyComments(loginId);
		
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");//인코딩
			PrintWriter out = response.getWriter();
			
			JSONArray array = new JSONArray();//arrayList를 풀어서 JSONArray에 담아주기
			for(MyCommentsDto dto : list) {//자바스크립트는 json만 알아듣기 때문!!
				JSONObject obj = new JSONObject();
				obj.put("content", dto.getContent());
				obj.put("creation_date", dto.getCreation_date());
				obj.put("title", dto.getTitle());
				obj.put("workspace_name", dto.getWorkspace_name());
				array.add(obj);
			}
			out.println(array);
			System.out.println(array);
	}

}

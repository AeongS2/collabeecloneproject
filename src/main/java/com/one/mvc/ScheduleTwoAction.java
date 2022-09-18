package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.MyWorkspaceScheduleDao;
import com.one.dto.MyScheduleDto;

public class ScheduleTwoAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		ArrayList<MyScheduleDto> list = new ArrayList<MyScheduleDto>();
		
		MyWorkspaceScheduleDao dao = new MyWorkspaceScheduleDao();
		list = dao.getCalender(workspace_id);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(MyScheduleDto dto : list) {
			JSONObject obj = new JSONObject();
			obj.put("scheduleId", dto.getSchedule_id());
			obj.put("start_date", dto.getStart_date());
			obj.put("finish_date", dto.getFinish_date());
			obj.put("title", dto.getTitle());
			obj.put("member_id", dto.getMember_id());//작성자
			array.add(obj);
		}
		out.print(array);
	}

}

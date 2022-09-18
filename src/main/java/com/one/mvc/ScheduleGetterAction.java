package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.GetScheduleDao;
import com.one.dto.ScheduleDto;

public class ScheduleGetterAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("scheduleGetterAction 들어옴");
		int schedule_id = Integer.parseInt(request.getParameter("scheduleId"));
		
		GetScheduleDao dao = new GetScheduleDao();
		ArrayList<ScheduleDto> list = dao.getSchedule(schedule_id);
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();

		JSONObject obj = new JSONObject();
		for(ScheduleDto dto : list) {
			obj.put("writerId", dto.getWriter_id());
			obj.put("title", dto.getTitle());
			obj.put("content", dto.getContent());
			String start = dto.getStart_date().split("\\s+")[0].replace("-",".");
			String end = dto.getFinish_date().split("\\s+")[0].replace("-", ".");
			obj.put("startDate", start);
			obj.put("finishDate", end);
			obj.put("locations", dto.getLocations());
			obj.put("attendee", dao.getAttendeeList(schedule_id));
		}
		out.print(obj);
	}
}

package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ScheduleUpdateDao;

public class ScheduleUpdateAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int schedule_id = Integer.parseInt(request.getParameter("scheduleId"));
		String attendee = request.getParameter("attendee");
		ArrayList<String> list = new ArrayList<String>();
		list.add(request.getParameter("title"));
		list.add(request.getParameter("summary"));
		list.add(request.getParameter("startDate"));
		list.add(request.getParameter("finishdate"));
		list.add(request.getParameter("locations"));
		
		ScheduleUpdateDao dao = new ScheduleUpdateDao();
		dao.updateSchedule(schedule_id, list);
		
		dao.updateScheduleAttnedee(schedule_id, attendee);
		
	}

}

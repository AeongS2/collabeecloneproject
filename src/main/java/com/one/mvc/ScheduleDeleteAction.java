package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ScheduleDelDao;

public class ScheduleDeleteAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int schedule_id = Integer.parseInt(request.getParameter("scheduleId"));
		
		ScheduleDelDao dao = new ScheduleDelDao();
		dao.delSchedule(schedule_id);
		
	}
}

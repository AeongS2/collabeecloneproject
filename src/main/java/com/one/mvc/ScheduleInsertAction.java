package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.ScheduleSaveDao;

public class ScheduleInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int writer_id = Integer.parseInt(request.getParameter("writerId"));
		String title = request.getParameter("title");
		String start_date = request.getParameter("start_date");
		String finish_date = request.getParameter("finish_date");
		String locations = request.getParameter("locations");
		String content = request.getParameter("summary");
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));

		try {
			ScheduleSaveDao dao = new ScheduleSaveDao();
			dao.setSchedule(workspace_id, writer_id, title, content, locations, start_date, finish_date);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}

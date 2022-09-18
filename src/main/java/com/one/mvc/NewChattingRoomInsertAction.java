package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.NewChattingRoomInsertDao;

public class NewChattingRoomInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int member_id = 1;
		String nc_list = request.getParameter("list");
		NewChattingRoomInsertDao nCRDao = new NewChattingRoomInsertDao();
		int nc_id = nCRDao.NewChattingRoomInsert(nc_list, member_id);
		
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		

		obj.put("nc_id", nc_id);

		out.println(obj);
		
	}

}

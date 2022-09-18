package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.BookmarkDelDao;

public class BookmarkDelAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bookmark_id = Integer.parseInt(request.getParameter("bookmark_id"));
		
		BookmarkDelDao bDDao = new BookmarkDelDao();
		int result = bDDao.BookmarkDel(bookmark_id);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result==1) {
			obj.put("result", "1");
		}else {
			obj.put("result", "0");
		}
		out.println(obj);
		
	}

}

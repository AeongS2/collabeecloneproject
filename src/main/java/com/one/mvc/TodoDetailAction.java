package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jm.dao.TodoDetailDao;
import com.jm.dto.TodoDetailDto;

public class TodoDetailAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		
		int todo_id = Integer.parseInt(request.getParameter("todo_id"));
		
		TodoDetailDao tDDao = new TodoDetailDao();
		TodoDetailDto tDto = tDDao.TodoDetailList(todo_id);
		
		String todo_cur_p = tDto.getTodo_cur_p();
		String content = tDto.getContent();
		String start_date = tDto.getStart_date();
		String finish_date = tDto.getFinish_date();
		String des = tDto.getDes();
		String writer_p = tDto.getWriter_p();
		String writer_name = tDto.getWriter_name();
		String pic_p = tDto.getPic_p();
		String pic_name = tDto.getPic_name();
		

		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();

		obj.put("todo_cur_p", todo_cur_p);
		obj.put("content", content);
		obj.put("start_date", start_date);
		obj.put("finish_date", finish_date);
		obj.put("des", des);
		obj.put("writer_p", writer_p);
		obj.put("writer_name", writer_name);
		obj.put("pic_p", pic_p);
		obj.put("pic_name", pic_name);
		out.println(obj);
		
	}
	
}

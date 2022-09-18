package com.ta.Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.ta.dao.ChattingDao;
import com.ta.dto.ChattingMessageFileDto;

@WebServlet("/ChattingFileMessageServlet")
public class ChattingFileMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int file_id = Integer.parseInt(request.getParameter("fileId"));
		ChattingDao cDao = new ChattingDao();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		ArrayList<ChattingMessageFileDto> list = cDao.getChattingMessageFile(file_id);
		JSONObject obj = new JSONObject();
		for(ChattingMessageFileDto dto : list) {
			obj.put("file_name",dto.getFile_name());
			obj.put("picture",dto.getPicture());
		}
		
		out.print(obj);
	}
}

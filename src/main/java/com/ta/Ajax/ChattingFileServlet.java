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

import com.ta.dao.FileDao;
import com.ta.dto.ChattingRoomFileDto;

@WebServlet("/ChattingFileServlet")
public class ChattingFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int chatting_room_id = Integer.parseInt(request.getParameter("chatting_room_id"));
		FileDao fDao = new FileDao();
		JSONArray array = new JSONArray();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		ArrayList<ChattingRoomFileDto> list = fDao.getChattingRoomFile(chatting_room_id);
		for(ChattingRoomFileDto chattingFiles :list) {
			JSONObject obj = new JSONObject();
			obj.put("file_id",chattingFiles.getFile_id());
			obj.put("file_name",chattingFiles.getFile_name());
			obj.put("file_date",chattingFiles.getFile_date());
			obj.put("picture",chattingFiles.getPicture());
			obj.put("name",chattingFiles.getName());
			obj.put("file_picture",chattingFiles.getFile_picture());
			array.add(obj);
		}
		out.print(array);
	}
}

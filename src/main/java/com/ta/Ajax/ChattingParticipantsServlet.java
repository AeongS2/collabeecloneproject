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
import com.ta.dto.ChattingParticipantsDto;

@WebServlet("/ChattingParticipantsServlet")
public class ChattingParticipantsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int chattingRoomId = Integer.parseInt(request.getParameter("chatting_room_id"));
		JSONArray array = new JSONArray();
		ChattingDao cDao = new ChattingDao();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		int countP = cDao.getCountChattingParticipants(chattingRoomId);
		JSONObject obj1 = new JSONObject();
		obj1.put("countParticipants",countP);
		array.add(obj1);
		
		ArrayList<ChattingParticipantsDto> list = cDao.getChattingParticipants(chattingRoomId);
		for(ChattingParticipantsDto chattingParticipants : list) {
			JSONObject obj = new JSONObject();
			obj.put("name",chattingParticipants.getName());
			obj.put("picture",chattingParticipants.getPicture());
			array.add(obj);
		}
		out.print(array);
	}
}

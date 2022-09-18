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
import com.ta.dto.ChattingContentsDto;
import com.ta.dto.ChattingDto;

@WebServlet("/ChattingMessageServlet")
public class ChattingMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int loginId = Integer.parseInt(request.getParameter("loginId"));
		int chatting_room_id = Integer.parseInt(request.getParameter("chatting_room_id"));
		JSONArray array = new JSONArray();
		ChattingDao cDao = new ChattingDao();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		ArrayList<ChattingDto> list1 = cDao.getChattingRoomName(chatting_room_id); // 이거아님
		JSONArray chattingRoomName = new JSONArray();
		for(ChattingDto dto : list1) {
			JSONObject obj2 = new JSONObject();
			obj2.put("chatting_room_id",dto.getChatting_room_id());
			obj2.put("chatting_room_name",dto.getChatting_name());
			chattingRoomName.add(obj2);
		}
		array.add(chattingRoomName);

		ArrayList<ChattingContentsDto> list = cDao.getChattingContents(chatting_room_id);
		JSONArray chattingContents = new JSONArray();
		for(ChattingContentsDto dto : list) {
			JSONObject obj1 = new JSONObject();
				obj1.put("message_id",dto.getMessage_id());
				obj1.put("picture",dto.getPicture());
				obj1.put("name",dto.getName());
				obj1.put("message",dto.getMessage());
				obj1.put("send_time",dto.getSend_time());
				obj1.put("file_id",dto.getFile_id());
				obj1.put("link_id",dto.getLink_id());
				chattingContents.add(obj1);
		}
		array.add(chattingContents);
		
//		int count = cDao.getCountChattingParticipants(chatting_room_id); 
//		JSONObject countParticipant = null;
//		chattingRoomName.put("countParticipant", count);
//		array.add(countParticipant);
//		
//		ArrayList<ChattingParticipantsDto> list = new ArrayList<ChattingParticipantsDto>();
//		list = cDao.getChattingParticipants(chatting_room_id);
//		JSONArray chattingParticipant = new JSONArray();
//		for(ChattingParticipantsDto dto : list) {
//			JSONObject obj1 = new JSONObject();
//			obj1.put("name",dto.getName());
//			obj1.put("picture",dto.getPicture());
//			chattingParticipant.add(obj1);
//		}
//		array.add(chattingParticipant);
		out.print(array);
	}
}

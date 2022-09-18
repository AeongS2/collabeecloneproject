package com.ta.Ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.ta.dao.ChattingDao;
import com.ta.dto.ChattingParticipantsDto;

@WebServlet("/ChattingInviteMemberServlet")
public class ChattingInviteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String member_id2 = request.getParameter("member_id");
		PrintWriter out = response.getWriter();
		ChattingDao cDao = new ChattingDao();
		JSONObject obj = new JSONObject();
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		int chatting_room_id = Integer.parseInt(request.getParameter("chatting_room_id"));
		response.setContentType("application/json");
		if(cDao.checkInviteMemberRedundancy(chatting_room_id, member_id)) {
			if(cDao.inviteMemberToChattingRoom(chatting_room_id, member_id)) {
				obj.put("count",cDao.getCountChattingParticipants(chatting_room_id));
				
				ArrayList<ChattingParticipantsDto> list = cDao.getInviteChattingMemver(member_id);
				for(ChattingParticipantsDto dto : list) {
					obj.put("picture",dto.getPicture());
					obj.put("name",dto.getName());
				}
			}
		} else {
			obj.put("name",null);
		}
		System.out.println(obj);
		out.print(obj);
	}
}

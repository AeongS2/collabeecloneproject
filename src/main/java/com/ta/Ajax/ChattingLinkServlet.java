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

import com.ta.dao.LinkDao;
import com.ta.dto.ChattingRoomLinkDto;

@WebServlet("/ChattingLinkServlet")
public class ChattingLinkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int chatting_room_id = Integer.parseInt(request.getParameter("chatting_room_id"));
		LinkDao fDao = new LinkDao();
		JSONArray array = new JSONArray();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		ArrayList<ChattingRoomLinkDto> list = fDao.getChattingRoomLink(chatting_room_id);
		for(ChattingRoomLinkDto chattingLinks :list) {
			JSONObject obj = new JSONObject();
			obj.put("link_id",chattingLinks.getLink_id());
			obj.put("link_name",chattingLinks.getLink_name());
			obj.put("link_date",chattingLinks.getLink_date());
			obj.put("link_title",chattingLinks.getLink_title());
			obj.put("link_explanation",chattingLinks.getLink_explanation());
			obj.put("picture",chattingLinks.getPicture());
			obj.put("name",chattingLinks.getName());
			obj.put("link_picture",chattingLinks.getLink_picture());
			array.add(obj);
		}
		out.print(array);
	}
}

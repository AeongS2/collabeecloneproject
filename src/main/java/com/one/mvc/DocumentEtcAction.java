package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.DocumentEtcDao;

public class DocumentEtcAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		int member_id = 4;//Integer.parseInt(request.getParameter("loginId"));
		
		DocumentEtcDao dao = new DocumentEtcDao();
		int alarm = dao.getDocumentAlarm(document_id, member_id);
		int bookmark = dao.getDocumentBookmark(document_id, member_id);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject obj = new JSONObject();
		obj.put("alarm", alarm);
		obj.put("bookmark", bookmark);
		out.print(obj);
	}
}

package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.DocumentShowDao;
import com.one.dto.DocumentShowDto;

public class DocumentDetailAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		try {
			DocumentShowDao dao = new DocumentShowDao();
			ArrayList<DocumentShowDto> list = dao.showDocument(document_id);
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			JSONObject obj = new JSONObject();
			for(DocumentShowDto dto : list) {
				obj.put("title", dto.getTitle());
				obj.put("content", dto.getContent());
				obj.put("workspace_name", dto.getWorkspace_name());
				obj.put("pic", dto.getPic());
			}
			out.print(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.DocumentDelDao;

public class DocumentDelAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int documentId = Integer.parseInt(request.getParameter("documentId"));
		
		DocumentDelDao dao = new DocumentDelDao();
		dao.delDocument(documentId);
		
		
		
	}

}

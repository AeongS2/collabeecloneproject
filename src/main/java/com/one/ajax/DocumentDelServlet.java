package com.one.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import collabee.jh.dao.DelDraftsDocumentDao;
import collabee.jh.dao.DocumentIdRtDao;

@WebServlet("/DocumentDelServlet")
public class DocumentDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("del 들어옴");
		int member_id = Integer.parseInt(request.getParameter("memberId"));
		int drafts = Integer.parseInt(request.getParameter("drafts"));
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		boolean result=false;
		try {
			/*
			 * DocumentIdRtDao rdao = new DocumentIdRtDao(); int document_id =
			 * rdao.getDocument_id(drafts, member_id);
			 *///문서id뽑고
			
			DelDraftsDocumentDao ddao = new DelDraftsDocumentDao();
				result = ddao.delDrafts(document_id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		
		if(result) {
			obj.put("IsDel", true);//성공
		} else {
			obj.put("IsDel", false);//실패
		}
		out.print(obj);
	}

}

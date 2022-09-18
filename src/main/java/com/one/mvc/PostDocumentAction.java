package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.one.dao.DocumentIdRtDao;
import com.one.dao.DocumentPostDao;

public class PostDocumentAction implements Action{ //문서작성클릭

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		try {
			DocumentPostDao dao = new DocumentPostDao();//문서작성클릭, 임시저장
			DocumentIdRtDao rdao = new DocumentIdRtDao();//문서id
			dao.setDocument(member_id, workspace_id);
			int document_id = rdao.getDocument_id(workspace_id, member_id); //rt 메서드는 문제없는디
			System.out.println("문서id : "+document_id);			
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/json"); 
			PrintWriter out = response.getWriter();
			
 			JSONObject obj = new JSONObject(); 
 			obj.put("document_id", document_id);
			out.print(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		 * request.setAttribute("document_id", document_id);//문서id저장. 임시저장리스트에 attr
		 * request.getRequestDispatcher("../Document.jsp?documentId=document_id");
		 */
		//저장하고 끝? 다른데 안가도 되나?
		
	}

}

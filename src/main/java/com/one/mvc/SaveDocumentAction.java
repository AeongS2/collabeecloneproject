package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.one.dao.DocumentSaveDao;

public class SaveDocumentAction implements Action{//문서 저장

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int member_id = 4;//Integer.parseInt(request.getParameter("loginId"));
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		int document_id = Integer.parseInt(request.getParameter("documentId"));
		
		//content = content.replaceAll("Editor.js", "EDITOR.YG");//문서 수정
		//System.out.println("content : " + content);

		//String time = "";
		//JSONArray blocks = new JSONArray();//String으로 받은 data jsonArray로 만듬
		try {
			DocumentSaveDao dao = new DocumentSaveDao();
			dao.saveDocument(title, content, document_id, workspace_id);
			dao.setFixed_Comment(member_id, document_id, "새 문서 작성");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		/*
		 * try {
		 * 		JSONParser parser = new JSONParser();//parsing:분석 
		 * 		JSONObject jsonObj = (JSONObject)parser.parse( content );//형변환 
		 * 		time = jsonObj.get("time") + ""; //String.valueOf(34) ----> "34" 
		 * 		blocks = (JSONArray)jsonObj.get("blocks"); 
		 * }catch(Exception e) { e.printStackTrace(); }
		 * 
		 * response.setContentType("application/json"); 
		 * JSONObject objRet = new JSONObject(); 
		 * objRet.put("new_content",content);
		 * 
		 * PrintWriter out = response.getWriter(); out.println(objRet);
		 */
		
/*//parsing하기
System.out.println("So, time = " + time);
System.out.println("blocks(JSONArray) = " + blocks.toString());
for(int i=0; i<=blocks.size()-1; i++) {
	System.out.println("[" + i + "] : ");
	JSONObject obj = (JSONObject)blocks.get(i);
	JSONObject data = (JSONObject)obj.get("data");
	String id = (String)obj.get("id");
	String type = (String)obj.get("type");
	System.out.println("\tdata = " + data);
	System.out.println("\tid = " + id);
	System.out.println("\ttype = " + type);
}
*/

//		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
//		int member_id = Integer.parseInt(request.getParameter("loginId"));
//		int document_id = Integer.parseInt(request.getParameter("document_id"));
		
	
		
		//request.getRequestDispatcher("Controller?command=page_postedDocument").forward(request, response);
		
		
		
	}

}

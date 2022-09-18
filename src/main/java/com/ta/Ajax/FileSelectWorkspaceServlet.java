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

import com.ta.dao.FileDao;
import com.ta.dto.FileDto;
import com.ta.dto.RecentlyImgOrFileDto;

@WebServlet("/FileSelectWorkspaceServlet")
public class FileSelectWorkspaceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		int login_id = Integer.parseInt(request.getParameter("login_id"));
		FileDao fDao = new FileDao();
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		JSONArray array = new JSONArray();
		JSONObject obj = null;
		if(workspace_id == 0) {
			ArrayList<FileDto> list = fDao.getAllWorkspaceTotalFile(login_id);
			JSONArray AllWorkspaceTotalFile = new JSONArray();
			for(FileDto dto : list) {
				obj = new JSONObject();
				obj.put("picture",dto.getPicture());
				obj.put("file_id",dto.getFile_id());
				obj.put("workspace_name",dto.getWorkspace_name());
				obj.put("file_name",dto.getFile_name());
				AllWorkspaceTotalFile.add(obj);
			}
			array.add(AllWorkspaceTotalFile);
			ArrayList<RecentlyImgOrFileDto> list1 = fDao.getAllWorkspaceRecentlyImg(login_id);
			JSONArray AllWorkspaceRecentlyImg = new JSONArray();
			for(RecentlyImgOrFileDto dto : list1) {
				obj.put("file_id",dto.getFile_id());
				obj.put("file_name",dto.getFile_name());
				AllWorkspaceRecentlyImg.add(obj);
			}
			array.add(AllWorkspaceRecentlyImg);
			
			ArrayList<RecentlyImgOrFileDto> list2 = fDao.getAllWorkspaceRecentlyFile(login_id);
			JSONArray AllWorkspaceRecentlyFile = new JSONArray();
			for(RecentlyImgOrFileDto dto : list2) {
				obj.put("file_id",dto.getFile_id());
				obj.put("file_name",dto.getFile_name());
				AllWorkspaceRecentlyFile.add(obj);
			}
			array.add(AllWorkspaceRecentlyFile);
		} else {
			ArrayList<FileDto> list = fDao.getSelectWorkspaceTotalFile(workspace_id);
			JSONArray SelectWorkspaceTotalFile = new JSONArray();
			for(FileDto dto : list) {
				obj = new JSONObject();
				obj.put("picture",dto.getPicture());
				obj.put("file_id",dto.getFile_id());
				obj.put("workspace_name",dto.getWorkspace_name());
				obj.put("file_name",dto.getFile_name());
				SelectWorkspaceTotalFile.add(obj);
			}
			array.add(SelectWorkspaceTotalFile);
			
			ArrayList<RecentlyImgOrFileDto> list1 = fDao.getSelectWorkspaceRecentlyImg(workspace_id);
			JSONArray SelectWorkspaceRecentlyImg = new JSONArray();
			for(RecentlyImgOrFileDto dto : list1) {
				obj.put("file_id",dto.getFile_id());
				obj.put("file_name",dto.getFile_name());
				SelectWorkspaceRecentlyImg.add(obj);
			}
			array.add(SelectWorkspaceRecentlyImg);
			
			ArrayList<RecentlyImgOrFileDto> list2 = fDao.getSelectWorkspaceRecentlyFile(workspace_id);
			JSONArray SelectWorkspaceRecentlyFile = new JSONArray();
			for(RecentlyImgOrFileDto dto : list2) {
				obj.put("file_id",dto.getFile_id());
				obj.put("file_name",dto.getFile_name());
				SelectWorkspaceRecentlyFile.add(obj);
			}
			array.add(SelectWorkspaceRecentlyFile);
		}
		System.out.println(array);
		out.print(array);
	}
}

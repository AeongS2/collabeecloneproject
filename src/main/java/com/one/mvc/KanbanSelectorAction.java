package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jm.dao.BookmarkKanbanSelectorWIdDao;
import com.jm.dao.KanbanSelectorDao;
import com.jm.dto.KanbanSelectorDto;

public class KanbanSelectorAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String bookmark_id_str = request.getParameter("bookmark_id");
		int workspace_id=-1;
		int bookmark_id=-1;
		
		if(bookmark_id_str != null) {
			bookmark_id = Integer.parseInt(bookmark_id_str);
			BookmarkKanbanSelectorWIdDao bKSWDao = new BookmarkKanbanSelectorWIdDao();
			workspace_id = bKSWDao.BookmarkKanbanSelectorWId(bookmark_id);
		}else {
			workspace_id = Integer.parseInt(request.getParameter("workspace_id"));
		}
		
		KanbanSelectorDao kSDao = new KanbanSelectorDao();
		ArrayList<KanbanSelectorDto> kanbanSelectorList = kSDao.KanbanSelector(workspace_id);
		
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray arrayList = new JSONArray();
		for(KanbanSelectorDto dto : kanbanSelectorList ) {
			JSONObject obj = new JSONObject();
			obj.put("kanban_id", dto.getKanban_id());
			obj.put("kanban_icon_p", dto.getKanban_icon_p());
			obj.put("kanban_name", dto.getKanban_name());
			arrayList.add(obj);
		}
		
		out.println(arrayList);
		
	}
	
}

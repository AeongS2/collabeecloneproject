package com.one.mvc;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.BookmarkInsertDao;

public class BookmarkInsertAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int member_id = Integer.parseInt(request.getParameter("member_id"));
		int document_id = Integer.parseInt(request.getParameter("document_id"));
		
		BookmarkInsertDao bIDao = new BookmarkInsertDao();
		bIDao.bookmarkInsert(member_id, document_id);
		
		System.out.println("북마크 추가됨!");
		
		//해당 문서로 다시 돌아가기
		
	}

}

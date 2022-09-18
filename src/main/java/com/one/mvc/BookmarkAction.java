package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.BookmarkDao;
import com.jm.dto.BookmarkDto;

public class BookmarkAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BookmarkDao bDao = new BookmarkDao();
		ArrayList<BookmarkDto> bList = bDao.bookmarkList(1);
//		System.out.println("BookmarkAction에서 bList : " + bList);
		request.setAttribute("bList", bList);
		request.getRequestDispatcher("bookmark2.jsp").forward(request, response);
		
	}
	
	
}

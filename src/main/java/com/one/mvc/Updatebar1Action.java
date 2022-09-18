package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.HomeDao;
import com.yr.dao.UpdatebarDao;
import com.yr.dto.NewsDto;
import com.yr.dto.NoneFolderDto;
import com.yr.dto.IssueDto;
public class Updatebar1Action implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		HomeDao hDao = new HomeDao();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
		String name = "";
		UpdatebarDao uDao = new UpdatebarDao();
		ArrayList<NoneFolderDto> listNone = null;
		ArrayList<NewsDto> list = null;
		ArrayList<IssueDto> list2 = null;
		int partnerN = 0;
		String picture = null;
		try {
			list = uDao.getNews (member_id);
			list2 = uDao.getIssueUpdate (member_id);
			listNone = hDao.getHomeWorkspace(member_id);
			//밑에꺼 2개 바뀔때마다 계속 뽑아야함
			partnerN = hDao.getCountPartner(member_id);
			name = hDao.showName(member_id);
			picture = hDao.showPicture(member_id);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(picture != null) {
			if(!picture.startsWith("http"))
				picture = "image/upload/" + picture;
			request.setAttribute("picture", picture);
		}
		request.setAttribute("list3", listNone);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("name", name);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.getRequestDispatcher("0updatebar1.jsp").forward(request, response);
	}

}

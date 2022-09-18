package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.HomeDao;
import com.yr.dto.HomeRecentDto;
import com.yr.dto.NoneFolderDto;

public class HomeRecentAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HomeDao hDao = new HomeDao();
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 2;
		ArrayList<HomeRecentDto> listRecent = null;
		ArrayList<NoneFolderDto> listNone = null;
		String name = "";
		String email = "";
		String corName = "";
		int partnerN = 0;
		int corporation_id = 0;
		//int cor_manager = 0;
		String picture = "";
		try {
			listRecent = hDao.getRecent_Connection(member_id);
			listNone = hDao.getHomeWorkspace(member_id);
			name = hDao.showName(member_id);
			email = hDao.showEmail(member_id);
			partnerN = hDao.getCountPartner(member_id);
			corName = hDao.showCorName(member_id);
			corporation_id = hDao.gotCorporation(member_id);
			//System.out.println(corporation_id);
			//cor_manager = hDao.gotManager(1);
			picture = hDao.showPicture(member_id);
			//System.out.println(cor_manager);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.setAttribute("corporation_id", corporation_id);
		request.setAttribute("corName", corName);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("list", listRecent);
		request.setAttribute("list2", listNone);
		request.setAttribute("picture", picture);
		request.getRequestDispatcher("0CollabeeHome.jsp").forward(request, response);
	}

}

package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yr.dao.HomeDao;
import com.yr.dao.OptionDao;
import com.yr.dto.NoneFolderDto;
public class Option1Action implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// member_id 받아오기
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
		
		HomeDao hDao = new HomeDao();
		String name = "";
		String email = "";
		String corName = "";
		String picture = null;
		ArrayList<NoneFolderDto> listNone = null;
		int partnerN = 0;
		int corporation_id = 0;
		OptionDao oDao = new OptionDao();
		String p = "";
		String team = "";
		String task = "";
		String Pw = null;
		try {
			name = hDao.showName(member_id);
			email = hDao.showEmail(member_id);
			partnerN = hDao.getCountPartner(member_id);
			corName = hDao.showCorName(member_id);
			picture = hDao.showPicture(member_id);
			listNone = hDao.getHomeWorkspace(member_id);
			p = oDao.showPhoneNum(member_id);
			team = oDao.showTeam(member_id);
			task = oDao.showTask(member_id);
			corporation_id = hDao.gotCorporation(member_id);
			Pw = oDao.showPw(member_id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//System.out.println(picture);
		if(picture != null) {
			if(!picture.startsWith("http"))
				picture = "image/upload/" + picture;
			request.setAttribute("picture", picture);
		}
		request.setAttribute("list2", listNone);
		request.setAttribute("corName", corName);
		request.setAttribute("Pw", Pw);
		request.setAttribute("partnerN", partnerN);
		request.setAttribute("email", email);
		request.setAttribute("name", name);
		request.setAttribute("phoneNum", p);
		request.setAttribute("team", team);
		request.setAttribute("task", task);
		request.setAttribute("corporation_id", corporation_id);
		request.getRequestDispatcher("0option1.jsp").forward(request, response);
	}
}

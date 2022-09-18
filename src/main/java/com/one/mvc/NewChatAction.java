package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.PartnerListDao;
import com.jm.dto.PartnerListDto;

public class NewChatAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int member_id = 1;
		
		PartnerListDao pLDao = new PartnerListDao();
		ArrayList<PartnerListDto> pL = pLDao.partnerList(member_id);
		pL.remove(0);
		
		request.setAttribute("pL", pL);
		request.getRequestDispatcher("chattingRoom.jsp").forward(request, response);
		
		
	}

}

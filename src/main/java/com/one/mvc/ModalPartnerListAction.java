package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.PartnerListDao;
import com.jm.dto.PartnerListDto;

public class ModalPartnerListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		int member_id = 1;
		
		PartnerListDao pLDao = new PartnerListDao();
		ArrayList<PartnerListDto> pL = pLDao.partnerList(member_id);
		
		System.out.println(pL);
		System.out.println("파트너");
		
		request.setAttribute("pL", pL);
		request.getRequestDispatcher("Controller?command=ModalWorkspaceList").forward(request, response);
		
	}

}

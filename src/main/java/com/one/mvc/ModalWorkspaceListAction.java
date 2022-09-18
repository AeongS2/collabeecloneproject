package com.one.mvc;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jm.dao.ModalWorkspaceListDao;
import com.jm.dto.ModalWorkspaceListDto;

public class ModalWorkspaceListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * HttpSession session = request.getSession(); int member_id =
		 * (Integer)session.getAttribute("member_id");
		 */
		
		ModalWorkspaceListDao mWDao = new ModalWorkspaceListDao();
		ArrayList<ModalWorkspaceListDto> mWList = mWDao.workspaceList(1);
		
		request.setAttribute("mWList", mWList);
		request.getRequestDispatcher("Todo_modal.jsp").forward(request, response);
		
	}

}

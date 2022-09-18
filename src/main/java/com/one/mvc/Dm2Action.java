package com.one.mvc;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yr.dao.DmDao;
import com.yr.dto.DmBarDto;
import com.yr.dto.IncludingDto;

public class Dm2Action implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession(); 
		 * int member_id = (Integer)session.getAttribute("member_id");
		 */
		int member_id = 4;
		String picture = null;
		String writer_picture = null;
		DmDao dDao2 = new DmDao();
		ArrayList<IncludingDto> list1 = new ArrayList<IncludingDto>();
		try {
			ArrayList<Integer> arr = dDao2.decisionMakingBar(member_id);
			picture = dDao2.myPicture(member_id);
			for(int i = 0; i<=arr.size()-1; i++) { // i가 decision_making_id
				int document_id = dDao2.whowrote1(arr.get(i));
				int writer_id = dDao2.whowrote2(document_id);
				writer_picture = dDao2.myPicture(writer_id);
				if(writer_picture != null) {
					if(!writer_picture.startsWith("http"));
						writer_picture = "image/upload/" + picture;
				}
				ArrayList<DmBarDto> listDm = dDao2.getDecisionList(arr.get(i));
				list1.add(new IncludingDto(document_id, writer_id, writer_picture, listDm));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		//ModalWorkspaceListDao mWDao = new ModalWorkspaceListDao();
		//ArrayList<ModalWorkspaceListDto> mWList = mWDao.workspaceList(member_id);
		/*
		 * if(picture != null) { if(!picture.startsWith("http")) picture =
		 * "image/upload/" + picture; request.setAttribute("picture", picture); }
		 */
		request.setAttribute("list", list1);
		//request.setAttribute("mWList", mWList);
		request.getRequestDispatcher("0dm2.jsp").forward(request, response);
	}

}

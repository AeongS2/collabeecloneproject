package com.yr.ajax;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;

import com.yr.dao.HomeDao;

@WebServlet("/WorkspaceOrderServlet")
public class WorkspaceOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		//int member_id = (Integer)session.getAttribute("member_id");
		int member_id = 4;
//		System.out.println("i got this");
//		JSONArray jarr = new JSONArray();
//		jarr = new JSONArray(request.getParameter("array"));
		String[] arr = request.getParameterValues("main");
		System.out.println(Arrays.toString(arr));
		int[] arr2 = new int[arr.length];
		for(int i = 0; i<=arr.length-1; i++) {
			int j = Integer.parseInt(arr[i]);
			arr2[i] = j;
		}
		System.out.println(Arrays.toString(arr2));
		HomeDao hDao = new HomeDao();
		hDao.deleteWorkspaceOrder(member_id);
		for(int i = 0; i<=arr2.length-1; i++) {
			try {
				hDao.updateWorkspaceOrder(i+1, member_id, arr2[i]);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}

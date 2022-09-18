package com.one.mvc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.one.dao.MyMemberListDao;
import com.one.dto.MemberInfoDto;
import com.ta.dao.PartnerDao;
import com.ta.dto.PartnerDto;

public class WorkspaceInviteListAction implements Action{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int member_id = Integer.parseInt(request.getParameter("loginId"));
		
		int workspace_id = Integer.parseInt(request.getParameter("workspaceId"));
		
		PartnerDao pdao = new PartnerDao();
		ArrayList<PartnerDto> pList = pdao.getPartner(member_id);//파트너 리스트 뽑기
		
		MyMemberListDao mdao = new MyMemberListDao();
		ArrayList<MemberInfoDto> mList = mdao.getWorkspace_MemberList(8);
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONArray array = new JSONArray();
		for(int i = 0; i <= mList.size()-1; i++) {//파트너 멤버 id중에
			JSONObject obj = new JSONObject();
			int member = mList.get(i).getMember_id();
			
			for(int j = 0; j <= pList.size()-1; j++) {//이미 공간멤버 id면 저장 안함
				int partner = pList.get(j).getMember_id();
				if(partner==member) {
					break;
				} else {
					//id 외의 다른항목 저장
					obj.put("memberId", partner);
					obj.put("email", pList.get(j).getEmail());
					obj.put("name", pList.get(j).getName());
					obj.put("picture", pList.get(j).getPicture());
					array.add(obj);
				}
			}
			continue;
		}
		out.print(array);
		
	}
}

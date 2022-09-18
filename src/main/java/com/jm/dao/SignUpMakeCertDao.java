package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class SignUpMakeCertDao {
	
	// 인증번호리스트
	ArrayList<Integer> certificationList() {
		Connection conn = DBConnection.getConnection();
		
		ArrayList<Integer> arr = new ArrayList<Integer>();
		String cert_list = "SELECT certification FROM member";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(cert_list);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int certification = rs.getInt("certification");
				arr.add(certification);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return arr;
	}
	
	public int SignUpMakeCert(){
		
		Connection conn = DBConnection.getConnection();
		Random rnd = new Random();
		
		ArrayList<Integer> cert_list = certificationList();

		int n_cert = 0;
		nc : while(true) {
			int cnt = 0;
			n_cert = rnd.nextInt(9000) + 1000;
			
			for(int i = 0; i<cert_list.size(); i++) {
				if(cert_list.get(i) == n_cert) {
					//중복된 인증번호 발생
					cnt++;
				}
			}
			
			if(cnt==0) {	// 올바른 인증번호 발생
				break nc;
			}else {
				continue;
			}
		}
		
		return n_cert;
		
	}
	
}

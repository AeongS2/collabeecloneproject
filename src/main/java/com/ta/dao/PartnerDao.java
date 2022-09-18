package com.ta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.ta.dto.InvitePartnerInformationDto;
import com.ta.dto.InvitePartnerListDto;
import com.ta.dto.PartnerDto;

public class PartnerDao {
	ArrayList<String> inviteMailList = new ArrayList<String>();
	// 회사 가입 여부
	public boolean CompanyCheck(int loginId) {
		int countCorporationId = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String sql ="SELECT COUNT(corporation_id) AS corporation_id FROM member WHERE member_id = ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,loginId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				countCorporationId = rs.getInt("corporation_id");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(countCorporationId==0) {
			return false;			
		} else {
			return true;
		}
	}
	// 채팅 파트너 초대 -> 파트너 인지 확인 
	public boolean PartnerCheck(int loginId, String search) {
		int count = 0;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT email FROM member WHERE member_id IN(SELECT DISTINCT my_partner FROM partner WHERE member_id = ?) AND email Like ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, search);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(count==0) {
			return false;
		} else {
			return true;
		}
	}
	// 회사동료
	public ArrayList<PartnerDto> getCompanyColleague(int loginId) {
		ArrayList<PartnerDto> list = new ArrayList<PartnerDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "SELECT member_id,email, name, picture FROM member WHERE corporation_id = (SELECT corporation_id FROM member WHERE member_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				int member_id = rs.getInt("member_id");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				PartnerDto dto = new PartnerDto(member_id,email, name, picture);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 회사동료수
	public int getCountCompanyColleague(int loginId) {
		Connection conn = DBConnection.getConnection();
		int countCompanyColleague = 0;
		try {
			String sql = "SELECT COUNT(email) AS email FROM member WHERE corporation_id = (SELECT corporation_id FROM member WHERE member_id = ?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				countCompanyColleague = rs.getInt("email");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return countCompanyColleague;
	}
	// 외부협업자
	public ArrayList<PartnerDto> getExternalPartner(int loginId) {
		ArrayList<PartnerDto> list = new ArrayList<PartnerDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "SELECT member_id,email, name, picture " + 
					"FROM member " + 
					"WHERE member_id " + 
					"IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N' AND my_partner IS NOT NULL) " + 
					"AND (corporation_id " + 
					"NOT IN (SELECT corporation_id FROM member WHERE member_id = ?) " + 
					"OR corporation_id IS NULL)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				int member_id = rs.getInt("member_id");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				PartnerDto dto = new PartnerDto(member_id,email, name, picture);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 외부협업자 수
	public int getCountExternalPartner(int loginId) {
		Connection conn = DBConnection.getConnection();
		int countExternalPartner = 0;
		try {
			String sql = "SELECT COUNT(email) AS email " + 
					"FROM member " + 
					"WHERE member_id " + 
					"IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N' AND my_partner IS NOT NULL) " + 
					"AND (corporation_id " + 
					"NOT IN (SELECT corporation_id FROM member WHERE member_id = ?) " + 
					"OR corporation_id IS NULL) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				countExternalPartner = rs.getInt("email");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return countExternalPartner;
	}
	// 파트너
	public ArrayList<PartnerDto> getPartner(int loginId) {
		ArrayList<PartnerDto> list = new ArrayList<PartnerDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "SELECT member_id, email, name, picture " + 
					"FROM member " + 
					"WHERE member_id " + 
					"IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N' AND my_partner IS NOT NULL)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int member_id = rs.getInt("member_id");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				PartnerDto dto = new PartnerDto(member_id,email, name, picture);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 파트너 수
	public int getCountPartne(int loginId) {
		Connection conn = DBConnection.getConnection();
		int countPartner = 0;
		try {
			String sql = "SELECT COUNT(email) AS email " + 
					"FROM member " + 
					"WHERE member_id " + 
					"IN (SELECT my_partner FROM partner WHERE member_id = 1 AND hide_partner = 'N' AND my_partner IS NOT NULL)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) { 
				countPartner = rs.getInt("email");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return countPartner;
	}
	// 초대리스트 + 중복체크
	public ArrayList<String> getInviteList(String inviteMail){
		if(inviteMailList.contains(inviteMail)==false) {
			inviteMailList.add(inviteMail);
		}
		return inviteMailList;
	}
	// 초대
	public void setInvitePartner(int loginId, String inviteMail) {
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try {
			for(int j=0; j<=inviteMailList.size()-1; j++) {
				String sql = "INSERT INTO partner(partner_id, member_id, invite_mail) VALUES(partner_id.nextval, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, loginId); 
				pstmt.setString(2, inviteMailList.get(j));
				pstmt.executeUpdate();
			}
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		for(int i=0; i<=inviteMailList.size()-1; i++) inviteMailList.remove(i);		
	}
	public void inviteAgree(int loginId, int inviteId) {
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE partner SET my_partner = ?, invite_mail = null, agree = 'Y' WHERE member_id = ? AND invite_mail = (SELECT email FROM member WHERE member_id = ?)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, inviteId);
			pstmt.setInt(3, loginId);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public void inviteRefuse (int loginId, int inviteId) { // 파트너 초대 거절
		PreparedStatement pstmt = null;
		try {
			String sql = "DELETE FROM partner WHERE member_id = ? AND invite_mail = (SELECT email FROM member WHERE member_id = ?)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inviteId);
			pstmt.setInt(2, loginId);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public void insertInvite (int loginId, int partner_id) { // 파트너 초대 취소
		PreparedStatement pstmt = null;
		try {
			String sql = "DELETE FROM partner WHERE partner_id = ? ";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, partner_id);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public ArrayList<InvitePartnerListDto> inviteMember(int loginId, String nameOrEmail) { // 초대할 멤버들(회사동료 + 외부협력자)
		ArrayList<InvitePartnerListDto> list = new ArrayList<InvitePartnerListDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT member_id, email, name, picture " + 
					"FROM member " + 
					"WHERE (member_id " + 
					"IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N' AND my_partner IS NOT NULL ) " + 
					"OR corporation_id " + 
					"IN (SELECT corporation_id FROM member WHERE member_id = ?)) " + 
					"AND member_id != ? " +
					"AND name LIKE '%?%' " +
					"OR email LIKE '%?%' ";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			for(int i=1; i<=5; i++) {
				pstmt.setInt(i, loginId);
				if(i>=4) {
					pstmt.setString(i, nameOrEmail);
				}
			}
			rs = pstmt.executeQuery();
			while(rs.next()) { // 초대한 파트너 메일 목록 (회원인 사람)
				int member_id = rs.getInt("member_id");
				String email = rs.getString("email");
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				list.add(new InvitePartnerListDto(member_id,email,name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// 초대한 메일들
	public ArrayList<InvitePartnerInformationDto> getInvitePartnerInformation(int loginId){
		ArrayList<InvitePartnerInformationDto> list = new ArrayList<InvitePartnerInformationDto>();
		try {
			
			String sql = "SELECT partner_id, invite_mail FROM partner WHERE member_id = ? AND invite_mail IS NOT NULL " + 
					"AND invite_mail NOT IN (" + 
					"SELECT email " + 
					"FROM member m " + 
					"WHERE email IN (SELECT invite_mail FROM partner WHERE member_id = ? AND invite_mail IS NOT NULL)) " + 
					"ORDER BY partner_id DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 초대한 파트너 메일 목록 (회원이 아닌사람)
				int partner_id = rs.getInt("partner_id");
				String invite_mail = rs.getString("invite_mail");
				list.add(new InvitePartnerInformationDto(partner_id,invite_mail));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 초대한 메일 수
	public int getCountInvitePartnerInformation(int loginId){
		int CountInvitePartnerInformation = 0;
		try {
			String sql = "SELECT COUNT(partner_id) AS partner_id FROM partner WHERE member_id = ? AND invite_mail IS NOT NULL " + 
					"AND invite_mail NOT IN (" + 
					"SELECT email " + 
					"FROM member m " + 
					"WHERE email IN (SELECT invite_mail FROM partner WHERE member_id = ? AND invite_mail IS NOT NULL)) " + 
					"ORDER BY partner_id DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 초대한 파트너 메일 목록 (회원이 아닌사람)
				CountInvitePartnerInformation = rs.getInt("partner_id");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return CountInvitePartnerInformation;
	}
	// 나를 초대한 사람 정보
	public ArrayList<PartnerDto> getInviteMeInformation(int loginId){
		ArrayList<PartnerDto> list = new ArrayList<PartnerDto>();
		try {
			String sql = "SELECT member_id, picture, email, name " + 
					"FROM member " + 
					"WHERE member_id IN (SELECT member_id FROM partner WHERE invite_mail = (SELECT email FROM member WHERE member_id = ?))";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 나를 초대한 사람정보
				int member_id = rs.getInt("member_id");
				String picture = rs.getString("picture");
				String email = rs.getString("email");
				String name = rs.getString("name");
				list.add(new PartnerDto(member_id, email, name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 나를 초대한 사람 정보 수
	public int getCountInviteMeInformation(int loginId){
		int countInviteMeInformation=0;
		try {
			String sql = "SELECT COUNT(email) AS email " + 
					"FROM member " + 
					"WHERE member_id IN (SELECT member_id FROM partner WHERE invite_mail = (SELECT email FROM member WHERE member_id = ?))";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 나를 초대한 사람정보
				countInviteMeInformation = rs.getInt("email");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return countInviteMeInformation;
	}
	public int getCountAlarm(int loginId) {
		int countInvitePartnerInformation = getCountInvitePartnerInformation(loginId); 
		int countInviteMeInformation= getCountInviteMeInformation(loginId);
		return countInvitePartnerInformation + countInviteMeInformation;
	}
	public void SendMail(String inviteMail) {
		String host = "smtp.naver.com";
		final String user = "rkdxodks1@naver.com";
		final String password = "rkdxodks1@";

		String to = "taean0321@gmail.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
	
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		try {
			MimeMessage message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(user));
		    message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
	
			message.setSubject("콜라비");
			message.setText("콜라비로 초대합니다.");
	
			Transport.send(message);
			System.out.println("message sent successfully...");
	
		} catch (MessagingException e) {
			   e.printStackTrace();
		}
	 }
}

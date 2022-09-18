package com.yr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yr.dto.SearchCommentsDto;
import com.yr.dto.SearchDocumentDto;
import com.yr.dto.SearchScheduleDto;
import com.yr.dto.SearchTodoDto;

public class SearchDao {
	//회사, 파트너 목록뽑기 // 혹시 동료초대하기?
	/*public ArrayList<SearchPeopleDto> searchPeople(int member_id) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchPeopleDto> list1 = new ArrayList<SearchPeopleDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{ // 이거 distinct 이렇게 안 되는데ㅋ....다시해야할거다 미래의 유라야
			String sql = "select distinct m.picture, m.name from member m, partner p "
					+ "where m.corporation_id = (select corporation_id from member where member_id = ?) "
					+ "or m.member_id = p.my_partner and p.member_id = ? order by m.name";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			pstmt.setInt(2,member_id);
			rs = pstmt.executeQuery();
			while (rs.next()){
				String picture = rs.getString(1);
				String name = rs.getString(2);
				SearchPeopleDto dto = new SearchPeopleDto(picture, name);
				list1.add(dto);
				System.out.println(picture + name);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}*/
	public String dotdate(String edit_date) throws SQLException {
		String[] arr = edit_date.split(" ");
		String creation = arr[0];
		String date = creation.replace("-", ".");
		return date;
	}
	// 문서검색 // 이거원래 첨쓴date가 기준인데 모든 document에 시작을 안 넣어서 그냥 편집 마지막으로 한 순서대로 뽑음
	public ArrayList<SearchDocumentDto> searchDocument(String searchDocument, int member_id) throws SQLException {
		ArrayList<SearchDocumentDto> list1 = new ArrayList<SearchDocumentDto>();
		Connection conn = DBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "select d.title, w.workspace_name, m.name, "
					+ "to_char(d.edit_date, 'YYYY.fmMM.DD'), w.workspace_id, d.document_id "
					+ "from document d, member m, workspace w "
					+ "where d.workspace_id = w.workspace_id and m.member_id = d.writer_id "
					+ "and lower(d.title) like lower(?) "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "order by d.edit_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%" + searchDocument + "%");
			pstmt.setInt(2,member_id);
			rs = pstmt.executeQuery();
			while (rs.next()){
				String title = rs.getString(1);
				String workspace_name = rs.getString(2);
				String name = rs.getString(3);
				String date = rs.getString(4);
				/*
				 * String[] arr = date.split(" "); String creation = arr[0]; String
				 * creation_date = creation.replace("-", ".");
				 */
				String edit_date = dotdate(date);
				int workspace_id = rs.getInt(5);
				int document_id = rs.getInt(6);
				SearchDocumentDto dto = new SearchDocumentDto(title, workspace_name, name, edit_date, workspace_id, document_id);
				list1.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}
	//<문서필터(공간, 작성자, 정렬1.최신등록순 2.업데이트순)>
	// 공간은 where 뒤에 w.workspace_id in 선택한협업공간id로 고치면 됨
	// 작성자는 where 뒤에 d.writer = 선택한사람id를 붙여주면 됨
	// 정렬1은 그냥 저대로 가면 되고 업데이트 순은 c.content, c.fixed_comment, order by c.creation_date desc를 버리고 
	// select 뒤에d.edit_date를 받고 order by d.edit_date desc를 적는다.
	
	//댓글검색
	public ArrayList<SearchCommentsDto> searchComments(String searchComments, int member_id) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchCommentsDto> list1 = new ArrayList<SearchCommentsDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "select m.picture, m.name, '\"' || c.content || '\"', w.workspace_name, d.title, w.workspace_id, d.document_id, "
					+ " to_char(c.creation_date, 'fmMM\"월\" DD\"일\"') \"creation_date\" "
					+ " from member m, comments c, workspace w, document d "
					+ " where c.comment_writer = m.member_id and w.workspace_id = d.workspace_id "
					+ " and d.document_id = c.document_id and lower(c.content) like lower(?) and c.fixed_comment = 0 "
					+ " and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ " order by c.creation_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%" + searchComments + "%");
			pstmt.setInt(2,member_id);
			rs = pstmt.executeQuery();
			while (rs.next()){
				String picture = rs.getString(1);
				String name = rs.getString(2);
				String content = rs.getString(3);
				String workspace_name = rs.getString(4);
				String title = rs.getString(5);
				int workspace_id = rs.getInt(6);
				int document_id = rs.getInt(7);
				String creation_date = rs.getString(8);
				SearchCommentsDto dto = new SearchCommentsDto(picture, name, content, workspace_name, title, workspace_id, document_id, creation_date);
				list1.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}
	//<댓글검색>(공간, 작성자)
	// 공간은 where 뒤에 w.workspace_id in 선택한협업공간id로 고치면 됨
	// 작성자는 where 뒤에 c.comment_writer = 선택한사람id를 붙여주면 됨
	
	//할일검색 //아 이거 에러가있다 문서에 연결된것만 start_date. finish_date나오고 아닌 건 안 나오는데 그냥 다 나오는 걸로 했다. 근데 나는 다 나오는 게 오히려 나은거같기도?
	public ArrayList<SearchTodoDto> searchTodo(String searchTodo, int member_id) throws SQLException {
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchTodoDto> list1 = new ArrayList<SearchTodoDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "select t.creation_date, tc.todo_cur_p, t.content, "
					+ "to_char(t.start_date, 'fmmm/dd') \"start_date\", "
					+ "to_char(t.finish_date, 'fmmm/dd') \"finish_date\", "
					+ "w.workspace_name, d.title, m.name, t.todo_id, w.workspace_id, d.document_id "
					+ "from todo t, workspace w, todo_cur tc, document d, member m "
					+ "where w.workspace_id = t.workspace_id "
					+ "and tc.todo_cur_id = t.todo_cur_id "
					+ "and t.writer_id = m.member_id "
					+ "and d.document_id(+)= t.document_id "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "and lower(t.content) like lower(?) "
					+ "order by t.creation_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			pstmt.setString(2,"%" + searchTodo + "%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				String creation_date = rs.getString(1);
				String todo_cur_p = rs.getString(2);
				String content = rs.getString(3);
				String start_date = rs.getString(4);
				String finish_date = "~" + rs.getString(5);
				String workspace_name = rs.getString(6);
				String title = rs.getString(7);
				String name = rs.getString(8);
				int todo_id = rs.getInt(9);
				int workspace_id = rs.getInt(10);
				int document_id = rs.getInt(11);
				String name2 = searchPic(todo_id);
				SearchTodoDto dto = new SearchTodoDto(todo_cur_p, content, start_date, finish_date, workspace_name, title, name, todo_id, workspace_id, document_id, name2);
				list1.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}
	//<할일필터>(공간, 요청자, 담당자, 할일상태, 정렬1.최근등록순 2.마감일순3.오래된 순)
	// 공간은 where 뒤에 w.workspace_id in 선택한협업공간id로 고치면 됨
	// 요청자는 where 뒤에  t.writer_id= 선택한사람id를 붙여주면 됨
	// 담당자는 다시 작성해야함? select todo_id from todo_pic where pic = 선택한id 한 다음에
	// select t.creation_date, tc.todo_cur_p, t.content, to_char(t.start_date, 'fmmm/dd') \"start_date\", 
	// to_char(t.finish_date, 'fmmm/dd') \"finish_date\", w.workspace_name, d.title, m.picture
	// from todo t, workspace w, todo_cur tc, document d, member m 
	// and tc.todo_cur_id = t.todo_cur_id and t.writer_id = m.member_id 
	// and d.document_id(+)= t.document_id and t.content like ? order by t.creation_date desc;
	// 할일상태는 원래 sql where뒤에 t.todo_cur_id in (선택한할일id,~,~) 처럼 붙이면 됨
	// 정렬1 최근등록순은 지금꺼 그대로고 마감일순은 order by t.finish_date; 이거고 오래된순은 원래 sql문에서 t.creation_date; 이렇게. 
	
	//todo_pic 1명 뽑음
	public String searchPic(int todo_id)throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String name2 = "";
		try{
			String sql = "select max(name) from (select m.name from member m, todo_pic tp where m.member_id = tp.pic and todo_id = ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name2 = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return name2;
	}
	//일정검색
	public ArrayList<SearchScheduleDto> searchSchedule(String searchSchedule, int member_id) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		ArrayList<SearchScheduleDto> list1 = new ArrayList<SearchScheduleDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try{
			String sql = "select to_char(s.start_date, 'YYYY\"년\" fmmm\"월\" DD\"일\"') || "
					+ "to_char(s.start_date, 'day') || ' ~ ' || "
					+ "to_char(s.finish_date, 'YYYY\"년\" fmmm\"월\" DD\"일\"') || to_char(s.finish_date, 'day') \"짧\", "
					+ "s.title, w.color, m.name, s.schedule_id "
					+ "from schedule s, workspace w, member m "
					+ "where s.writer_id = m.member_id "
					+ "and s.workspace_id = w.workspace_id "
					+ "and lower(s.title) like lower(?) "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "order by s.start_date";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%" + searchSchedule + "%");
			pstmt.setInt(2,member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//System.out.println("here");
				String date = rs.getString(1);
				String title = rs.getString(2);
				String color = rs.getString(3);
				String name = rs.getString(4);
				int schedule_id = rs.getInt(5);
				int count = attendeeCount(schedule_id);
				SearchScheduleDto dto = new SearchScheduleDto(date, title, color, name, schedule_id, count);
				list1.add(dto);
			}		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}
	//<일정필터>(공간리스트, 기간, 만든 사람, 참석자)
	// 공간리스트는 and w.workspace_id in (?,?,?)이런 식으로 가면 되고
	// 기간은 디폴트가 select add_months(trunc(sysdate, 'mm'), -3), last_day(add_months(sysdate, +2)) from dual;
	// 위에꺼 하나씩 String으로 받아주고 그러면 위의 sql문에 where s.creation_date between to_date(?, 'YYYY.MM.DD') and to_date(?, 'YYYY.MM.DD')하기
	// 만든사람은 where s.writer_id = 선택한id
	// 참석자로 필터(이거는 안 하고싶다...)
	
	// 일정 참석하는 사람수
	public int attendeeCount(int schedule_id) {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String attendee = "";
		int count = 0;
		String[] arr = null;
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select s.attendee from schedule s, workspace w where w.workspace_id = s.workspace_id and schedule_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				attendee = rs.getString(1);
				if(attendee == null) {
					count = 0;
				}else {
					arr = attendee.split("_");
					count = arr.length;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	//일정참석자 사진들 
	/*public ArrayList<String> searchAttendee(int schedule_id)throws SQLException, ClassNotFoundException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String attendee = "";
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select s.attendee from schedule s, workspace w where w.workspace_id = s.workspace_id and schedule_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				attendee = rs.getString(1);
				String[] arr = attendee.split("_");
				for(String n: arr) {
					ResultSet rs2 = null;
					PreparedStatement pstmt2 = null;
					int m = Integer.parseInt(n);
					try{
						String sql2 = "select name from member where member_id = ?";
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setInt(1, m);
						rs2 = pstmt2.executeQuery();
						while(rs2.next()) {
							String name2 = rs2.getString(1);
							//System.out.print(picture);
						}
					}catch (SQLException e) {
						e.printStackTrace();
					} finally {
						rs2.close();
						pstmt2.close();
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	*/
	
	
	
	
	
	/* 여기서부터 안 함 */
	//파일검색
	/*public ArrayList<SearchFilesDto> searchFiles(String searchFiles, int member_id) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<SearchFilesDto> list1 = new ArrayList<SearchFilesDto>();
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select f.file_name, w.workspace_name, d.title, m.picture, f.file_date "
					+ "from files f, document d, workspace w, member m "
					+ "where f.document_id is not null and d.document_id = f.document_id "
					+ "and d.workspace_id = w.workspace_id and m.member_id = f.post "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "and lower(f.file_name) like lower(?) order by f.file_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			pstmt.setString(2,"%" + searchFiles + "%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				String file_name = rs.getString(1);
				String workspace_name = rs.getString(2);
				String title = rs.getString(3);
				String picture = rs.getString(4);
				String file_date = rs.getString(5);
				SearchFilesDto dto = new SearchFilesDto(file_name, workspace_name, title, picture);
				list1.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}
	//<파일필터> (공간, 올린사람, 파일유형)
	// 공간은 이전과 같은방법
	// 올린사람은 where f.post = 선택한id
	// 저절로 파일유형이 나눠져있거나 아니면 file_name like 'pptx' 이런 식으로 검색하거나
	
	//링크검색
	public ArrayList<SearchLinkDto> searchLinks(String searchLinks, int member_id) throws SQLException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		ArrayList<SearchLinkDto> list1 = new ArrayList<SearchLinkDto>();
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select l.link_title, l.link_name, l.link_explanation, "
					+ "w.workspace_name, d.title, m.picture, l.link_date "
					+ "from links l, document d, workspace w, member m "
					+ "where d.document_id = l.document_id and d.workspace_id = w.workspace_id "
					+ "and m.member_id = l.post and l.document_id is not null and lower(l.link_name) like lower(?) "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "or l.document_id is not null and lower(l.link_title) like lower(?) "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "order by l.link_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,"%" + searchLinks + "%");
			pstmt.setInt(2,member_id);
			pstmt.setString(3,"%" + searchLinks + "%");
			pstmt.setInt(4,member_id);
			rs = pstmt.executeQuery();
			while (rs.next()){
				String link_title = rs.getString(1);
				String link_name = rs.getString(2);
				String link_explanation = rs.getString(3);
				String workspace_name = rs.getString(4);
				String title = rs.getString(5);
				String picture = rs.getString(6);
				String link_date = rs.getString(7);
				SearchLinkDto dto = new SearchLinkDto(link_title, link_name, link_explanation, workspace_name, title, picture);
				list1.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			pstmt.close();
		}
		return list1;
	}*/
	//<링크필터> (공간, 올린사람)
	// 공간은 이전과 같은방법
	// 올린사람은 where l.post = 선택한id
}

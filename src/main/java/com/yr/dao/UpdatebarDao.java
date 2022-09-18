package com.yr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.yr.dto.ArticleDto;
import com.yr.dto.CommentDto;
import com.yr.dto.IssueDto;
import com.yr.dto.NewsDto;



public class UpdatebarDao {
	public void deleteNews(int news_id) {
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "delete from news where news_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<NewsDto> getNews (int member_id) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<NewsDto> list1 = new ArrayList<NewsDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select m.picture, m.name, n.content, to_char(n.creation_date, 'fmMM\"월\" DD\"일\"') \"creation_date\", n.news_id "
					+ "from member m, news n where m.member_id = n.member_id and n.member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString(1);
				String name = rs.getString(2);
				String content = rs.getString(3);
				String creation_date = rs.getString(4);
				int news_id = rs.getInt(5);
				NewsDto dto = new NewsDto(picture, name, content, creation_date, news_id);
				list1.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list1;
	}
	
	//이슈 업데이트
	//할일담당자들 사진뽑음
	public String searchName(int todo_id)throws SQLException, ClassNotFoundException {
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		String name = "";
		try{
			String sql = "select m.name from member m, todo_pic tp where m.member_id = tp.pic and todo_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return name;
	} 
	public ArrayList<IssueDto> getIssueUpdate(int member_id) throws ClassNotFoundException, SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<IssueDto> list1 = new ArrayList<IssueDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select wname, picture, period, title, to_char(edit_date, 'MM\"월\" DD\"일\"'), id, sort "
					+ "from(select w.workspace_name as wname, ki.kanban_icon_p as picture, d.start_date|| ' ~ ' || d.finish_date as period, "
					+ "d.title as title, d.edit_date as edit_date, d.document_id as id, '0' as sort "
					+ "from workspace w, kanban_icon ki, document d where d.workspace_id = w.workspace_id and d.kanban_icon_id = ki.kanban_icon_id "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "union "
					+ "select w.workspace_name as wname, tc.todo_cur_p as picture, t.start_date|| ' ~ ' || t.finish_date as period, "
					+ "t.content as title, t.edit_date as edit_date, t.todo_id as id, '1' as sort "
					+ "from workspace w, todo_cur tc, todo t, member m "
					+ "where t.todo_cur_id = tc.todo_cur_id and t.workspace_id = w.workspace_id and t.writer_id = m.member_id "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?) "
					+ "union "
					+ "select w.workspace_name as wname, '' as picture, s.start_date|| ' ~ ' || s.finish_date as period, "
					+ "s.title as title, s.edit_date as edit_date, s.schedule_id as id, '2' as sort "
					+ "from workspace w, schedule s where s.workspace_id = w.workspace_id "
					+ "and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?)) order by edit_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setInt(2, member_id);
			pstmt.setInt(3, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String wname = rs.getString(1);
				String picture = rs.getString(2);
				String period = rs.getString(3);
				String title = rs.getString(4);
				String edit_date = rs.getString(5);
				int id = rs.getInt(6);
				int sort = rs.getInt(7);
				String name2 = "";
				String name = "";
				
					
				if(sort == 1) {
					//System.out.print(wname + picture + title); // 준사람사진-->받은사람사진
					PreparedStatement pstmt2 = null;
					ResultSet rs2 = null;
					try {
						String sql2 = "select m.name from member m, todo t where m.member_id = t.writer_id and todo_id = ?";
						pstmt2 = conn.prepareStatement(sql2);
						pstmt2.setInt(1, id);
						rs2 = pstmt2.executeQuery();
						if(rs2.next()) {
							String p = rs2.getString(1);
							name = p;
						}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						pstmt2.close();
						rs2.close();
					}	
					name2 = searchName(id);
				}
				
				IssueDto dto = new IssueDto(wname, picture, period, title, edit_date, id, sort, name2, name);
				list1.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list1;
	}
	
	
	
	
	// 여기부터
	// 댓글: 쓴사람프사, 댓글내용(직접쓴거는 "블라블라"), 댓글쓴사람이름, 5월3일
	public ArrayList<CommentDto> document(int id) throws ClassNotFoundException, SQLException {
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select m.picture, c.content, m.name, to_char(c.creation_date, 'FMMM\"월\" DD\"일\"') as creation_date, c.fixed_comment"
					+ " from member m, comments c, document d"
					+ " where m.member_id = c.comment_writer and d.document_id = c.document_id"
					+ " and d.document_id = ? order by c.creation_date";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			//System.out.println("----------(Comment)---> ");
			while(rs.next()) {
				String picture = rs.getString(1);
				String yetcontent = rs.getString(2);
				String name = rs.getString(3);
				String creation_date = rs.getString(4);
				int fixed_comment = rs.getInt(5);
				String content = "";
				String comment = "";
				if(fixed_comment == 0) {
					content = "\"" + yetcontent + "\"";
				} else {
					content = yetcontent;
				}
				list.add(new CommentDto(picture, content, name, creation_date, comment));
				/*
				 * list.add(picture); list.add(content); list.add(name);
				 * list.add(creation_date); list.add(comment);
				 */
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			rs.close();
		}
		return list;
	}
	public ArrayList<CommentDto> todo(int id) throws ClassNotFoundException, SQLException {
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select m.picture, c.content, m.name, to_char(c.creation_date, 'FMMM\"월\" DD\"일\"') as creation_date, c.fixed_comment"
					+ " from member m, comments c, todo t"
					+ " where m.member_id = c.comment_writer and t.document_id = c.document_id"
					+ " and t.todo_id = ? order by creation_date";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString(1);
				String content = rs.getString(2);
				String name = rs.getString(3);
				String creation_date = rs.getString(4);
				int fixed_comment = rs.getInt(5);
				String comment = "";
				list.add(new CommentDto(picture, content, name, creation_date, comment));
				/*
				 * System.out.println(picture); System.out.println(name + creation_date);
				 * list.add(picture); list.add(content); list.add(name);
				 * list.add(creation_date);
				 */
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<CommentDto> schedule(int id) throws ClassNotFoundException, SQLException {
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select m.picture, c.content, m.name, to_char(c.creation_date, 'FMMM\"월\" DD\"일\"') as creation_date, c.fixed_comment"
					+ " from member m, comments c, schedule s"
					+ " where m.member_id = c.comment_writer and s.document_id = c.document_id"
					+ " and s.document_id = ? order by creation_date";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString(1);
				String content = rs.getString(2);
				String name = rs.getString(3);
				String creation_date = rs.getString(4);
				int fixed_comment = rs.getInt(5);
				String comment = "";
				list.add(new CommentDto(picture, content, name, creation_date, comment));
				/*
				 * System.out.println(picture); System.out.println(name + creation_date);
				 * list.add(picture); list.add(content); list.add(name);
				 * list.add(creation_date);
				 */
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			rs.close();
		}	
		return list;
	}
	// 뉴스피드 호출 // 댓글은 메서드 안에 메서드 써서 만들기 //한 줄을 읽어와서 어레이리스트에 담는다
	public ArrayList<ArticleDto> setChecked(int member_id) throws ClassNotFoundException, SQLException {
		ArrayList<ArticleDto> listYG = new ArrayList<ArticleDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "select title, picture, kanban, wname, edit_date, id, sort, docu"
					+ " from ("
					+ " select d.title as title, ki.kanban_icon_p as picture, k.kanban_name as kanban, w.workspace_name as wname,"
					+ " d.edit_date as edit_date, d.document_id as id, '0' as sort, d.document_id as docu"
					+ " from kanban k, workspace w, kanban_icon ki, document d"
					+ " where k.kanban_icon_id = ki.kanban_icon_id and d.workspace_id = w.workspace_id and d.kanban_icon_id = ki.kanban_icon_id"
					+ " and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?)"
					+ " union"
					+ " select t.content as title, tc.todo_cur_p as picture, tc.todo_cur_name as kanban, w.workspace_name as wname,"
					+ " t.edit_date as edit_date, t.todo_id as id, '1' as sort, t.document_id as docu"
					+ " from workspace w, todo_cur tc, todo t, member m"
					+ " where t.todo_cur_id = tc.todo_cur_id and t.workspace_id = w.workspace_id and t.writer_id = m.member_id"
					+ " and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?)"
					+ " union"
					+ " select s.title as title, m.picture as picture,"
					+ " to_char(s.start_date, 'FMMM\"월\" DD\"일\"') || ' ~ ' || to_char(s.finish_date, 'FMMM\"월\" DD\"일\"') as kanban, w.workspace_name as wname,"
					+ " s.edit_date as edit_date, s.schedule_id as id, '2' as sort, s.document_id as docu"
					+ " from workspace w, schedule s, member m where s.workspace_id = w.workspace_id and m.member_id = s.writer_id"
					+ " and w.workspace_id in (select workspace_id from workspace_mb where member_id = ?)) order by edit_date desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setInt(2, member_id);
			pstmt.setInt(3, member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString(1);
				String picture = rs.getString(2);
				String kanban = rs.getString(3);
				String wname = rs.getString(4);
				String edit_date = rs.getString(5);
				int id = rs.getInt(6);
				int sort = rs.getInt(7);
				int docu = rs.getInt(8);
				
				// sort값에 따라서, document(),todo(),schedule()  중에 하나를 호출해서 A.L.를 받고.
				// ArrayList<CommentDTO> listC = docuemnt(___________________);
				ArrayList<CommentDto> listC = null;
				if(sort==0) { // 문서일때
					listC = document(id);
				}else if(sort==1) { // 할일일때 //이제 document_id 디폴드값 0
					listC = todo(id);
				}else if(sort==2) { // 일정일때
					listC = schedule(id);
				}
				listYG.add(new ArticleDto(title,picture,kanban,wname,edit_date,id,sort,docu, listC));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			rs.close();
		}
		
		for(int i=listYG.size()-1; i>=0; i--) {
			ArticleDto obj1 = listYG.get(i);
			for(int j=0; j<i; j++) {
				ArticleDto obj2 = listYG.get(j);
				if(obj1.getTitle()!=null && !obj1.getTitle().equals(obj2.getTitle()))
					continue;
				if(obj1.getPicture()!=null && !obj1.getPicture().equals(obj2.getPicture()))
					continue;
				if(obj1.getWname()!=null && !obj1.getWname().equals(obj2.getWname()))
					continue;
				if(obj1.getDocu()!=obj2.getDocu())
					continue;
				listYG.remove(listYG.get(i));
				break;
			}
		}
		
		// NewsfeedDto 안 쓰기로 한다면...
		/*
		 * ArrayList<NewsfeedDto> list1 = new ArrayList<NewsfeedDto>();
		 * 
		 * for(int i=0; i<=listYG.size()-1; i++) { Dto d if(listYG.get(i).getSort()==0)
		 * { // 문서일때 // 문서: title, 댓글쓴사람픽쳐/댓글내용/댓글쓴사람이름/5월25일, 칸반상태그림, 칸반이름, 협업공간이름
		 * //System.out.println(listYG.get(i).getTitle()); ArrayList<Dto> d =
		 * document(listYG.get(i).getId()); ArrayList<CommentDTO> listC =
		 * document(listYG.get(i).getId());
		 * //System.out.println(listYG.get(i).getPicture() + listYG.get(i).getKanban() +
		 * listYG.get(i).getWname());
		 * 
		 * }else if(listYG.get(i).getSort()==1) { // 할일일때 //이제 document_id 디폴드값 0 // 할일:
		 * title, 할일준사람픽처/댓글내용/할일상태그림/title/할일준사람이름/5월25일, 협업공간이름 // 할일이 문서에 연결되었을 때
		 * //System.out.println(listYG.get(i).getTitle()); ArrayList<Dto> d =
		 * todo(listYG.get(i).getId()); //System.out.println(listYG.get(i).getPicture()
		 * + listYG.get(i).getKanban() + listYG.get(i).getWname()); }else
		 * if(listYG.get(i).getSort()==2) { // 일정일때 // 일정: title,
		 * 만든사람픽처/댓글내용/달력그림/title/5/11~5/13/만든사람이름/5월20일, 협업공간이름 // 일정이 문서에 연결되었을 때
		 * //System.out.println(listYG.get(i).getTitle()); ArrayList<Dto> d =
		 * schedule(listYG.get(i).getId());
		 * //System.out.println(listYG.get(i).getPicture() + listYG.get(i).getKanban() +
		 * listYG.get(i).getWname()); } NewsfeedDto dto = new
		 * NewsfeedDto(listYG.get(i).getTitle(), Dto, listYG.get(i).getPicture(),
		 * listYG.get(i).getKanban(), listYG.get(i).getWname()); list1.add(dto); }
		 */
		return listYG;
	} //*/
	
}

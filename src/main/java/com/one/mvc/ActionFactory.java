package com.one.mvc;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;


//singleton, factory pattern
public class ActionFactory {
	private static ActionFactory instance = new ActionFactory(); //객제 한번 생성
	
	private ActionFactory() {}
	public static ActionFactory getInstance() {  //여기만 static 붙이면 빨간줄. class메서드에서 인스턴스 변수 접근 안됨.
		return instance;
	}
	
	//키워드에 따라 이벤트 실행하는 메서드 정의.
	Action getAction(String command) { //파라미터의 command를 넣으면
		System.out.println("action factory 들어옴!");
		Action action = null;
		//해당 action객체 생성, 객체(의 참조값)를 리턴해줌.
		switch(command) {//command의 문자열에 따라 객체를 생성해서 보내주는 것.
		case "Home":
			action = new HomeRecentAction();
			break;
		case "MemberDelete":
			action = new MemberDeleteAction();
			break;
		case "dm2":
			action = new Dm2Action();
			break;
		//case "getThisWorkspaceMember":
		//	action = new GetThisWorkspaceMemberAction();
		//	break;
		case "option1":
			action = new Option1Action();
			break;
		case "option2":
			action = new Option2Action();
			break;
		case "option3":
			action = new Option3Action();
			break;
		case "updatebar1":
			action = new Updatebar1Action();
			break;
		case "updatebar2":
			action = new Updatebar2Action();
			break;
		
		//jm
		case "bookmark":
			action = new BookmarkAction();
			break;
		case "KanbanSelector" :
			action = new KanbanSelectorAction();
			break;
		case "BookmarkDel" : 
			action = new BookmarkDelAction();
			break;
		case "KanbanSelectorChange":
			action = new KanbanSelectorChangeAction();
			break;
			
		case "KanbanList" :
			action = new KanbanListAction();
			break;
		case "KanbanDel" :
			action = new KanbanDelAction();
			break;
		case "KanbanDocuOrderUpdate" :
			action = new KanbanDocuOrderUpdateAction();
			break;
		case "KanbanOrderUpdate" :
			action = new KanbanOrderUpdateAction();
			break;
		case "KanbanInsert" :
			action = new KanbanInsertAction();
			break;
		case "KanbanNewDocu" :
			action = new KanbanNewDocuAction();
			break;
		case "KanbanNewWS" : 
			action = new KanbanNewWSAction();
			
		case "Todo" :
			action = new TodoAction();
			break;
		case "ModalWorkspaceList" :
			action = new ModalWorkspaceListAction();
			break;
		case "ModalPartnerList" :
			action = new ModalPartnerListAction();
			break;
		case "TodoInsert" :
			action = new TodoInsertAction();
			break;
		case "TodoDetail" :
			action = new TodoDetailAction();
			break;
		case "TodoCurSelectorAction" :
			action = new TodoCurSelectorAction();
			break;
		case "TodoDetailEdit" :
			action = new TodoDetailEditAction();
			break;
		case "TodoDetailDel" :
			action = new TodoDetailDelAction();
			break;
			
		case "SignUpCheckEmail" : 
			action = new SignUpCheckEmailAction();
			break;
		case "SignUpSendEmail" :
			action = new SignUpSendEmailAction();
			break;
		case "SignUp" :
			action = new SignUpAction();
			break;
		case "SignUpNaver" :
			action = new SignUpNaverAction();
			break;
		case "LoginCheck":
			action = new LoginCheckAction();
			break;
		case "ResetPW" :
			action = new ResetPWAction();
			break;
		case "ResetPW1" :
			action = new ResetPW1Action();
			break;
		case "SignUpKakao" :
			action = new SignUpKakaoAction();
			break;    
		case "LoginAccountCheck" :
			action = new LoginAccountCheckAction();
			break;
			
		case "NewChat":
			action = new NewChatAction();
			break;
		case "NewChattingRoomInsert" :
			action = new NewChattingRoomInsertAction();
			break;	
			
		
		//jh
		//workspace things
		case "select_Workspace_Index" ://협업공간 메인화면
			action = new MyWorkspaceIndexAction(); 
			break;
		case "workspacePostList" : //협업공간 메인 문서리스트 출력
			action = new WorkspacePostListAction();
			break;
		case "workspace_Alarm" : //협업공간 알림 켜고 끄기
			action = new WorkspaceAlarmAction();
			break;
		case "workspaceUpdate" : //협업공간이름설명 업데이트
			action = new WorkspaceUpdateAction();
			break;
		case "workspaceUpdate2" : //대외비, 완료 설정
			action = new WorkspaceUpdate2Action();
			break;
		case "workspaceDelete" : //문서 삭제
			action = new WorkspaceDeleteAction();
			break;
		case "workspaceInviteList" ://멤버초대 목록
			action = new WorkspaceInviteListAction();
			break;
		case "workspaceInviteMember" ://멤버 초대 insert
			action = new WorkspaceInviteMemberAction();
			break;
		case "workspaceFindManager" :// 관리자 찾기
			action = new WorkspaceFindManagerAction();
			break;
		case "memberIdentified" : //비번 맞는지 확인
			action = new MemberPwIdentifiedAction();
			break;
		case "newWorkspace" : //협업공간 생성
			action = new NewWorkspaceAction();
			break;
		case "workspaceManagerEtc" : //관리자 설정 
			action = new WorkspaceManagerEtcAction();
			break;
			
			
		//document things	
		case "writedocument"://문서작성 클릭
			action = new PostDocumentAction();
			break;
		case "saveDocument" ://문서 저장 클릭
			action = new SaveDocumentAction();
			break;
		case "showNewDocument" ://문서 디테일 보기
			action = new DocumentDetailAction();
			break;
		case "getDraftsDocument" :
			action = new GetDocumentDraftsAction();
			break;
		case "showTwoSchedule" ://위젯 일정 2개 보여주기
			action = new ScheduleTwoAction();
			break;
		case "getThisWorkspaceMember" ://멤버 리스트 채우기
			action = new GetThisWorkspaceMemberAction();
			break;
		case "ModalWorkspaceListjh" : //공간 리스트
			action = new SelWorkspaceListAction();
			break;
		case "documentEtc" :
			action = new DocumentEtcAction();
			break;
		case "documentDel" :
			action = new DocumentDelAction();
			break;
			
		//schedule things	
		case "insertSchedule" : //일정 저장 -> insert
			action = new ScheduleInsertAction();
			break;
		case "updateSchedule" : //일정 수정
			action = new ScheduleUpdateAction();
			break;
		case "deleteSchedule" : //일정 삭제
			action = new ScheduleDeleteAction();
			break;
		case "scheduleGetter" : //일정 가져오기
			action = new ScheduleGetterAction();
			break;
			
		case "MyPost" :
			action = new MyPostAction();
			break;
		case "MyCmt" :
			action = new MyCmtAction();
			break;	
			
		//page 
			
		case "page_postedDocument" :
			
			break;
		/*
		 * case "write_page" : action = new WritePageAction();
		 */
		}
		return action;
	}
	
	
}

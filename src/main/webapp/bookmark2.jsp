<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	/* request.getRequestDispatcher("Controller?command=bookmark").forward(request, response); */
    session.setAttribute("member_id", 1);
%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>북마크</title>
	<style>
		*{
			box-sizing: border-box;
			margin: 0;
    		padding: 0;
    		border: 0;
    		outline: 0;
		}
		body{
			font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
			font-size: 13px;
		}
		a{
			text-decoration: none;
		}
		input{
			background-color: #fff;
		}
		button {
		    border: none;
		    font-size: 12px;
		    outline: 0;
		    text-transform: none;
		    overflow: visible;
		  	line-height: 1.15;
		}
		a:link{
			text-decoration: none;
		}
		
		.RootLayout{
			display: flex;
		    flex-direction: row;
		    width: 100vw;
		    height: 100vh;
		    background-color: rgb(255, 255, 255);
		}
		/* 왼쪽 사이드 바 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		.left-bar{
            background: #f7f6f5;
            top: 0;
            left: 0;
            width: 240px;
            height: 100%;
            float:left;
            transition: all 0.5s ease;
        }
        .left-top{
                padding-left:22px;
                height: 72px;
                top: 0px;
            }
            .sidebar_top{
                top: 20px;
                right:25px;
                width:240px;
                display:flex;
                align-items:stretch;
                justify-content:space-around;
                flex: 0 0 auto;
                position: relative;
            }
		
		/* 메인 레이아웃 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */		
		.main_layout{
			min-width: 730px;
			flex: 1 1 auto;
		    display: flex;
		    flex-direction: column;
		    height: 100vh;
		    overflow-y: auto;
		}
		
		.header_default{
			position: relative;
		    display: flex;
		    flex-direction: column;
		}
		
		.top_header{
			position: relative;
		    display: flex;
		    flex-direction: row;
		    height: 68px;
		}
		.top_header_left{
			flex: 1 1 auto;
		    display: flex;
		    flex-direction: row;
		    justify-content: space-between;
		    align-items: center;
		    margin-left: 44px;
		    margin-right: 20px;
		}
		.top_header_title{
			text-decoration: none;
			font-size: 22px;
		    font-weight: bold;
		    color: rgb(34, 34, 34);
		    overflow: hidden;
		    min-width: 66px;
		}
		
		.search_write_btn{
			display: flex;
		    flex-direction: row;
		    position: relative;
		    align-items: flex-start;
		}
		#bnt1_cal{
        	display:flex;
	    }
	    #searchbar::placeholder{
	        color: rgb(193, 193, 193);
	    }
	    #searchbar { /*상단 검색창  / 클릭하면 길어지면서 문서작성 버튼 없어짐(할지말지 고민중) */
	        will-change: transform;
	        background-color: rgba(255, 255, 255, 0);
	        height:28px;
	        width:144px;
	        font-size:13px;
	        border-radius:4px;
	        border: 1px solid rgb(225, 225, 225);
	        transition: border-color 0.2s ease 0s, background-color 0.2s ease 0s;
	        margin-right:16px;
	        padding:0px 32px;
	    }
	    #searchbar:hover{
	        border-color:rgb(136, 136, 136);
	    }
	    #searchbar:focus{
	        background-color: rgba(255, 255, 255, 0.2);
	        border-color:rgb(136, 136, 136);
	        width:269px;
	    }
	    #searchbar::placeholder:hover{
	        color:rgb(136, 136, 136);
	    }
	    #search_icon{
	        fill:rgb(224, 221, 217);
	        position: absolute;
	        transition: fill 0.2s ease 0s;
	        -webkit-box-align: center;
	        border:none;
	        display:flex;
	        align-items:center;
	        padding-left:10px;
	        padding-top:2px;
	    }
	    #search_icon:hover{
	        fill:rgb(136, 136, 136);
	    }
	    #posting_bnt {/* 상단 문서작성버튼*/
	        color: rgb(255, 255, 255);
	        font-size: 12px;
	        font-weight: 500;
	        border-radius: 4px;
	        border: 1px solid rgb(217, 173, 43);
	        background-color: rgb(217, 173, 43);
	        cursor: pointer;
	        width: 105px;
	        height:28px;
	        border:1px solid rgba(255, 255, 255, 0.2);
	        margin-right:250px;
	        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
	    }
	    #posting_bnt:hover{
	        background-color: rgb(179, 142, 34);
	        border-color: rgb(179, 142, 34);
	    }
	    .posting_icon{ /*svg 색지정은 fill로!!*/
	        fill: rgb(255, 255, 255);
	        width:13px;
	        height:13px;
	    }
		
		.sub_header{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    position: relative;
		    z-index: auto;
		    height: 38px;
		    margin: 0px 20px;
		}
		.sub_header_left{
			margin-left: 0px;
		    margin-right: 0px;
		    flex: 1 1 auto;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    -webkit-box-align: center;
		    align-items: center;
		}
		.sub_header_bookmark{
			font-size: 12px;
		    line-height: 1.5;
		    color: rgb(136, 136, 136);
		    margin-left: 20px;
		}
		
		.body_default{
			position: relative;
		    display: flex;
		    flex-direction: row;
		    align-items: stretch;
		    min-width: 680px;
		    
		    flex-grow: 1;
		    overflow-x: hidden;		    
		}
		.body_left{
			display: flex;
		    flex-direction: row;
		    flex: 1 1 auto;
		    padding: 0px 20px 0px 40px;
		    overflow-y: auto;
		    height: calc((100vh - 68px) - 38px);
		}
		
		.after_line::after{
			position: absolute;
		    bottom: 0px;
		    left: 0px;
		    right: 0px;
		    content: "";
		    height: 1px;
		    background-color: rgb(225, 225, 225);
		}
		
		.bookmark_view{
			display: flex;
		    flex-direction: row;
		    flex: 0 1 auto;
		    border-bottom: 1px solid rgb(225, 225, 225);
		}
		.bookmark_view1{
		    flex: 0 0 auto;
		    width: 43px;
		    padding: 14px 0px 0px 18px;
		}
		.bookmark_view2{
			display: flex;
		    flex-direction: column;
		    padding: 14px 0px;
		    flex: 1 1 auto;
		}
		.bookmark_view3{
			flex: 0 0 auto;
	    	width: 57px;
	    	padding: 12px 0px 0px 18px;
		}
		
		.kanban_select_button{
			background-color: transparent;
		    cursor: pointer;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    transition: fill 0.2s ease 0s;
		}
		.kanban_select_src{
			width: 20px;
    		height: 20px;
		}
		.bookmark_view_document_link{
			cursor: pointer;
		    font-size: 13px;
		    color: rgb(34, 34, 34);
		    line-height: 1.54;
		    overflow: hidden;
		    padding-bottom: 2px;
		}
		.bookmark_view_document_info{
			display: flex;
		    flex-direction: row;
		}
		.bookmark_view_document_info1{
			font-size: 12px;
		    line-height: 1.5;
		    background-color: transparent;
		    color: rgb(51, 132, 108);
		}
		.bookmark_view_document_info2{
			font-size: 12px;
		    line-height: 1.5;
		    padding-left: 8px;
		    background-color: transparent;
		    color: rgb(136, 136, 136);
		}
		
		.bookmark_button{
			min-width: inherit;
		    min-height: inherit;
		    padding-left: 0px;
		    padding-right: 0px;
		    transition: fill 0.2s ease 0s;
		    cursor: pointer;
		    pointer-events: auto;
		    width: auto;
		    background-color: transparent;
		    text-decoration: none;
		}
		.bookmark_on_color{
		    fill: rgb(217, 173, 43);
		}
		.bookmark_on_color:hover{
			fill: rgb(179, 142, 34);
		}
		
		/* 칸반 셀렉터 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		#kanban_selector{
			display: none;
			z-index: 101;
			position: absolute;
		    top: 0px;
		    left: 0px; 
		}
		#div_background {
			display: none;
			z-index: 100;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom : 0;
			width: 100%;
			height: 100%;
			/* background-color: rgba(0,0,0,0.5); */
			background-color: transparent;
		}
		.kanban_selector_center{
			max-width: 332px;
		    min-width: 180px;
		    display: flex;
		    flex-direction: column;
		    border-radius: 6px;
		    box-shadow: rgb(0 0 0 / 5%) 0px 0px 0px 1px, rgb(0 0 0 / 10%) 0px 2px 4px, rgb(0 0 0 / 15%) 0px 8px 16px;
		    background-color: rgb(255, 255, 255);
		    padding-top: 12px;
		    padding-bottom: 12px;
		    
		    width: 184px;
		}
		.kanban_selector_title{
			display: block;
		    font-weight: normal;
		    font-size: 12px;
		    color: rgb(136, 136, 136);
		    line-height: 1.5;
		    padding: 0px 10px 4px 15px;
		}
		.kanban_selector_menu{
			max-height: 286px;
		    overflow: hidden auto;
		    display: flex;
		    flex-direction: column;
		}
		.kanban_selector_menu::-webkit-scrollbar {
			width:4px;
		}
		.kanban_selector_menu::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
		}
		
		.kanban_selector_menu_button{
			cursor: pointer;
		    border: none;
		    display: flex;
		    flex-direction: row;
		    align-items: center;
		    color: rgb(34, 34, 34);
		    background-color: rgb(255, 255, 255);
		    padding: 5px 8px 5px 13px;
		    transition: background-color 0.2s ease 0s;
		    text-align: left;
		}
		.kanban_selector_menu_button:hover{
			background-color: rgb(242, 242, 242);
		}
		.kanban_img{
			margin-right: 2px;
		    flex-shrink: 0;
	        width: 20px;
		    height: 20px;
		}
		.kanban_selector_name{
			white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    margin-right: 2px;
		    color: rgb(34, 34, 34);
		    font-size: 13px;
		    max-width: 250px;
		    flex: 1 1 0%;
		    line-height: 24px;
		}
		/* 스크롤바 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		.body_left::-webkit-scrollbar {
			width:4px;
		}
		.body_left::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
		}
		
	</style>
	
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
	
		$(function() {
			var member_id = 1;
			var bookmark_id = 0;
			
			// 문서상태변경 모달띄우기 / 닫기
			$(".kanban_select_button").click(function() {
            	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
            	var py = $(this).offset().top+ 25;
            	$("#kanban_selector").css('left',px+'px');
            	$("#kanban_selector").css('top',py+'px');
				
				$("#kanban_selector").css('display', 'block');
				$("#div_background").css('display', 'block');
				
				bookmark_id = $(this).parent().parent().find(".b_id").text();
				//var workspace_name = $(this).parent().parent().find(".bookmark_view_document_info1").text();
				
				$.ajax({
					type: 'post',
					url: 'Controller', 
					data: {'command' : 'KanbanSelector', 'bookmark_id' : bookmark_id},
					datatype: "json",	
					success: function(d){
						$(".kanban_selector_menu").empty();
						for(i=0; i<d.length; i++){
							var kanban_id = d[i].kanban_id;
							var kanban_icon_p = d[i].kanban_icon_p;
							var kanban_name = d[i].kanban_name;
							var str = "<button class='kanban_selector_menu_button'>" +
											"<div class='kanban_id' style='display:none'> "+kanban_id+" </div>" +
											" <img src=' "+ kanban_icon_p +" ' size='20' class='kanban_img'>" +
											" <span class='kanban_selector_name'>"+ kanban_name +"</span>" +
											" </button>";
							$(".kanban_selector_menu").append(str);
						}
						
					},
					error: function(r,s,e){
						alert("에러");
					}
				});
				
			});
          	$("#div_background").click(function() {
            	$("#div_background").css('display', 'none');
          		$("#kanban_selector").css('display', 'none');
          	});
          	
          	// 문서 상태 변경 
           	/* $(".kanban_selector_menu_button").click(function() { */
           	$(document).on("click", ".kanban_selector_menu_button", function() {
          		
				var kanban_id = $(this).find('.kanban_id').text();
				alert(kanban_id);
				$.ajax({ 
					type: 'post',
					url: 'Controller',
					data: {'command' : 'KanbanSelectorChange', 'bookmark_id' : bookmark_id, 'kanban_id' : kanban_id},
					datatype: 'json',
					success: function(d){
						alert("문서 상태가 변경되었습니다.");
					},
					error: function(r,s,e){
						alert("에러");
					}
				});
          		
          	});  
          	
          	// 북마크 해제
          	$(".bookmark_button").click(function() {
          		
          		var bookmark_id = $(this).parent().parent().find(".b_id").text();
          		
          		if(confirm("북마크를 해제하시겠습니까?")){
         			
           			$.ajax({
          				type: 'post',
          				url: 'Controller',
          				data: { 'command' : 'BookmarkDel' , "bookmark_id" : bookmark_id },
          				datatype: "json",
          				success: function(data){
          					if(data.result==1){
	           					$(".b_id").each(function(index, item){
	           						console.log(index);
	          						if($(item).text()==bookmark_id){
	          							$(item).parent().find(".bookmark_view1").css('display', 'none');
	          							$(item).parent().find(".bookmark_view2").css('display', 'none');
	          							$(item).parent().find(".bookmark_view3").css('display', 'none');
	          						}
	          					});       						
          					}else {
          						alert("북마크 해제 실패");
          					}
          				},
          				error: function(r,s,e){
          					alert("에러");
          				}
          				
          			}); 
          			
          		} else { }
          	});
          	
		}); 
		
	</script>
	
</head>
<body>


 	<div class="RootLayout">


		<main class=main_layout>
			<div id="bookmark_body">
			
				<header class="header_default">
					<div class=top_header>
						<div class="top_header_left">
							<span class="top_header_title">북마크</span>
							<div class="search_write_btn">
								  <div id="bnt1_cal">
							        <div id="search_icon" class="bnt_base"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
							        <input type ="text" id=searchbar placeholder="검색"/>
							        <button id="posting_bnt">
							            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
							            <span>문서 작성</span>
							        </button>
							    </div>
							</div>
						</div>
						
						<div class="common_top_header_right">
<!-- 							<span>프로필 사진/파트너</span> -->
						</div>
					</div>
					
					<div class="sub_header">
						<div class="sub_header_left">
							<div class="sub_header_bookmark">
								중요한 문서는 북마크하여 모아보세요.
							</div>
						</div>
						
						<div class="sub_header_right">
						
						</div >
							
						<div class="after_line"></div>
					</div>
				</header>
				
				<div class="body_default">
					<div class="body_left">
						<div style=" min-width: 0px; width: 100%; ">
							
							<%
															ArrayList<BookmarkDto> bDtoList = (ArrayList<BookmarkDto>) request.getAttribute("bList");
																															if(bDtoList==null) {
														%>
								<script>
								alert("bDtoList is null");
								</script>
								<%
							}
								for(int i = bDtoList.size()-1; i>=0; i--){
									
							%>
							<div class="bookmark_view"> <!-- 북마크 하나당 -->
								<div style="display: none" class="b_id"><%=bDtoList.get(i).getBookmark_id() %></div>
							
								<div class="bookmark_view1">
									<button type="button" class="kanban_select_button">
										<img src='<%=bDtoList.get(i).getKanban_icon_p() %>' size="20" class="kanban_select_src">
									</button>
								</div>
								
								<div class="bookmark_view2">
									<a href="" class="bookmark_view_document_link"><%= bDtoList.get(i).getTitle() %></a>
									<div class="bookmark_view_document_info">
										<div class="bookmark_view_document_info1"><%= bDtoList.get(i).getWorkspace_name() %></div>
											<div class="bookmark_view_document_info2"><%= bDtoList.get(i).getName() %></div>
									</div>
								</div>
								
								<div class="bookmark_view3">
									<button class="bookmark_button">
										<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" >
											<path class="bookmark_on_color" fill="#888888" fill-rule="evenodd" d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"></path>
										</svg>
									</button>
								</div>
							</div> <!-- 북마크 하나 끝 -->
							<%
								}
							%>
							
							
						</div>
					</div>
					
					<div class="body_right">
					
					</div>
				</div>
				
			</div>
		</main>
	</div>
	
	<div id="kanban_selector" role="tooptip" >
		<div class="kanban_selector_center">
			
			<h6 class="kanban_selector_title">문서상태변경</h6>
			
			<div class="kanban_selector_menu">
<!-- 			<button class="kanban_selector_menu_button">
					<img src="https://down.collabee.co/postStatus/1603707" size="20" class="kanban_img">
					<span class="kanban_selector_name">발의됨</span>
				</button>
				
				<button class="kanban_selector_menu_button">
					<img src="https://down.collabee.co/postStatus/1603708" size="20" class="kanban_img">
					<span class="kanban_selector_name">진행중</span>
				</button> -->
				
				
			</div>
			
		</div>
	</div>
	
	<div id="div_background"></div>
	
</body>
</html>
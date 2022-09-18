<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	//String search = request.getParameter("search");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문서검색</title>
	<script src="js/jquery-3.6.0.min.js"></script>
	<style>
	body, html {
    	height: 100%;
    	margin: 0px;
    	overflow-y: hidden;
    	overflow-x: hidden;
	}
	*{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
	}
	a{
		text-decoration: none;
		color: black;
	}
	button{
		border: none;
	}
	.close{
	    margin-top: -51px;
	    margin-left: 22px;
    }
    .btn0{
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
	    fill: rgb(255, 255, 255);
    }
    .close2{
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    transition: fill 0.2s ease 0s;
    }
    .btn0:hover{
    	fill: rgb(217, 173, 43);
    }
    .layout{
		display: flex;
	    flex-direction: row;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
	}
	.layout2{
		position: relative;
	    width: 240px;
	    background-color: black;
	    flex: 0 0 auto;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    padding-top: 72px;
	    z-index: 1;
	    opacity: 0.9;
	}
	main{
		position: absolute;
	    top: 0px;
	    right: 0px;
	    width: calc(100% - 200px);
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
	    z-index: 10;
	}
	header{
		height: 86px;
	    padding-top: 18px;
	    margin-left: 20px;
	    margin-right: 20px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    min-width: 488px;
	}
	.header1{
		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	}
	h2{
		font-size: 22px;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    padding-left: 20px;
	    margin-top: 0px;
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
        padding-top:8px;
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
    .top_right{
    	display: flex;
	    flex-direction: row;
	    position: relative;
	    align-items: flex-start;
	    margin-right: 250px;
    }
    .menu{
	    display: flex;
	    flex-direction: row;
	    transform: translateY(1px);
	    margin-left: 4px;
    }
    .menu1{
	    display: block;
	    height: 26px;
	    font-size: 12px;
	    margin: 0px 16px;
	    padding-top: 10px;
	    border-bottom: 1px solid rgb(34, 34, 34);
	    transition: color 0.2s ease 0s, border-bottom-color 0.2s ease 0s;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    cursor: pointer;
    }
    .menu2{
	    display: block;
	    height: 26px;
	    color: rgb(136, 136, 136);
	    font-size: 12px;
	    margin: 0px 16px;
	    padding-top: 10px;
	    border-bottom: 1px solid rgba(34, 34, 34, 0);
	    transition: color 0.2s ease 0s, border-bottom-color 0.2s ease 0s;
	    cursor: pointer;
    }
    .main1{
	    display: flex;
	    flex-direction: row;
	    height: calc(100% - 106px);
	    margin-left: 20px;
    }
    .section1{
	    flex: 1 1 0%;
	    min-width: 650px;
	    height: 100%;
    }
    .aside{
	    flex: 0 0 215px;
	    padding: 32px 30px 40px 34px;
	    overflow-y: scroll;
    }
    .article{
	    flex: 1 1 0%;
	    width: 100%;
	    padding: 0px 20px 0px 0px;
	    overflow-y: auto;
    }
    .article::-webkit-scrollbar {
		width:4px;
	}
	.article::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background-color: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	.article::-webkit-scrollbar-track{
		background-color: white;
	}
    .container1{
	    display: flex;
	    flex-direction: column;
	    padding: 14px 20px 14px 12px;
	    border-bottom: 1px solid rgb(225, 225, 225);
    }
    .first{
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
    }
    .second{
	    transform: translateX(30px);
	    padding-left: 6px;
    }
    .d_style{
	    background-color: transparent;
	    cursor: pointer;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    transition: fill 0.2s ease 0s;
    }
    .img1{
	    width: 24px;
	    height: 24px;
    }
    .d_title{
	    color: rgb(34, 34, 34);
	    font-size: 14px;
	    line-height: 1.54;
	    transition: color 0.2s ease 0s;
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
    }
    .wname{
	    font-size: 12px;
	    color: rgb(51, 132, 108);
	    transition: color 0.2s ease 0s;
    }
    .writer{
    	display: inline-block;
    	padding-right: 5px;
    }
    .writer_name{
	    font-size: 12px;
	    color: rgb(136, 136, 136);
	    cursor: pointer;
    }
    .date{
    	font-size: 12px;
    	color: rgb(136, 136, 136);
    }
    .date::before{
	    content: "・";
	    display: inline-block;
	    padding-right: 4px;
    }
   
	</style>
	<script>
	$(function(){
		$("#searchbar").keyup(function(key){
            $(this).attr("value",$(this).val());
            var word = $(this).val();
            /* if(key.keyCode==13){ // 13-> 키보드 엔터키
            	alert($(this).val());
            } */
            $.ajax({
            	type: 'get',
            	url: 'SearchServlet1',
            	data: {"searchDocument" : word, "member_id" : 4 }, <%-- <%=search %> <%=member_id%> --%>
            	datatype: "json",
            	success: function(d){
            		
            		$("#table *").remove();
            		for(var i in d){
            			var title = d[i].title;
            			var workspace_name = d[i].workspace_name;
            			var name = d[i].name;
            			var edit_date = d[i].edit_date;
            			var workspace_id = d[i].workspace_id;
            			var document_id = d[i].document_id;
            			var str = "<div class='container1'>"
						+ "<div class='first'>"
						+ "<button type='button' class='d_style'>"
						+ "<img src='https://down.collabee.co/postStatus/1603707' size='24' class='img1' data-project-no='126976' data-status-value='10'></button>"
						+ "<a target='_blank' class='d_title' href='' documentId='"+ document_id +"'>"+ title +"</a></div>"
						+ "<div class='second'>"
						+ "<a isprivate='0' class='wname' href='' workspaceId='"+ workspace_id +"'>" + workspace_name + " " + "</a>"
						+ "<div class='writer'>"
						+ "<span class='writer_name'>" + " " + name + " " + "</span></div>"
						+ "<span class='date'>" + edit_date + "</span></div></div>";
					
						$("#table").append(str);
            		}
            	},
            	error: function(r,s,e){
            		alert("error");
            	}
            });
            
        });   
	});
	</script>
</head>
<body>
	<div class="layout">
		<div class="layout2">
			<div class="close">
				<button class="btn0">
				<svg viewBox="0 0 24 24" width="35px" height="35px" class="close2"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
				</button>
			</div>
		</div>
		<main>
			<header>
			<div class="header1">
				<h2>통합 검색</h2>
				<div class="top_right">
				<div class="mastersearchbar">
		        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
		        </div>
		        <input type ="text" id=searchbar placeholder="검색"/>
		    	</div>
		    	<button id="posting_bnt">
	            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
	            <span>문서 작성</span>
	        	</button>
				</div>
			</div>
			<div class="menu">
				<a active="1" class="menu1" href="">문서</a>
				<a active="0" class="menu2" href="0search2.jsp">댓글</a>
				<a active="0" class="menu2" href="0search3.jsp">할일</a>
				<a active="0" class="menu2" href="0search4.jsp">일정</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">의사결정</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">파일</a>
				<a active="0" class="menu2" onClick="alert('준비 중입니다.')">링크</a>
			</div>
			</header>
			
			<div class="main1">
				<div class="section1">
					<div class="article">
						<div class="taindex" id="table">
						
						
						
						
						
							
							
							
							
							
							
						</div>
					</div>
				</div>
			
			
				<div class="aside">
					
					
					
				</div>
			
			</div>
		</main>
	</div>
</body>
</html>
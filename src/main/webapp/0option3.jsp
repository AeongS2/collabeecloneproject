<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	Collabee_newinfoDao infoDao = new Collabee_newinfoDao();
	ArrayList<Collabee_newinfoDto> listAll = infoDao.getAllBoardList();
	ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>option3</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	body{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		font-size: 13px;
    	color: #222;
    	margin: 0px;
	}
	a{
		text-decoration: none;
	}
	.update_layout{
		display: flex;
	    flex-direction: row;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
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
        border: 1px;
        width:269px;
        z-index: 10;
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
    .micro{
    	margin-top: 5px;
    }
    .infoupdate_main{
	    flex: 1 1 auto;
	    display: flex;
	    flex-direction: column;
	    height: 100vh;
	    overflow-y: auto;
	    min-width: 690px;
    }
    .content{
    	flex: 1 1 auto;
    	height: 100vh;
	    overflow-y: auto;
	    overflow-x: hidden;
	    padding: 40px;
	    margin-top: -30px;
    }
    .infoupdate_header{
    	width: 100%;
    	height: 106px;
    	position: relative;
    }
    .infoupdate_top{
    	position: relative;
	    height: 68px;
	    display: flex;
	    flex-direction: row;
    }
    .infoupdate_title{
    	flex: 1 1 auto;
    	display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-right: 20px;
    }
    .h1{
    	font-size: 22px;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    text-shadow: none;
	    margin-top: 10px;
	    margin-left: 40px;
    }
    .mastersearchbar{
    	display: flex;
	    flex-direction: row;
	    position: relative;
	    align-items: flex-start;
    }
    /* .infoupdate_topright{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 40px;
    }
    .infoupdate_btn1{
    	width: 32px;
	    height: 32px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
        cursor: pointer;
        position: relative;
    }
    .infoupdate_btn1::before{
    	position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    background-color: rgb(255, 255, 255);
	    width: 30px;
	    height: 30px;
	    background-image: url(https://down.collabee.co/userProfile/2972613);
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
    	content: "";
    }
    .infoupdate_btn2{
    	width: 32px;
	    height: 32px;
	    margin-left: 8px;
	    padding-top: 4px;
	    border-radius: 4px;
	    cursor: pointer;
	    background-color: white;
    }
    .infoupdate_btn3{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-left: 8px;
	    padding: 0px 4px 0px 6px;
	    border-radius: 4px;
	    background-color: white;
	    color: rgb(34, 34, 34);
	    font-size: 13px;
	    line-height: 32px;
	    cursor: pointer;
    }
    .infoupdate_number{
    	display: inline-block;
	    padding-left: 4px;
	    padding-right: 4px;
    } */
    button{
    	border: none;
    }
    /* .infoupdate_btn2:hover, .infoupdate_btn3:hover{
    	filter: brightness(90%);
		transition: transform 10s;
    } */
    .header_mid{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    position: relative;
	    z-index: 2;
	    height: 25px;
	    margin: 0px 20px;
	    border: none;
	    border-bottom: 1px solid lightgray;
    }
    .sort{
    	margin-left: 6px;
	    display: flex;
	    flex-direction: row;
    }
    .m{
    	margin: 0px 16px;
    	font-size: 12px;
    	cursor: pointer;
    	color: rgb(136,136,136);
    }
    .m:hover{
    	color: black;
    	font-weight: bold;
    }
    .selected{
    	color: black;
    	font-weight: bold;
    	border: none;
    	border-bottom: 1px solid black;
    }
    .content_header{
    	padding-left: 10px;
    	padding-top: 20px;
	    height: 85px;
	    margin-right: 40px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    width: 100%;
    }
    .p1{
    	display: block;
	    font-size: 12px;
	    line-height: 1.5;
	    color: rgb(136, 136, 136);
    }
    .h2{
    	font-size: 18px;
	    font-weight: bold;
	    line-height: 1.2;
	    color: rgb(34, 34, 34);
	    margin-left: -20px;
    }
    .content_body{
    	height: calc(100vh - 231px);
	    overflow-y: scroll;
	    overflow-x: hidden;
    }
    .content_body::-webkit-scrollbar{
    	width:4px;
    }
    .content_body::-webkit-scrollbar-thumb{
    	height: 70%; /* 스크롤바의 길이 */
	    background: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
    }
    .divtable{
    	width: 100%;
    }
    .updatebox{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    padding: 14px 10px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    cursor: pointer;
	    width: 100%;
    }
    .updatecontent{
    	display: flex;
	    flex-direction: row;
	    min-width: 0px;
	    flex: 1 1 0%;
	    padding-right: 12px;
    }
    .updatespan1{
    	color: rgb(136, 136, 136);
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    transition: color 0.2s ease 0s;
	    display: inline;
    }
    .updatespan1::before{
    	display: inline-block;
	    content: "-";
	    padding-left: 5px;
	    padding-right: 5px;
    }
    .updatespan2{
    	color: rgb(34, 34, 34);
    	font-size: 14px;
    	padding-right: 30px;
    }
    .nowrap{
    	white-space:nowrap;
    }
    /* 모달 시작 */
    .modal_background{
		top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    z-index: 1300;
	    position: fixed;
	    background-color: rgba(0,0,0,0.5);
	    height: 100%;
	    outline: none;
	    display: none;
	    align-items: center;
	    justify-content: center;
	}
	.update_modal{
		position: absolute;
	    inset: 50% auto auto 50%;
	    border: 1px solid rgb(204, 204, 204);
	    background: rgb(255, 255, 255);
	    overflow: auto;
	    border-radius: 4px;
	    outline: none;
	    padding: 0px;
	    margin-right: -50%;
	    transform: translate(-50%, -50%);
	}
	.update_modal_body{
		display: flex;
	    flex-direction: column;
	    width: 580px;
	    min-height: 229px;
	    padding: 27px 28px;
	    z-index: 110;
    }
    .update_modal_title{
	    color: rgb(136, 136, 136);
	    font-size: 12px;
	    line-height: 18px;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        margin-top: -15px;
    }
    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .update_modal_header{
	    font-weight: bold;
	    color: rgb(136, 136, 136);
	    display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	}
	.update_modal_content_title{
		margin-top: 20px;
	    font-size: 16px;
	    font-weight: 700;
	    line-height: 24px;
	    margin-bottom: 0px;
	}
	.update_modal_date{
		font-size: 12px;
	    line-height: 18px;
	    color: #888;
	}
	.modal_content_text{
		overflow-y: auto;
	    max-height: 538px;
	    margin-top: 20px;
	    padding-top: 20px;
	    font-size: 14px;
	    line-height: 22px;
	    border-top: 1px solid #e1e1e1;
	}
	
	
	
	
	
	
	
	
	
	
	</style>
	<script>
	$(function(){
		
		
	
		
	
		$("#ready1, #ready2").click(function(){
			alert("서비스가 준비 중입니다.");
		});
		
		$('.updatebox').mouseenter(function() {
            $(this).find('.updatespan1').css("color","rgb(83, 83, 83)");
		});
        $('.updatebox').mouseleave(function() {
        	$(this).find('.updatespan1').css("color","rgb(136, 136, 136)");
        });
        $('.updatebox').click(function() {
        	var order = $(this).attr("title");
        	
        	
        	$.ajax({
        		type: 'get',
        		url: 'BoardServlet',
        		data: { "newinfo" : order},
        		datatype: "json",
        		success: function(d){
        			$('.modal_background').css("display", 'block');
        			var title = d.title;
        			var content = d.content;
        			var creation_date = d.creation_date;
        			//alert(title + ' / ' + content + ' / ' + creation_date);
        			//제이쿼리셀렉터.text(title);
        			$("#title").text(title);
        			$("#content").text(content);
        			$("#date").text(creation_date);
        		},
        		error: function(r,s,e){
        			alert("error!");
        		}
        	});
        });
	});
	</script>
	
</head>
<body style="overflow-x: hidden;">
<div class="update_layout">
	
	
	
	
	
	
	
	<main class="infoupdate_main">
		<header class="infoupdate_header">
		<div class="infoupdate_top">
		<div class="infoupdate_title">
			<div>
			<h1 class="h1">설정</h1>
			</div>
			<div>
    		<div class="mastersearchbar">
		        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
		        <input type ="text" id=searchbar placeholder="검색"/>
		        <button id="posting_bnt">
		            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
		            <span>문서 작성</span>
		        </button>
        	</div>
        	</div>
    	</div>
    		
    	<!-- <div class="infoupdate_topright">
    		<button class="infoupdate_btn1"></button>
    		<button class="infoupdate_btn2">
    		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
    		</button>
    		<button class="infoupdate_btn3">
    		<span>파트너</span>
    		<span class="infoupdate_number">4</span>
    		</button>
    	</div> -->
    	</div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="0option1.jsp">내 정보</a>
    			<a class="m" href="0option2.jsp">알림</a>
    			<a class="m" href="partner_management.jsp">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m" href="setting_price.jsp">가격 및 결제</a>
    			<a class="m selected" href="">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
		</header>
		
		<div class="content">
		<div class="content_header">
			<h2 class="h2">업데이트</h2>
			<p class="p1">콜라비의 업데이트 소식을 알려드립니다.</p>
		</div>
		<div class="content_body">
		<div class="divtable">
		
<%
	for(Collabee_newinfoDto dto : listAll){
%>		
			<div class="updatebox" title="<%= dto.getCollabee_newinfo_id()%>">
			<div class="updatecontent">
				<span class="nowrap"><%= dto.getTitle() %></span>
				<span class="updatespan1"> <%= dto.getContent() %></span>
			</div>
			<span class="updatespan2"><%= dto.getCreation_date() %></span>
			</div>
	
<%
	}
%>					
		</div>
		</div>
		</div>
	</main>
</div>	
	<div class="modal_background">
		<div class="update_modal">
			<div class="update_modal_body">
				<div class="update_modal_header">
					<span class="update_modal_title">업데이트</span>
					<span class="close">&times;</span>
				</div>
				<div class="update_modal_content">
					<p class="update_modal_content_title" id="title"></p>
					<span class="update_modal_date">
						<span id="date"></span>
					</span>
					<div class="modal_content_text">
						<p id="content"></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		var modal_background = document.getElementsByClassName("modal_background")[0];
		var close = document.getElementsByClassName("close")[0];
		
		close.onclick = function(e){
	        modal_background.style.display = "none";
	    }
		window.onclick = function(e){
			if(e.target == modal_background){
				modal_background.style.display = "none";
			}
		}
	</script>	
		  
</body>
</html>
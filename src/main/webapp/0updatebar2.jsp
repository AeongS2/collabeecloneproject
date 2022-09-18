<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int loginMember_id = (int)(session.getAttribute("login_id")); */
	UpdatebarDao uDao = new UpdatebarDao();
	//ArrayList<ArticleDto> list = uDao.setChecked(4);
	ArrayList<ArticleDto> list = (ArrayList<ArticleDto>)request.getAttribute("list");
	/* ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2"); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updatebar2</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	
	
	
	
	
	
	
	html{
		overflow-y: hidden;
	}
	main{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
	}
	a{
		text-decoration: none;
	}
	button{
		border: none;
	}
	ul {
    	list-style-type: none;
	}
	body{
		height: 100%;
		overflow: hidden;
	    font-size: 13px;
	    color: #222;
	}
	.layout{
		min-width: 730px;
		flex: 1 1 auto;
	   /*  display: flex; */
	    flex-direction: column;
	    height: 100vh;
	    /* overflow-y: auto; */
	}
	.layout_body{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    overflow-x: hidden;
	    min-width: 680px;
    }
    .main_section{
    	display: flex;
	    flex-direction: row;
	    flex: 1 1 auto;
	    padding: 0px 20px 0px 40px;
	    overflow-y: auto;
	    box-sizing: border-box;
	    height: calc((100vh - 108px) - 38px);
    }
    .main_section::-webkit-scrollbar {
		width:4px;
	}
	.main_section::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background-color: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	.main_section::-webkit-scrollbar-track{
		background-color: white;
	}
    .taindex{
    	min-width: 0px;
    	width: 100%;
    }
    .feedlist1{
    	padding: 16px 20px;
    	border-bottom: 1px solid rgb(225, 225, 225);
    }
    .feedlist2{
    	display: block;
	    font-size: 16px;
	    font-weight: bold;
	    line-height: 1.5;
	    color: rgb(34, 34, 34);
	    overflow-wrap: break-word;
	    margin-bottom: 9px;
    }
    .feedlist2:hover{
    	color: rgba(34, 34, 34, 0.7);
    }
    .feedlist_li{
    	display: flex;
	    flex-direction: row;
	    background-color: rgb(255, 255, 255);
	    margin-bottom: 8px;
	    margin-left: -38px;
    }
    .feedlist_li:hover{
    	background-color: rgb(250, 250, 250);
    }
    .li_1{
    	transform: translateY(1px);
    	flex-shrink: 0;
    }
    .avatar_c{
    	flex-shrink: 0;
	    position: relative;
	    width: 20px;
	    height: 20px;
	   /*  border-radius: 50%; */
	    padding: 1px;
	  /*   background-color: rgba(0, 0, 0, 0.1); */
	    content: "";
	    transition: border-color 0.3s ease 0s;
	    cursor: pointer;
    }
    /* .avatar_c::before{
    	position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    background-color: rgb(255, 255, 255);
	    transform: translate(1px, 1px);
	    width: 18px;
	    height: 18px;
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
	    content: "";
    }
    .avatar_c::after{
    	position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    width: 20px;
	    height: 20px;
	    border-radius: 50%;
	    content: "";
	    border: 2px solid rgba(0, 0, 0, 0);
	    transition: border-color 0.3s ease 0s;
    } */
    .jh::before{
    	background-image: url(https://down.collabee.co/userProfile/2972655);
    }
    .yr::before{
    	background-image: url(https://down.collabee.co/userProfile/2972613);
    }
    .jm::before{
    	background-image: url(https://down.collabee.co/userProfile/2972576);
    }
    .ta::before{
    	background-image: url(https://down.collabee.co/userProfile/2972573);
    }
    .li_2{
    	display: flex;
	    flex-direction: column;
	    padding-left: 6px;
	    padding-right: 60px;
	    position: relative;
	    flex: 1 1 auto;
	    min-width: 0px;
    }
    .li_2_1{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
    }
    .comment{
    	margin-left: 4px;
	    margin-right: 8px;
	    display: inline-block;
	    font-weight: bold;
	    font-size: 12px;
	    color: rgb(34, 34, 34);
	    flex-shrink: 0;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow: hidden;
	    overflow-wrap: break-word;
    }
    .li_2_2{
    	padding-top: 4px;
	    font-size: 12px;
	    color: rgb(136, 136, 136);
    }
    .date{
    	font-size: 12px;
    	color: rgb(136, 136, 136);
    }
    .date::before{
    	display: inline-block;
	    content: "・";
	    padding-left: 4px;
	    padding-right: 4px;
    }
    .feedfooter{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    margin-top: 9px;
    }
    .feedfooter1{
    	height: 20px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 12px;
	    color: rgb(136, 136, 136);
	    width: calc(100% - 64px);
    }
    .document{
    	display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    color: rgb(136, 136, 136);
	    font-size: 13px;
	    line-height: initial;
    }
    .image1{
    	margin-right: 10px;
    	flex-shrink: 0;
    	width: 18px;
    	height: 18px;
    }
    .document2{
    	color: rgb(136, 136, 136);
    	margin-bottom: 2px;
    }
    .document2::after{
    	content: "|";
	    display: inline-block;
	    padding-left: 10px;
	    color: rgb(216, 216, 216);
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    font-size: 13px;
	    max-width: 250px;
	    flex: 1 1 0%;
	    
    }
    .wname{
    	color: rgb(51, 132, 108);
	    overflow: hidden;
	    word-break: keep-all;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    padding-left: 10px;
    }
    .w_p{
    	color: rgb(204, 153, 0);
    }
    .more{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 12px;
	    color: rgb(193, 193, 193);
	    margin-left: 24px;
	    cursor: pointer;
	    background-color: rgb(255, 255, 255);
	    transition: color 0.2s ease 0s, fill 0.2s ease 0s;
	}
	.more:hover{
		color: black;
	}
	.emoji1{
		margin-right: 4px;
		flex-shrink: 0;
		width: 18px;
		height: 18px;
		background-image: url(data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18px' height='18px' viewBox='0 0 24 24'%3E%3Cg fill='none' fill-rule='evenodd'%3E%3Cpath d='M14.414 1L21 7.586V20c0 1.652-1.348 3-3 3H5.99A2.997 2.997 0 013 20l.01-16c0-1.653 1.338-3 2.99-3h8.414zm-.538 1.3H6c-.931 0-1.69.762-1.69 1.7L4.3 20c0 .938.759 1.7 1.69 1.7H18c.934 0 1.7-.766 1.7-1.7V8.124L13.876 2.3z' fill='%23C1C1C1' opacity='1'%3E%3C/path%3E%3C/g%3E%3C/svg%3E);
		background-size: cover;
		background-repeat: no-repeat;
		padding-top: 1.8px;
		display: flex;
		-webkit-box-align: center;
		align-items: center;
		-webkit-box-pack: center;
		justify-content: center;
	}
	.emoji2{
		position: relative;
	    display: inline-block;
	    font-size: 0;
	    margin: 0;
	    padding: 0;
	    border: none;
	    background: none;
	    box-shadow: none;
	}
	
	
	
	
	header{
		position: relative;
	    display: flex;
	    flex-direction: column;
	    flex-shrink: 0;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	}
	.top_header{
		height: 108px;
		position: relative;
	    display: flex;
	    flex-direction: row;
	}
	.top_left{
		flex: 1 1 auto;
	    display: flex;
	    flex-direction: column;
	    z-index: 2;
	    margin-top: 20px;
	    min-width: 0px;
	    margin-right: 20px;
	}
	.top_header_title{
		display: flex;
	    flex-direction: row;
	    align-items: flex-start;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    margin-left: 40px;
	}
	.update_title{
		font-size: 22px;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    display: -webkit-box;
	    -webkit-box-orient: vertical;
	    -webkit-line-clamp: 2;
	    overflow: hidden;
	}
	#bnt1_cal{
        display:flex;
    }
	#searchbar::placeholder{
        color: rgb(193, 193, 193);
    }
    #searchbar { 
        will-change: transform;
        background-color: rgba(255, 255, 255, 0);
        height:28px;
        width:144px;
        font-size:13px;
        border-radius:4px;
        border: 1px solid rgb(225, 225, 225);
        transition: border-color 0.2s ease 0s, background-color 0.2s ease 0s;
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
    .micro{
    	margin-top: 5px;
    }
    .mastersearchbar{
    	display: flex;
	    flex-direction: row;
	    position: relative;
	    align-items: flex-start;
    }
    .topright1{
    	position: relative;
	    flex: 0 0 auto;
	    width: 250px;
    }
    /* .topright{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 40px;
	    margin-top: 20px;
    }
    .btn1{
    	width: 32px;
	    height: 32px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
        cursor: pointer;
        position: relative;
        z-index: 10;
        background-image: url(https://down.collabee.co/userProfile/-1);
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
	    content: "";
    }
    .btn2{
    	width: 32px;
	    height: 32px;
	    margin-left: 8px;
	    padding-top: 4px;
	    border-radius: 4px;
	    cursor: pointer;
	    background-color: white;
    }
    .btn3{
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
    .number{
    	display: inline-block;
	    padding-left: 4px;
	    padding-right: 4px;
    } */
    button{
    	border: none;
    }
    /* .btn2:hover, .btn3:hover{
    	filter: brightness(90%);
		transition: transform 10s;
    } */
    .header_menu{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-top: 17px;
	    margin-left: 40px;
	    height: 32px;
    }
    .header_menu2{
    	position: relative;
	    display: flex;
	    flex: 1 1 auto;
	    flex-direction: row;
	    width: 100%;
	    -webkit-box-align: center;
	    align-items: center;
    }
    .header_menu3{
    	position: relative;
	    flex: 1 1 100px;
	    height: 32px;
	    margin: 0px 6px 0px 0px;
	    padding: 5px 4px;
	    min-width: 60px;
	    border-radius: 4px;
	    cursor: pointer;
	    border: 1px solid rgba(0, 0, 0, 0.05);
	    background-color: rgb(247, 246, 245);
    }
    .header_menu3:hover{
    	background-color: rgb(238, 236, 233);
    }
    .svg1{
    	display: inline-block;
	    vertical-align: middle;
	    fill: rgb(136, 136, 136);
    }
    .svg2{
    	display: inline-block;
	    vertical-align: middle;
	    fill: #ffffff;
    }
    .header_menu4{
    	vertical-align: middle;
	    font-size: 13px;
	    line-height: 17px;
	    margin-left: 4px;
	    color: rgb(34, 34, 34);
    }
    .header_menu5{
    	padding: 0px;
	    min-width: 144px;
	    width: 100%;
	    height: 32px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: center;
	    justify-content: center;
	    border-radius: 4px;
	    border: 1px solid rgba(255, 255, 255, 0.2);
	    background-color: #d9ad2b;
	    color: white;
    }
    .header_menu5:hover{
    	background-color: rgb(179, 142, 34);
    	border-color: rgb(179, 142, 34);
    }
    .subheader1{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    position: relative;
	    z-index: auto;
	    height: 38px;
	    margin: 0px 20px;
    }
    .subheader2{
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
    .nav1{
    	margin-left: 6px;
	    display: flex;
	    flex-direction: row;
    }
    .subheader3{
	    color: rgb(136, 136, 136);
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    height: 38px;
	    margin: 0px 16px;
	    font-size: 12px;
	    background-color: transparent;
	    cursor: pointer;
    }
    .subheader4{
    	position: relative;
    }
    .subheader4::after{
    	background-color: rgb(34, 34, 34);
    	position: absolute;
	    bottom: -10px;
	    left: 0px;
	    right: 0px;
	    content: "";
	    height: 1px;
	    z-index: 1;
    }
    .new{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    height: 38px;
	    margin: 0px 16px;
	    font-size: 12px;
	    font-weight: normal;
	    background-color: transparent;
	    cursor: pointer;
	    color: black;
	    font-weight: bold;
    }
    .call{
    	position: relative;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    height: 38px;
	    margin: 0px 16px;
	    font-size: 12px;
	    font-weight: normal;
	    background-color: transparent;
	    cursor: pointer;
	    color: rgb(136, 136, 136);
	    pointer-events: auto;
    }
    .call::after{
    	position: absolute;
	    bottom: 0px;
	    left: 0px;
	    right: 0px;
	    content: "";
	    height: 1px;
	    background-color: transparent;
	    z-index: 1;
    }
    .subheader_right1{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    align-self: stretch;
    }
    .subheader_right2{
    	width: 24px;
	    height: 24px;
	    border-radius: 4px;
	    display: flex;
	    -webkit-box-pack: center;
	    justify-content: center;
	    -webkit-box-align: center;
	    align-items: center;
	    min-width: inherit;
	    min-height: inherit;
	    padding-left: 0px;
	    padding-right: 0px;
	    transition: fill 0.2s ease 0s;
	    cursor: pointer;
	    pointer-events: auto;
	    background-color: transparent;
	    color: none;
    }
    .subheader_right3{
    	position: relative;
	    flex: 0 0 auto;
	    width: 250px;
    }
    .subheader1::after{
    	position: absolute;
	    bottom: 0px;
	    left: 0px;
	    right: 0px;
	    content: "";
	    height: 1px;
	    background-color: rgb(225, 225, 225);
    }
    .subheader_right3_menu{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    -webkit-box-align: center;
	    align-items: center;
	    padding-right: 20px;
    }
    .subheader_right3_menu2{
    	display: inline-block;
	    cursor: pointer;
	    font-size: 12px;
	    line-height: 1.5;
	    padding: 10px;
	    margin: 0px 3px;
	    color: rgb(34, 34, 34);
	    transition: color 0.2s ease 0s;
    }
    .file1{
    	background-color: transparent;
	    cursor: pointer;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 12px;
	    color: rgb(34, 34, 34);
	    line-height: 1.5;
	    padding: 10px 0px 10px 10px;
	    margin: 0px 0px 0px 3px;
    }
    .svg5{
    	margin-left: 4px;
	    margin-bottom: 2px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(34, 34, 34);
    }
	
	#div2{
    	display: none;
    	background: white;
	    cursor: pointer;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 12px;
	    line-height: 1.5;
	    border-radius: 4px;
	    width: 148px;
	    height: 81px;
	    margin-top: -3px;
	    margin-left: 85px;
	    position: absolute;
	    z-index: 100;
	    box-shadow: rgb(0 0 0 / 10%) 0px 3px 6px 0px;
    }
    .div2_1:hover{
		filter: brightness(90%);
		transition: transform 10s;
	}
	.div2_1{
		padding: 10px;
		background-color: white;
		height: 13px;
    	margin: 3px;
	}
	.comment_img{
		width: 11px;
		height: 11px;
		display: inline-block;
	}



	
	
	.aside{
    	flex: 0 0 auto;
	    width: 250px;
	    overflow-y: auto;
	    height: calc((100vh - 126px) - 38px);
    }
	</style>
	<script>
	$(function(){
		
		
		
		
       	$('.file1').mouseenter(function() {
       	    $("#div2").css("display","block");
       	});
       	$('.file1').mouseleave(function() {
       	    $("#div2").css("display","none");
       	});
       	
    	$( document ).ready( function() {
       	   $('.btn1').attr("title", "${name}");
       	   $('.btn1').attr({
       		   title : "${name}",
       		   style: "background-image: url(${picture});"
       	   });
	       	$('.home_option_btn1').attr({
    		   title : "${name}",
    		   style: "background-image: url(${picture});"
	    	});
       	});
	});
	</script>
</head>
<body>
	
<div class="row">	
	<div>
		<%@ include file="../WEB-INF/include/HomeSidebar.jsp" %>
	</div>	
	<main class="layout">
	<header>
	<div class="top_header">
	<div class="top_left">
	<div class="top_header_title">
		<a class="update_title" href="">업데이트</a>
		<div class="mastersearchbar">
	        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
	        <input type ="text" id=searchbar placeholder="검색"/>
	    </div>
	</div>
	<div class="header_menu">
	<div class="header_menu2">
		<button type="button" title="할 일" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">할 일</span>
		</button>
		
		<button type="button" title="일정" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">일정</span>
		</button>
		
		<button type="button" title="파일" class="header_menu3">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">파일</span>
		</button>
		
		<button type="button" title="의사결정" class="header_menu3" onClick="alert('준비 중입니다.')">
		<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		<span class="header_menu4">의사결정</span>
		</button>
		
		<div style="flex: 1 1 auto;">
	<button title="문서 작성" class="header_menu5">
	<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg2"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" color="#fff" class="Beecon__Path-sc-3x6pq4-1 jdeJZe"></path></svg>
	<span style="margin-left: 4px; font-size: 13px;">문서 작성</span>
	</button>
	</div>
	</div>
	</div>
	</div>
	
	<div class="topright1">
	<%-- <div class="topright">
	  		<button title="" class="btn1"></button>
	  		<button title="파트너 초대" class="btn2">
	  		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
	  		</button>
	  		<button class="btn3">
	  		<span>파트너</span>
	  		<span class="number">${partnerN }</span>
	  		</button>
	</div> --%>
	  	</div>
	</div>
	
	
	<div class="subheader1">
	<div class="subheader2">
	<nav class="nav1">
	<a label href="Controller?command=updatebar1" class="subheader3">
	이슈 업데이트
	</a>
	<div style="position: relative;">
		<button class="new"><span class="subheader4">뉴스피드</span></button> <!-- onClick="location.href='updatebar1.html'" -->
	</div>
	<a class="call" label href="">
	<span class="position: relative;">@호출됨</span>
	</a>
	</nav>
	<div class="subheader_right1">
		<button title="뱃지 알림(@)" class="subheader_right2">
		<svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24"><path fill="#888888" d="M11.722 22C5.748 22 2 18.88 2 12.955 2 7.151 5.942 2 12.883 2c5.369 0 8.924 3.386 8.924 8.343 0 4.595-2.322 7.11-5.708 7.11-1.644 0-2.563-.604-2.878-1.475h-.096c-.653.726-1.645 1.427-2.95 1.427-1.96 0-3.387-1.257-3.387-3.87 0-3.99 1.814-6.674 4.91-6.674 1.136 0 2.031.339 2.563.774h.097l.145-.58h2.709l-1.33 7.11c-.146.798-.049 1.354.75 1.354 1.813 0 2.974-1.814 2.974-5.006 0-4.015-2.153-6.65-6.82-6.65-5.466 0-8.561 3.893-8.561 9.044 0 4.788 2.66 7.207 7.521 7.207 2.37 0 4.426-.484 5.707-.92v1.67C16.027 21.491 14.068 22 11.722 22zm-.58-6.675c.75 0 1.305-.362 1.74-.798l.92-5.15c-.266-.315-.87-.606-1.645-.606-1.693 0-2.394 2.08-2.394 4.692 0 1.282.435 1.862 1.378 1.862z"></path></svg>
		</button>
		<button title="안 읽음" class="subheader_right2">
		<svg class="svg5" width="16" height="16" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"><polygon points="0 0 24 0 24 24 0 24"></polygon><path d="M11,17 L11,19.2 L3,19.2 L3,17 L11,17 Z M15,11 L19,15.8288889 L19,11 L21,11 L21,19.2 L19,19.2 L15,14.3711111 L15,19.2 L13,19.2 L13,11 L15,11 Z M11,11 L11,13.2 L3,13.2 L3,11 L11,11 Z M21,5 L21,7.2 L3,7.2 L3,5 L21,5 Z" fill="#888888"></path></g></svg>
		</button>
	</div>
	</div>
	
	<div class="subheader_right3">
		<div class="subheader_right3_menu">
		<a href="" class="subheader_right3_menu2">할 일</a>
		<a href="" class="subheader_right3_menu2">의사결정</a>
	<div style="position: relative;">
		<a class="file1" href="">파일함
		<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
		</a>
	</div>
		</div>
		<div id="div2">
      		<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><img src="Images/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
      		<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><img src="Images/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
   		</div>
	</div>
	</div>
	</header>
	
	
	
<div class="layout_body">
	<div class="main_section">
	<!-- <div class="updatebar2_container"></div> -->
		<div class="taindex">
		
		
		
		
		
<%
	for(ArticleDto dto : list){
		ArrayList<CommentDto> listComment = dto.getListComment();
%>		
		
		
	<div class="feedlist1">
		<a href="" class="feedlist2" documentId="<%= dto.getId() %>"><%= dto.getTitle() %></a> <%-- <%=dto.getTitle() %> --%>
		<ul>
		
<%
	for( CommentDto dto2 : listComment ){
%>			
			<li class="feedlist_li">
			<div class="li_1">
				<!-- <button size="20" class="avatar_c"></button> -->
				<img class="avatar_c" src='https://ifh.cc/g/Xrorvw.png' border='0'>
			</div>
			<div class="li_2">
				<div class="li_2_1">
					<span class="comment"><%= dto2.getContent() %></span>
				</div>
				<div class="li_2_2">
					<span><%= dto2.getName()%></span>
					<span class="date"><%= dto2.getCreation_date() %></span>
				</div>
			</div>
			</li>
<%
	}
%>			 
			
		</ul>
		
		<!-- <button class="more">
		<span class="more2">1개의 소식 더보기</span>
		<svg style="margin-left: 4px; fill: rgb(193, 193, 193);" xmlns="http://www.w3.org/2000/svg" width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#888888" fill-rule="evenodd"></path></svg>
		</button> -->
		
		<div class="feedfooter">
			<div class="feedfooter1">
				<span>
				<span class="document" title="지현">
				<span class="emoji1">
				<span class="emoji2">
				<img class="comment_img" src='https://ifh.cc/g/oTMzzg.png' border='0'>
				</span>
				</span>
				<span class="document2"><%= dto.getKanban() %></span> 
				</span>
				</span>
				<a isprivate="1" class="wname" href=""><%= dto.getWname() %></a> 
			</div>
		</div>
	</div>
<%
	}
%>

	
	</div>
	</div>
	<div class="aside">
	<%@ include file="../WEB-INF/include/Aside.jsp" %>
	</div>
	
	</div>

	</main>
	
</div>	
</body>
</html>

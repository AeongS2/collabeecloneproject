<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%@ page import="com.yr.mvc.*" %>
<%@ page import="com.yr.ajax.*" %>
<%@ page import="com.one.mvc.*" %>
<%@ page import="com.one.dao.*" %>
<%@ page import="com.jm.dao.*" %>
<%@ page import="com.jm.dto.*" %>

<%
	/* int member_id = (Integer)(session.getASttribute("member_id")); */
	HomeDao hDao = new HomeDao();
	//ArrayList<HomeRecentDto> listRecent = hDao.getRecent_Connection(4);
	//ArrayList<NoneFolderDto> listNone = hDao.getHomeWorkspace(4);
	ArrayList<HomeRecentDto> listRecent = (ArrayList<HomeRecentDto>)request.getAttribute("list"); 
	ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");
	//String corId = String.valueOf(request.getAttribute("corporation_id"));
	//int corporation_id = Integer.parseInt(corId);
	/* int member_id = Integer.parseInt(request.getParameter("member_id")); */
	int member_id = 4;
	int corporation_id = 5;
	//int corporation_id = (Integer)session.getAttribute("corporation_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>collabee.co/home</title> 
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<!-- <link href="main.css" type="text/css" rel="stylesheet"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	html {
	    position: relative;
	    min-height: 100%;
	    -webkit-tap-highlight-color: transparent;
	    overflow-x :  hidden;
	}
	html::-webkit-scrollbar {
		width:4px;
	}
	html::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background-color: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	html::-webkit-scrollbar-track{
		background-color: white;
	}
	body, html {
    	height: 100%;
    	font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		margin: 0px;
	}
	ul {
    	list-style-type: none;
	}
	a{
		text-decoration: none;
		color: black;
	}
	button{
		border: none;
	}
	.layout{
		display: flex;
	    flex-direction: row;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
	}
	.sidebar{
		z-index: 1;
		position: relative;
	    width: 240px;
	    background-color: rgb(247, 246, 245);
	    flex: 0 0 auto;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    padding-top: 72px;
	    overflow-y: auto;
	    /* margin-left: -10px;
	    margin-top: -10px; */
	}
	.left-bar{
		/* position: fixed; */
		position: relative;
	    overflow-y: auto;
	    flex: 1 1 auto;
	    overflow-x: hidden;
	}
	.left-bar::-webkit-scrollbar {
		width:4px;
	}
	.left-bar::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	.top-row{
		position: relative;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	}
	.header{
		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0px 14px 0px 20px;
	    flex: 0 1 auto;
	    height: 72px;
	    top: 0px;
	    z-index: 9;
	    background-color: rgb(247, 246, 245);
	    width: 205px;
	    position: fixed;
	}
	.collabee{
		min-width: inherit;
	    min-height: inherit;
	    padding-left: 0px;
	    padding-right: 0px;
	    transition: fill 0.2s ease 0s;
	    cursor: pointer;
	    pointer-events: auto;
	    width: auto;
	    background-color: transparent;
	    color: yellow;
	}
	.alarm{
		padding-bottom: 4px;
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
	    border: none;
	    box-sizing: border-box;
	    font-size: 12px;
	    outline: 0;
	    z-index:10;
	}
	.alarm_svg{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: gray;
	}
	.alarm_svg:hover{
		fill: #616060;
	}
	.left-navigation{
		display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    padding-bottom: 22px;
	}
	h2{
		margin: 0px;
	    padding-left: 20px;
	    padding-bottom: 2px;
	    font-size: 13px;
	    line-height: 1.54;
	    font-weight: normal;
	    color: rgb(136, 136, 136);
	}
	.svg1{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(136, 136, 136);
	}
	.fill_black{
		fill: rgb(34, 34, 34);
	}
	.menu{
		background-color: rgba(0, 0, 0, 0.05);
		cursor: pointer;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    background-color: transparent;
	    padding-left: 18px;
	    padding-right: 16px;
	    position: relative;
	    pointer-events: auto;
	}
	.menu:hover{
		background-color: #e3e3e3;
	}
	.chosen{
		background-color: #e3e3e3;
	}
	.name{
		padding: 3px 0px;
	    margin-left: 4px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-size: 14px;
	    line-height: 1.57;
	    color: rgb(34, 34, 34);
	}
	.f_name{
		padding: 3px 0px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-size: 13px;
	    color: rgb(136, 136, 136);
	}
	.bold{
		font-weight: bold;
	}
	.svg2_1{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(34, 34, 34);
	    opacity:0;
	}
	.svg2{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(34, 34, 34);
	    opacity:0;
	}
	.btn1{
		display: inline-block;
		background-color: transparent;
		position: absolute;
	    top: 50%;
	    right: 16px;
	    width: 20px;
	    height: 20px;
	    transform: translate(0px, -50%);
	}
	.menu > .btn1:hover{
		background-color: #c7c5c5;
		border-radius: 4px;
	}
	.beta{
		display: inline-block;
	    margin-left: 4px;
	    color: #a3a3a3;
	    font-size: 12px;
	    vertical-align: middle;
	}
	.private{
		display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    padding-bottom: 22px;
	}
	h2{
		margin: 0px;
	    padding-left: 20px;
	    padding-bottom: 2px;
	    font-size: 13px;
	    line-height: 1.54;
	    font-weight: normal;
	    color: rgb(136, 136, 136);
	}
	.new_workspace{
		margin: 6px 16px 8px;
	    font-weight: bold;
	    font-size: 14px;
	    line-height: 1.57;
	    padding: 5px;
	    position: relative;
	    min-height: inherit;
	    color: rgb(255, 255, 255);
	    border-radius: 4px;
	    text-align: center;
	    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(51, 132, 108);
	    background-color: rgb(51, 132, 108);
	    cursor: pointer;
	    opacity: 1;
	    width: auto;
	    box-shadow: none;
	}
	.new_workspace:hover{
		background-color: rgb(44, 111, 91);
    	border-color: rgb(44, 111, 91);
	}
	.w_search{
		box-sizing: border-box;
	    border: 1px solid rgb(193, 193, 193);
	    border-radius: 4px;
	    font-size: 13px;
	    color: rgb(34, 34, 34);
	    line-height: 1.54;
	    width: 100%;
	    padding: 4px 24px 4px 26px;
	}
	.w_search:hover{
		border: 1px solid black;
	}
	.createFolder{
		display: flex;
	    flex-direction: column;
	    padding-left: 16px;
	    padding-right: 16px;
	}
	.btn2{
		position: relative;
	    cursor: pointer;
	    background-color: transparent;
	}
	.btn2::before{
		position: absolute;
	    right: 0px;
	    left: 0px;
	    height: 1px;
	    background-color: rgb(230, 230, 230);
	    content: " ";
	    top: 50%;
	}
	.contents{
		position: relative;
	    display: inline-flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    background-color: rgb(247, 246, 245);
	    font-size: 12px;
	    color: rgb(136, 136, 136);
	    padding: 5px 4px;
	}
	.svg3{
		margin-right: 4px;
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(193, 193, 193);
	}
	.folder1{
		flex: 1 0 auto;
	    width: 100%;
	    box-sizing: border-box;
	    min-width: 0px;
	}
	.f_container{
		position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-top: 0px;
	    margin-bottom: 0px;
	    user-select: none;
	    padding: 0px 0px 0px 4px;
	    cursor: pointer;
	    background-color: transparent;
	}
	.f_container:hover{
		background-color: #e3e3e3;
	}
	.svg4{
		visibility: hidden;
	    flex-shrink: 0;
	    margin-right: 2px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(193, 193, 193);
	}
	.f_container2{
		flex: 1 0 auto;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-left: 0px;
	    width: 0px;
    }
    .f_container3{
	    display: flex;
	    flex: 1 0 auto;
	    width: 100%;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    padding-right: 16px;
    }
    .svg5{
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(136, 136, 136);
    }
    .f_container4{
	    display: flex;
	    flex: 1 0 auto;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 2px 0px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-size: 13px
	    color: rgb(136, 136, 136)
    }
    .btn3{
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
	    font-weight: 400;
	    color: gray;
    }
    .w_list{
	    flex: 1 0 auto;
	    width: 100%;
	    box-sizing: border-box;
	    min-width: 0px;
	    margin-left: 10px;
	    margin-top: -5px;
    }
    .sidebar-footer{
	    display: flex;
	    flex-direction: column;
	    color: rgb(136, 136, 136);
	    font-size: 12px;
	    line-height: 1.5;
	    padding-top: 40px;
	    padding-left: 20px;
	    padding-bottom: 90px;
    }
    /* 사이드바 끝??? */
    
    .top_left{
		flex: 1 1 auto;
	    display: flex;
	    flex-direction: column;
	    z-index: 2;
	    margin-top: 10px;
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
	.home_title{
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
    #searchbar { /*상단 검색창  / 클릭하면 길어지면서 문서작성 버튼 없어짐(할지말지 고민중) */
        will-change: transform;
        background-color: rgba(255, 255, 255, 0);
        height:28px;
        width:86px;
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
    .layout2{
	    z-index: 2;
	    flex: 1 1 auto;
	    display: flex;
	    flex-direction: column;
	    height: 100vh;
	    overflow-y: auto;
	    min-width: 690px;
    }
    .layout3{
	    max-width: 1210px;
    	min-width: 700px;
	    margin: 0px auto;
	    width: 100%;
    }
    .body_header{
	    position: relative;
	    display: flex;
	    flex-direction: column;
	    flex-shrink: 0;
	    -webkit-box-align: stretch;
	    align-items: stretch;
    }
    .body_header2{
	    position: relative;
	    display: flex;
	    flex-direction: row;
	    height: 108px;
    }
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
   	.svg11{
    	display: inline-block;
	    vertical-align: middle;
	    fill: rgb(136, 136, 136);
    }
    .svg21{
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
	    cursor: pointer;
    }
    .header_menu5:hover{
    	background-color: rgb(179, 142, 34);
    	border-color: rgb(179, 142, 34);
    }
    .topright1{
    	position: relative;
	    flex: 0 0 auto;
	    width: 250px;
    }
    .topright{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 60px;
    	margin-top: 11px;
    }
    .btn11{
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
    /* .btn11::before{
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
    } */
    .btn21{
    	width: 32px;
	    height: 32px;
	    margin-left: 8px;
	    padding-top: 4px;
	    border-radius: 4px;
	    cursor: pointer;
	    background-color: white;
    }
    .btn21:hover{
    	background-color: #f2f2f2;
    }
    .btn31{
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
    .btn31:hover{
    	background-color: #f2f2f2;
    }
    .number{
    	display: inline-block;
	    padding-left: 4px;
	    padding-right: 4px;
    }
    .subheader_right3{
    	position: relative;
	    flex: 0 0 auto;
	    width: 250px;
    }
    .subheader_right3_menu{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    -webkit-box-align: center;
	    align-items: center;
	    padding-right: 48px;
    	padding-top: 11px;
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
    .svg51{
    	margin-left: 4px;
	    margin-bottom: 2px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(34, 34, 34);
    }
    .body_body{
	    position: relative;
	    display: flex;
	    -webkit-box-flex: 1;
	    flex-grow: 1;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    overflow-x: inherit;
	    min-width: auto;
	    margin: 0px 38px 80px;
	    flex-direction: column;
    }
    .homeBanner{
	    position: relative;
	    width: 100%;
	    min-height: 160px;
	    margin-top: 30px;
	    border-radius: 16px;
	    background-color: rgb(240, 243, 251);
	    background-image: url(https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/appletest.93bd6295.png);
	    background-size: 640px 160px;
	    background-position: 50% 0px;
	    background-repeat: no-repeat;
	    cursor: pointer;
    }
    .homeBanner2{
	    position: absolute;
	    inset: 0px;
	    padding: 20px 0px 0px 24px;
    }
    h3{
	    font-size: 18px;
	    line-height: 24px;
	    font-weight: 700;
	    color: #222;
	    cursor: pointer;
	    margin: 0;
    }
    .disc{
	    margin-top: 8px;
	    font-size: 13px;
	    line-height: 20px;
    }
    .btn100{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 64px;
	    height: 64px;
	    outline: rgba(255, 255, 255, 0.2) solid 2px;
	    border-radius: 50%;
	    background-color: rgb(230, 193, 46);
	    box-shadow: rgb(217 173 43 / 50%) 0px 4px 8px 0px;
	    font-size: 0px;
	    cursor: pointer;
    }
    .btn100::before{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 32px;
	    height: 32px;
	    background-image: url(https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_home_banner_triangle.fa35f0b8.png);
	    background-size: 32px 32px;
	    content: "";
    }
    .recentList_btn1{
	    position: relative;
	    left: -4px;
	    font-size: 18px;
	    font-weight: bold;
	    margin: 46px 0px 6px;
	    padding: 0px 4px;
	    line-height: 28px;
	    background-color: rgb(255, 255, 255);
	    color: rgb(34, 34, 34);
	    cursor: pointer;
    }
    .recent_svg1{
	    margin-top: -7px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(34, 34, 34);
    }
    .recentList1{
	    display: flex;
	    flex-wrap: wrap;
	    -webkit-box-pack: start;
	    justify-content: flex-start;
	    gap: 20px;
	    width: 100%;
    }
    .recent_container{
	    display: inline-block;
	    position: relative;
	    overflow: hidden;
	    width: 107px;
    	height: 122px;
	    padding: 14px 16px 0px;
	    border-radius: 16px;
	    box-shadow: rgb(0 0 0 / 10%) 0px 3px 6px 0px;
	    vertical-align: top;
	    word-break: break-all;
	    cursor: pointer;
    }
    .recent_container:hover{
	    position: relative;
	    top: -4px;
	    box-shadow: rgb(0 0 0 / 30%) 0px 5px 10px 0px;
    }
    .recent_container2{
	    display: -webkit-box;
	    -webkit-line-clamp: 3;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    -webkit-box-orient: vertical;
	    overflow-wrap: break-word;
	    font-size: 14px;
	    font-weight: bold;
	    line-height: 1.71;
	    color: rgb(255, 255, 255);
	    text-shadow: rgb(0 0 0 / 10%) 0px 1px 1px;
    }
    .recent_container3{
	    display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    position: absolute;
	    height: 16px;
	    right: 0px;
	    left: 0px;
	    bottom: 0px;
	    padding: 12px 16px;
	    background-color: rgba(0, 0, 0, 0.05);
	    font-size: 12px;
	    color: rgb(255, 255, 255);
    }
    .recent_svg2{
	    position: absolute;
	    right: 13px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgba(255, 255, 255, 0.5);
    }
    .recent_container4{
    	z-index: 3;
	    margin-left: -10px;
	    padding: 2px;
	    background: rgba(217, 173, 43, 0.05);
	    flex-shrink: 0;
	    position: relative;
	    width: 20px;
	    height: 20px;
	    border-radius: 50%;
	    cursor: pointer;
    }
    .recent_container4::before{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    z-index: 1;
	    display: block;
	    background-color: rgb(255, 255, 255);
	    width: 18px;
	    height: 18px;
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
	    content: "";
    }
    .private::before{
    	background-image: url(https://down.collabee.co/userProfile/1);
    }
    .recent_container4::after{
	    position: absolute;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%);
	    width: 26px;
	    height: 26px;
	    padding: 0px;
	    display: block;
	    border-radius: 50%;
	    content: "";
	    transition: border-color 0.3s ease 0s;
    }
    .NofolderList{
	    width: 100%;
	    margin-top: 64px;
	    display: flex;
	    flex-wrap: wrap;
	    -webkit-box-pack: start;
	    justify-content: flex-start;
	    gap: 20px;
    }
    .btn100:hover{
    	background-color: rgb(167 139 31);
    }
    .FolderList{
	    width: 100%;
	    margin-top: 15px;
    }
    .recent_svg3{
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    transition: fill 0.2s ease 0s;
	    fill: rgb(136, 136, 136);
    }
    .recentList_btn2{
    	display: none;
	    width: 24px;
	    height: 24px;
	    margin-left: -6px;
	    margin-top: 48px;
	    padding-left: 0px;
	    padding-right: 0px;
	    transition: fill 0.2s ease 0s;
	    cursor: pointer;
	    pointer-events: auto;
	    width: auto;
	    background-color: transparent;
	    text-decoration: none;
    }
    .FolderList_List{
	    display: flex;
	    flex-wrap: wrap;
	    -webkit-box-pack: start;
	    justify-content: flex-start;
	    gap: 20px;
	    width: 100%;
    }
    .createW_btn{
	    display: inline-block;
	    position: relative;
	    width: 140px;
	    height: 140px;
	    padding: 14px 16px;
	    border-radius: 16px;
	    background-image: url(https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/bg_home_projectbox_dashline.27b1d3f3.png);
	    background-repeat: no-repeat;
	    background-size: 140px 140px;
	    background-color: rgb(255, 255, 255);
	    vertical-align: top;
	    text-align: center;
	    word-break: break-all;
	    cursor: pointer;
    }
    .createW_btn:hover{
	    position: relative;
	    top: -4px;
	    box-shadow: rgb(0 0 0 / 30%) 0px 5px 10px 0px;
    }
    .createW_svg{
	    padding: 6px 0px 0px 6px;
	    display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
		stroke: rgb(255, 255, 255);
	    stroke-width: 2%;
	    fill: rgb(189, 186, 183);
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
	    margin-left: 55px;
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
	.float_root{
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
	.frame1{
		box-shadow: none;
	    overflow: hidden;
	    width: 854px;
	    height: 600px;
	    max-width: 960px;
	    margin: 0 auto;
	    display: flex;
	    position: relative;
	    flex-direction: column;
	    top: 15%;
	}
	.B_Movie{
		position: relative;
	    background-color: transparent;
	    height: 540px;
	}
	.B_Movie2{
		margin-top: 60px;
	    width: 854px;
	    height: 480px;
	    box-sizing: border-box;
	}
	.B_Movie_close{
		position: absolute;
	    top: 0px;
	    right: 0px;
	    width: 48px;
	    height: 48px;
	    padding: 8px;
	    border-radius: 8px;
	    background-color: rgba(0, 0, 0, 0.4);
	    cursor: pointer;
	}
	.B_Movie_close:hover{
		background-color: rgba(0, 0, 0, 0.8);
	}
	.B_Movie_close_svg{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    fill: rgb(193, 193, 193);
	}
	.alarm_expl{
		position: absolute;
		z-index: 101;	
		display: none;	
		outline: none;
	    width: 236px;
    	background-color: rgb(255, 255, 255);
	    height: 220px;
	    box-shadow: 0px 5px 5px -3px rgb(0 0 0 / 20%), 0px 8px 10px 1px rgb(0 0 0 / 14%), 0px 3px 14px 2px rgb(0 0 0 / 12%);
	}
	h6{
		all: unset;
	    display: block;
	    font-size: 12px;
	    line-height: 1.5;
	    color: rgb(136, 136, 136);
	    padding: 12px 0px 4px 18px;
	}
	.alarm_expl2{
		display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    padding-top: 0px;
	    padding-bottom: 12px;
	}
	.alarm_btn1{
		font-size: 13px;
	    font-weight: normal;
	    color: rgb(34, 34, 34);
	    text-align: left;
	    position: relative;
	    line-height: 1.5;
	    border-radius: 3px;
	    padding: 5px 18px;
	    background-color: transparent;
	    cursor: pointer;
	    border: none;
	}
	.alarm_btn1:hover{
		background-color: rgb(242, 242, 242);
    	border-color: rgb(242, 242, 242);
	}
	.alarm_expl3{
		display: flex;
	    flex-direction: column;
	    -webkit-box-align: stretch;
	    align-items: stretch;
	    border-top: 1px solid rgb(225, 225, 225);
	    padding: 12px 0px;
	}
	.alarm_expl4{
		position: relative;
		color: rgb(34, 34, 34);
	    font-size: 12px;
	    font-weight: 500;
	    line-height: 1.5;
	    padding: 5px 18px;
	    cursor: pointer;
	}
	.alarm_expl4:hover{
		background-color: rgb(242, 242, 242);
    	border-color: rgb(242, 242, 242);
	}
	.folder_namebox{
		display: none;
		position: relative;
	    padding: 2px 8px;
	    width: 100%;
	    font-size: 13px;
	    line-height: 1.54;
	    color: rgb(34, 34, 34);
	    background-color: rgb(255, 255, 255);
	    box-shadow: rgb(51 132 108) 0px 0px 0px 1px inset;
	    border: 4px solid rgba(51, 132, 108, 0.2);
	    border-radius: 8px;
	    box-sizing: border-box;
	}
	.folder_namebox:focus{
		outline: none;
	}
	.svg22{
		transition: fill 0.2s ease 0s;
    	fill: rgb(163, 163, 163);
	}
	.home_option{
		position: absolute;
	    display: none;
	    z-index: 101;
	}
	.home_option2{
		width: 290px;
	    border-radius: 4px;
	    box-shadow: rgb(0 0 0 / 10%) 0px 0px 8px 2px;
	    background-color: rgb(255, 255, 255);
	}
	.home_option_header{
		flex-shrink: 0;
	    margin-right: 16px;
	    display: flex;
	    flex-direction: row;
	}
	.home_option_btn1{
		margin-top: 17px;
	    margin-left: 27px;
		flex-shrink: 0;
	    position: relative;
	    width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
	     background-image: url(https://down.collabee.co/userProfile/-1);
	    background-size: cover;
	    background-position: center center;
	    transition: border-color 0.3s ease 0s;
	    cursor: pointer;
	}
	/* .home_option_btn1:before{
		position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    background-color: rgb(255, 255, 255);
	    transform: translate(1px, 1px);
	    width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    content: "";
	} */
	.home_option_btn1:after{
		position: absolute;
	    display: block;
	    top: -1px;
	    left: -1px;
	    width: 58px;
	    height: 58px;
	    border-radius: 50%;
	    content: "";
	    border: 2px solid rgba(0, 0, 0, 0);
	   /*  transition: border-color 0.3s ease 0s; */
	}
	.home_option_btn1:hover::after{
		border-color: rgb(217, 173, 43);
	}
	.home_option_ul{
		display: flex;
	    flex-direction: column;
	    -webkit-box-pack: center;
	    justify-content: center;
	    padding-left: 24px;
	}
	.home_option_btn2{
		width: 100%;
	    text-align: left;
	    font-size: 16px;
	    font-weight: bold;
	    line-height: 1.38;
	    margin-left: -7px;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow-wrap: normal;
	    overflow: hidden;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(34, 34, 34);
	    pointer-events: auto;
	}
	.home_option_btn2:hover{
		color: rgb(136, 136, 136);
	}
	.home_option_li{
		font-size: 12px;
	    line-height: 1.5;
	    color: rgb(136, 136, 136);
	    margin-top: 2px;
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow-wrap: normal;
	    overflow: hidden;
	}
	.home_option_container{
		border-top: 1px solid rgb(225, 225, 225);
	    padding: 18px 0px;
	    display: flex;
	    flex-direction: column;
	}
	.home_option_container2{
		display: block;
	    color: rgb(34, 34, 34);
	    font-size: 13px;
	    line-height: 1.54;
	    padding: 4px 4px 4px 18px;
	    background-color: rgb(255, 255, 255);
	    transition: background-color 0.2s ease 0s;
	}
	.home_option_container2:hover{
		background-color: rgb(242, 242, 242);
	    cursor: pointer;
	}
	.home_option_btn3{
		outline: 0;
		border: none;
	    box-sizing: border-box;
		text-align: left;
	    display: block;
	    color: rgb(34, 34, 34);
	    font-size: 13px;
	    line-height: 1.54;
	    padding: 4px 4px 4px 18px;
	    background-color: rgb(255, 255, 255);
	    transition: background-color 0.2s ease 0s;
	}
	.home_option_btn3:hover{
		background-color: rgb(242, 242, 242);
	    cursor: pointer;
	}
    .calendar_button{
    	background-color: rgba(0, 0, 0, 0.05);
		cursor: pointer;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    background-color: transparent;
	    padding-right: 16px;
	    padding-left: 0px;
	    position: relative;
	    font-size: 14px;
	    line-height: 1.57;
	    color: rgb(34, 34, 34);
	    pointer-events: auto;
	    width: 100%;
	}
	.calendar_button:hover{
		background-color: #e3e3e3;
    }
    .calendar2{
	    cursor: pointer;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    background-color: transparent;
	    padding-left: 20px;
	    padding-right: 16px;
    }
	input[type="checkbox"]{
        display: none;
	}
	input[type="checkbox"] + label{
		display: inline-block;
	    vertical-align: middle;
	    shape-rendering: inherit;
	    width: 10px;
        height: 10px;
        border: 1px solid black;
        cursor: pointer;
        border-radius: 2px;
	}
	.div_background{
		display: none;
		z-index: 100;
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom : 0;
		width: 100%;
		height: 100%;
		background-color: transparent;
	}
	.folder_selection0{
		display: none;
		position: absolute;
		z-index: 101;
	}
	.folder_selection{
		border-radius: 4px;
	    box-shadow: rgb(0 0 0 / 10%) 0px 0px 6px 2px;
	    background-color: rgb(255, 255, 255);
	    padding: 12px 0px;
	    min-width: 160px;
	    max-width: 100%;
	    display: flex;
	    flex-direction: column;
	}
	.folder_selection_btn1{
		cursor: pointer;
	    font-size: 13px;
	    line-height: 1.54;
	    color: rgb(34, 34, 34);
	    padding: 5px 18px 3px;
	    background-color: transparent;
	    text-align: left;
	}
	.folder_selection_btn1:hover{
		background-color: rgb(242, 242, 242);
	}
	</style>
	<style>
	.chosen{
		background-color: #e3e3e3;
	}
	.layout > .hidden{
		display: none;
	}
	</style>
	
	
	
	<script>
	$(function(){
		
		$('.calendar_button').click(function (){
        	alert("준비 중입니다.");
      	});
		
		$('.menu').click(function(){
			var idx = $(this).index();
			//alert(idx);
			if(idx==5){
				alert("준비 중입니다.");
			}
		});
		
		$("#makingsample, #language").click(function(){
			alert("준비 중입니다.");
		});
		
		$('.btn2').click(function (){
        	if($('.folder_namebox').css('display')=='none') {
        		$('.folder_namebox').css('display','block');
        		$('.folder_namebox').focus();
        	} else {
        		$('.folder_namebox').css('display','none');
        	}
      	});
		
		$('.folder_namebox').focusout(function (e){
			$('.folder_namebox').css('display','none');
		});
		
		$('#fileupload0').click(function(e){
    		e.preventDefault();
    		$('#fileupload').click();
    	});
		
		$('.file1').mouseenter(function() {
            $("#div2").css("display","block");
		});
        $('.file1').mouseleave(function() {
            $("#div2").css("display","none");
        });
        
        $('.f_container').mouseenter(function(){
        	$(this).find('.svg2').css('opacity', '1');
        	$(this).find('.svg4').css('visibility', 'visible');
        });
        $('.f_container').mouseleave(function(){
        	$(this).find('.svg2').css('opacity', '0');
        	$(this).find('.svg4').css('visibility', 'hidden');
        });
        
        $('.menu').mouseenter(function(){
        	$(this).find('.svg2_1').css('opacity', '1');
        });
        $('.menu').mouseleave(function(){
        	$(this).find('.svg2_1').css('opacity', '0');
        });
        
        $('.btn2').mouseenter(function(){
        	$(this).children("span").css('color', 'rgb(0,0,0)');
        	$(this).find('.svg3').css('fill', 'rgb(0,0,0)');
        });
        $('.btn2').mouseleave(function(){
        	$(this).children("span").css('color', 'rgb(136,136,136)');
        	$(this).find('.svg3').css('fill', 'rgb(136,136,136)');
        });
        
        $(document).ready(function(){
        $('.recentList_btn1').click(function(){
	       		var idx = $(this).parent().index();
	       		//alert("B , idx:"+idx);
	       		if(idx==1) {
	       			$(this).next("div").toggleClass("hidden");
	           		if($(this).next("div").hasClass("hidden")===true){
	               		//$(this).children().first().css('transform', 'scaleY(-1)');
	               		$(this).find('.recent_svg1').css('transform', 'scaleY(-1)');
	               	}else{
	               		$(this).children().first().css('transform', 'scaleY(1)');
	               	}
	       		} else {
	        		$(this).parent().find('.FolderList_List').toggleClass("hidden");
	        		if($(this).parent().find('.FolderList_List').hasClass("hidden")===true){
	            		$(this).find('.recent_svg1').css('transform', 'scaleY(-1)');
	            	}else{
	            		$(this).find('.recent_svg1').css('transform', 'scaleY(1)');
	            	}
	       		}
	       	});
        });
        $('.f_container4').click(function(){
        	$(this).parent().parent().next('.w_list').toggleClass("hidden");
        	if($(this).parent().parent().next('.w_list').hasClass("hidden")===true){
        		$(this).find('.svg22').css('transform', 'scaleY(-1)');
        	}else{
        		$(this).find('.svg22').css('transform', 'scaleY(1)');
        	}
        });
        
       	$('.homeBanner2').click(function(){
       		$('.float_root').css('display', 'block');
       	});
       	$('.B_Movie_close').click(function(){
       		$('.float_root').css('display', 'none');
       	});
        
       	$('.folder1').sortable({
   			revert: true,
   			axis : 'y',
   			cursor: "grabbing",
   			update: function(event, ui){
   				var arrWorkspaceId = new Array();
   				$('.f_container').each(function(index){
   					var workspaceId = $(this).attr('workspaceId');
   					arrWorkspaceId.push(workspaceId);
   				});
   				alert(arrWorkspaceId);
   				$.ajax({
   					type: "post",
   					url: 'WorkspaceOrderServlet',
   					traditional : true,
   					data : {
   						'main' : arrWorkspaceId
   					},
   					datatype: "json",
   					success: function(data){
   						//alert("success");
   					},
   					error: function(r,e,s){
   						alert("error!!!");
   					}
   				});
   			}
       	});
       	
       	/* $('.w_list').sortable({
   			revert:true,
   			cursor: "grabbing"
       	}); */
       	
       	/* $(document).ready(function() {
			$("#calendar-total").click(function() {
				if($("#calendar-total").is(":checked")) $("input[name=cld]").prop("checked", true);
				else $("input[name=cld]").prop("checked", false);
			});
			
			$("input[name=cld]").click(function() {
				var total = $("input[name=cld]").length;
				var checked = $("input[name=cld]:checked").length;
				
				if(total != checked) $("#calendar-total").prop("checked", false);
				else $("#calendar-total").prop("checked", true); 
			});
		}); */
       	
       	$('.btn11').click(function (){
        	var px = $(this).offset().left - 260;
        	var py = $(this).offset().top + 30;
        	if($('.home_option').css('display')=='none') {
        		$('.home_option').css('display','block');
        		$('.home_option').css('left',px+'px');
            	$('.home_option').css('top',py+'px');
        		$('.div_background').css('display', 'block');
        	} else {
        		$('.home_option').css('display','none');
        		$('.div_background').css('display', 'none');
        	}
       });
       	
       	
		$('.alarm').click(function (){
        	var px = $(this).offset().left;
        	var py = $(this).offset().top + 30;
        	if($('.alarm_expl').css('display')=='none') {
        		$('.alarm_expl').css('display','block');
        		$('.alarm_expl').css('left',px+'px');
            	$('.alarm_expl').css('top',py+'px');
        		$('.div_background').css('display', 'block');
        	} else {
        		$('.alarm_expl').css('display','none');
        		$('.div_background').css('display', 'none');
        	}
       });
		
		
		/*$('.svg2').click(function (){
        	var px = $(this).offset().left;
        	var py = $(this).offset().top + 10;
        	$('.folder_selection0').css('left',px+'px');
        	$('.folder_selection0').css('top',py+'px');
        	$('.div_background').css('display', 'block');
			$('.folder_selection0').css('display', 'block');
       });*/
		
       	$('.div_background').click(function() {
        	$('.div_background').css('display', 'none');
      		if($('.home_option').css('display')!='none'){
       			$('.home_option').css('display','none');
      		}else if($('.alarm_expl').css('display')!='none'){
      			$('.alarm_expl').css('display','none');
      		}else if($('.folder_selection0').css('display')!='none'){
      			$('.folder_selection0').css('display','none');
      		}
      	});
       	
       	$( document ).ready( function() {
       	   $('.btn11').attr("title", "${name}");
       	   $('.btn11').attr({
       		   title : "${name}",
       		   style: "background-image: url(${picture});"
       	   });
	       	$('.home_option_btn1').attr({
	    		   title : "${name}",
	    		   style: "background-image: url(${picture});"
	    	});
       	});
       	
       	$("#logout").click(function(){
			var result2 = confirm("로그아웃을 진행하시겠습니까?");
			if(result2){
				$.ajax({
					type: 'get',
					url: 'Option1MemberLogoutServlet',
					success: function(d){
						
					},
					error: function(r,s,e){
						alert("error");
					}
				});
			}
		});
       	
	});
	</script>
	
	<!-- 추가한거 -->
	<script>
	$(function(){
		$(".header_menu5").on("click", function(){ //문서작성버튼
			$.ajax({
				type:"post",
				url:"Controller?command=writedocument",
				data:{
					"loginId":4,
					"workspaceId":4
				},
				datatype:"json",
				success:function(data){
					location.href="Document.jsp?documentId="+data.document_id;
				},
				error:function(data){
					alert("error!");
				}
			});			
			
		});
		
		$("button[title='일정']").on("click", function(){ //일정모달 띄우기
			$("#schedule").removeClass("hidden");
		});
		
		$(".new_workspace").on("click", function(){//협업공간 만들기
			$("#cws").removeClass("none");
		});
		
		$(".recent_container").on("click", function(){ //공간 아이콘 누르면 협업공간으로 이동
			var workspaceId = $(this).attr("workspaceId");
			var workspaceName = $(this).find(".recent_container2").text().replace(/\s/g, "");
			location.href="workspace_index.jsp?workspaceId="+workspaceId+"&workspaceName="+workspaceName;
		});
		
		$("#private_Workspace").click(function(){
			location.href="workspace_index.jsp?workspaceId=4&workspaceName=프라이빗 공간";
		});
		
	});
	</script>
	
	<script>
		$(function () {
		 	$(".header_menu_Todo").click(function() {
				$("#todo_modal_include").css('display', 'block');
			}); 
		 	
		});
		
	</script>
</head>
	<div id="todo_modal_include" style="display: none"> 
		<%@ include file="./WEB-INF/include/Todo_modal.jspf"%>
	</div>

<body style="overflow-x: hidden;">
	<div class="div_background"></div>

	<div class="home_option">
		<div class="home_option2">
			<div class="home_option3">
				<div class="home_option_header">
					<button class="home_option_btn1" onClick="location.href='Controller?command=option1'"></button>
					<ul class="home_option_ul">
						<li>
							<button class="home_option_btn2" onClick="location.href='Controller?command=option1'">${name }</button>
						</li>
						<li class="home_option_li">${email }</li>
						<li class="home_option_li" style="color: rgb(204, 153, 0);">${corName }</li>
					</ul>
				</div>
				<div class="home_option_container">
					<a class="home_option_container2" href="Controller?command=option1">설정</a>
					<a class="home_option_container2" href="0option2.jsp">알림</a>
				 	<%
					if (corporation_id != 0){
					%>
					<a class="home_option_container2" href="0corporation1.jsp">회사 관리</a>
					<%
					}else{
					%>
					<a class="home_option_container2" href="Controller?command=option1">회사 찾기 및 만들기</a>
					<% 
					}
					%>
					<a class="home_option_container2" href="partner_management.jsp">파트너 관리</a>
				</div>
				<div class="home_option_container">
					<a class="home_option_container2" href="setting_price.jsp">가격 및 결제</a>
					<button class="home_option_btn3" id="makingsample">샘플 공간, 문서 만들기</button>
					<a class="home_option_container2" href="0help1.jsp" target="_blank">사용 가이드</a>
					<a class="home_option_container2" onclick="alert('준비 중입니다.')">데스크탑 앱 다운로드</a>
				</div>
				<div class="home_option_container">
					<button class="home_option_btn3" id="language">Language</button>
				</div>
				<!-- //로그아웃하는거 Action이동 -->
				<div class="home_option_container">
					<button class="home_option_btn3" id="logout">로그아웃</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="alarm_expl0">
		<div class="alarm_expl">
			<h6>방해금지 모드</h6>
			<div class="alarm_expl2">
				<button class="alarm_btn1">1시간 동안 알림 끄기</button>
				<button class="alarm_btn1">2시간 동안 알림 끄기</button>
				<button class="alarm_btn1">4시간 동안 알림 끄기</button>
				<button class="alarm_btn1">아침까지 알림 끄기 (오전 9시)</button>
			</div>
			<div class="alarm_expl3">
				<a class="alarm_expl4" href="">알림 설정</a>
			</div>
		</div>
	</div>
	<div class="layout">
	<nav class="sidebar">
	<div class="left-bar">
		<div class="top-row">
			<header class="header">
				<a class="collabee" href="0CollabeeHome.jsp">
					<svg xmlns="http://www.w3.org/2000/svg" width="112" height="27" viewBox="0 0 800 188" version="1.1"><title>Collabee</title><g id="collabee" stroke="none" stroke-width="1" fill="#d9ad2b" fill-rule="evenodd"><g id="collabee_logo" transform="translate(-2199.000000, -306.000000)" fill="#d9ad2b"><g id="Group-2" transform="translate(1900.000000, 0.000000)"><path d="M394.31736,411.192678 L417.772183,434.563735 C431.409272,448.147302 431.409272,470.20286 417.772183,483.79636 C404.271464,497.265165 382.447985,497.399853 368.790516,484.200424 L368.37917,483.79636 L330.119875,445.663888 C335.495266,451.009544 355.591986,449.437092 369.215732,436.194694 L369.62657,435.789832 L394.31736,411.192678 Z M958.789528,358 C972.762337,358 983.522145,361.558521 990.919865,368.785622 C998.141831,375.841021 1001.80953,385.861327 1001.99287,398.676013 L1002,400.068742 L1001.96144,404.945938 L1001.93,407.761854 C1000.22947,407.918136 997.711771,408.003156 994.376916,408.016913 C994.020503,408.018384 993.490522,408.019787 992.809816,408.021116 L992.333934,408.021991 C991.919175,408.022711 991.459464,408.023407 990.958717,408.024078 L990.338374,408.024872 C990.018605,408.025262 989.684627,408.025644 989.337286,408.026016 L988.625039,408.026747 C988.503445,408.026867 988.380429,408.026986 988.256022,408.027103 L987.287029,408.027973 C986.789723,408.028398 986.273584,408.028807 985.740315,408.029199 L984.651445,408.029961 C984.096097,408.03033 983.524756,408.030683 982.939128,408.031019 L981.141092,408.031971 L980.833804,408.032119 L980.833804,408.032119 L979.267568,408.032815 C979.055584,408.032903 978.842391,408.032988 978.628053,408.033071 L976.005067,408.03397 L975.670671,408.034068 L975.670671,408.034068 L971.917492,408.034921 C971.686564,408.03496 971.455123,408.034997 971.223231,408.035031 L961.392174,408.035042 L961.044317,408.034987 L961.044317,408.034987 L957.274365,408.034114 C957.049716,408.034046 956.825879,408.033976 956.602919,408.033902 L954.621625,408.033164 C954.404488,408.033073 954.188416,408.032979 953.973472,408.032883 L952.697858,408.03227 C952.487681,408.032162 952.278758,408.032051 952.071154,408.031937 L950.841848,408.031218 C950.639768,408.031093 950.439133,408.030964 950.240004,408.030832 L949.063829,408.030005 C948.225368,408.029379 947.417791,408.028694 946.646288,408.027951 L945.738132,408.027029 C943.364331,408.024495 941.381196,408.021342 939.958826,408.01751 C940.022181,411.542318 941.702566,415.234262 945.378473,417.846532 C949.05438,420.458802 955.681971,423.549841 963.527798,423.549841 C971.79489,423.549841 978.541852,422.700011 983.495419,421.057128 C987.517595,419.723146 991.333122,417.875032 994.604438,415.78136 L994.604859,434.581126 C992.937836,435.593133 990.896711,436.632681 988.415131,437.615306 C982.727235,439.867528 973.650163,442 964.823689,442 C955.997215,442 946.949276,440.787809 939.956585,437.934714 C932.805324,435.019982 924.735595,430.268372 920.456361,424.131336 C916.13993,417.937166 914,410.275826 914,401.224578 C914,387.29112 917.91971,376.500379 925.832175,369.054325 C933.690649,361.656092 944.723719,358 958.789528,358 Z M1055.78953,358 C1069.76234,358 1080.52214,361.558521 1087.91987,368.785622 C1095.14183,375.841021 1098.80953,385.861327 1098.99287,398.676013 L1099,400.068742 L1098.96144,404.945938 L1098.93,407.761854 C1097.22947,407.918136 1094.71177,408.003156 1091.37692,408.016913 C1091.0205,408.018384 1090.49052,408.019787 1089.80982,408.021116 L1089.33393,408.021991 C1088.91918,408.022711 1088.45946,408.023407 1087.95872,408.024078 L1087.33837,408.024872 C1087.0186,408.025262 1086.68463,408.025644 1086.33729,408.026016 L1085.62504,408.026747 C1085.50344,408.026867 1085.38043,408.026986 1085.25602,408.027103 L1084.28703,408.027973 C1083.78972,408.028398 1083.27358,408.028807 1082.74032,408.029199 L1081.65145,408.029961 C1081.0961,408.03033 1080.52476,408.030683 1079.93913,408.031019 L1078.14109,408.031971 L1077.8338,408.032119 L1077.8338,408.032119 L1076.26757,408.032815 C1076.05558,408.032903 1075.84239,408.032988 1075.62805,408.033071 L1073.00507,408.03397 L1072.67067,408.034068 L1072.67067,408.034068 L1068.91749,408.034921 C1068.68656,408.03496 1068.45512,408.034997 1068.22323,408.035031 L1058.39217,408.035042 L1058.04432,408.034987 L1058.04432,408.034987 L1054.27436,408.034114 C1054.04972,408.034046 1053.82588,408.033976 1053.60292,408.033902 L1051.62163,408.033164 C1051.40449,408.033073 1051.18842,408.032979 1050.97347,408.032883 L1049.69786,408.03227 C1049.48768,408.032162 1049.27876,408.032051 1049.07115,408.031937 L1047.84185,408.031218 C1047.63977,408.031093 1047.43913,408.030964 1047.24,408.030832 L1046.06383,408.030005 C1045.22537,408.029379 1044.41779,408.028694 1043.64629,408.027951 L1042.73813,408.027029 C1040.36433,408.024495 1038.3812,408.021342 1036.95883,408.01751 C1037.02218,411.542318 1038.70257,415.234262 1042.37847,417.846532 C1046.05438,420.458802 1052.68197,423.549841 1060.5278,423.549841 C1068.79489,423.549841 1075.54185,422.700011 1080.49542,421.057128 C1084.5176,419.723146 1088.33312,417.875032 1091.60444,415.78136 L1091.60486,434.581126 C1089.93784,435.593133 1087.89671,436.632681 1085.41513,437.615306 C1079.72724,439.867528 1070.65016,442 1061.82369,442 C1052.99721,442 1043.94928,440.787809 1036.95658,437.934714 C1029.80532,435.019982 1021.7356,430.268372 1017.45636,424.131336 C1013.13993,417.937166 1011,410.275826 1011,401.224578 C1011,387.29112 1014.91971,376.500379 1022.83217,369.054325 C1030.69065,361.656092 1041.72372,358 1055.78953,358 Z M838.290203,339 L838.288276,364.559952 L838.874395,364.200045 C840.805068,363.047969 842.879018,362.056406 845.094001,361.225292 L846.213235,360.823106 L847.211798,360.493128 C852.484469,358.819822 858.1,357.986006 864.051579,357.986006 C872.040986,357.986006 879.237636,359.764568 885.596484,363.331581 C891.978042,366.911333 896.994379,371.918 900.601213,378.309028 C904.20455,384.691148 906,391.986392 906,400.145571 C906,408.407933 904.204349,415.730693 900.596169,422.066232 C896.982907,428.414924 891.956395,433.348879 885.56268,436.824953 C879.210543,440.278422 872.026156,442 864.051579,442 C857.452369,442 851.716345,441.105452 846.845706,439.291702 C844.125935,438.278902 841.469434,436.907542 838.876688,435.181457 L837.907397,434.517556 L837.67136,434.348687 L837.673112,440 L813,440 L813,339 L838.290203,339 Z M762.228768,358 C768.80678,358 774.46643,358.553722 779.221413,359.675087 C784.113902,360.828069 788.200743,362.628219 791.455785,365.098567 C794.807784,367.640016 797.267738,370.936354 798.799986,374.933093 C800.176231,378.524376 800.899942,382.674684 800.99032,387.379044 L801,388.3956 L801,440 L777.861413,440 L777.860877,435.320792 L777.635758,435.452876 C775.666824,436.569192 773.38088,437.646087 770.700931,438.769555 L768.811734,439.543783 C764.46089,441.287981 759.601097,442 753.495282,442 L752.592885,441.997228 L750.886471,441.974001 C746.775313,441.88472 743.780251,441.552583 740.878265,440.781092 C736.936723,439.730138 733.491796,438.155705 730.557742,436.047153 C727.54528,433.882252 725.189409,431.176574 723.520106,427.955626 C721.832818,424.706444 721,420.961464 721,416.758128 C721,412.16806 722.068588,408.100907 724.221479,404.624065 C726.358833,401.169663 729.512016,398.350325 733.622011,396.16964 C737.587969,394.063845 742.441623,392.530495 748.185852,391.546555 C753.438778,390.646303 759.448905,390.168984 766.222007,390.109343 L767.685066,390.102953 L777.860877,390.101587 C777.846597,388.254385 777.766522,386.926757 777.62065,386.118702 C777.401843,384.906619 776.724942,383.398904 775.734159,382.604347 C774.743376,381.80979 773.569277,380.944377 770.72613,380.108291 C767.882982,379.272205 764.183274,378.804101 760.581054,378.804101 C756.978833,378.804101 753.975156,379.163396 750.67578,379.828022 C747.376403,380.492649 741.086683,382.580122 737.826344,384.157673 C735.652785,385.209373 733.210043,386.483274 730.498119,387.979376 L730.671609,364.934662 L733.286091,363.818251 L734.956755,363.130281 C737.445056,362.127557 739.825941,361.270624 741.724334,360.751904 C744.696726,359.939318 747.920628,359.279204 751.392657,358.771412 C754.89907,358.256896 758.511398,358 762.228768,358 Z M588.5,358 C597.610493,358 605.669636,359.69868 612.647815,363.118631 C619.702382,366.574517 625.214658,371.493118 629.130086,377.844946 C633.047866,384.199054 635,391.605065 635,399.99929 C635,408.593202 633.050102,416.100867 629.130423,422.459592 C625.208498,428.823499 619.683812,433.697719 612.614904,437.049071 C605.643787,440.357006 597.596467,442 588.5,442 C579.402293,442 571.354932,440.357074 564.384361,437.049399 C557.314972,433.69709 551.789438,428.822464 547.86832,422.459866 C543.949029,416.10177 542,408.594492 542,399.99929 C542,391.610492 543.92197,384.211023 547.781185,377.861805 C551.645398,371.500283 557.166612,366.574052 564.280213,363.114792 C571.308748,359.697636 579.390814,358 588.5,358 Z M500.553774,358 C512.585353,358 522.324314,360.376937 529.730212,365.206167 L529.730212,365.206167 L531.074122,366.082503 L531.074122,388.82923 L526.480214,385.601196 C520.326242,381.276942 512.374029,379.088557 502.558661,379.088557 C495.284852,379.088557 489.649129,380.847617 485.539475,384.300802 C481.59592,387.613225 479.585103,392.81295 479.585103,400.152543 C479.585103,407.383052 481.589492,412.501074 485.524958,415.76371 C489.640828,419.175906 495.178592,420.910024 502.249563,420.910024 C512.088664,420.910024 520.479358,418.611616 527.488589,414.034986 L527.488589,414.034986 L532,411.089291 L532,433.444216 L530.673368,434.322722 C526.690844,436.95998 522.199726,438.902023 517.211096,440.152056 C512.289594,441.38751 506.634353,442 500.246093,442 C491.206971,442 483.209197,440.38481 476.278951,437.133978 C469.244953,433.835194 463.745563,429.012495 459.842262,422.699464 C455.939479,416.387864 454,408.849911 454,400.152543 C454,391.450095 455.966396,383.885836 459.92296,377.522331 C463.874769,371.168944 469.39152,366.30028 476.4148,362.950823 C483.351217,359.642002 491.404005,358 500.553774,358 Z M711,340 L711,440 L686,440 L686,340 L711,340 Z M670,340 L670,440 L645,440 L645,340 L670,340 Z M358.420773,375.75774 L358.833922,376.161635 L383.624733,400.750275 L358.82392,425.368716 C345.146822,438.957959 322.947972,438.957959 309.270875,425.368716 C308.413555,424.534289 307.604818,423.641679 306.856092,422.720687 C295.633785,409.051975 296.431092,388.898003 309.270875,376.161635 C322.811201,362.69845 344.703697,362.563818 358.420773,375.75774 Z M778.333972,408.349946 C768.823424,408.38309 763.359884,408.415179 761.943351,408.44621 C759.818553,408.492758 757.893421,408.587913 754.811182,408.865258 C751.728944,409.142603 749.677839,410.020133 748.343937,410.775791 C747.124181,411.467238 746.304537,412.234192 745.820058,413.074348 C745.325469,413.930449 745.073302,414.932391 745.073302,416.135196 C745.073302,417.685936 746.1287,419.532685 748.288273,420.757862 C750.447845,421.983038 755.803965,422.516663 758.786797,422.516663 C761.769629,422.516663 766.469926,421.989625 769.204071,421.257959 C773.020038,420.236794 776.583297,418.794412 778.333972,416.466924 C778.332917,415.876062 778.332143,415.250361 778.331651,414.589821 L778.331651,410.801898 C778.332143,410.01942 778.332917,409.202103 778.333972,408.349946 Z M588.5,379.088557 C582.009111,379.088557 577.054758,380.925901 573.455067,384.568556 C569.857391,388.209193 568.036369,393.293225 568.036369,399.99929 C568.036369,406.299164 569.880852,411.296503 573.569425,415.160536 C577.225727,418.991988 582.136817,420.910024 588.5,420.910024 C594.861917,420.910024 599.772936,418.991895 603.429819,415.159835 C607.118291,411.297208 608.962205,406.300568 608.962205,399.99929 C608.962205,393.293225 607.141184,388.209193 603.543513,384.568562 C599.943901,380.925988 594.989625,379.088557 588.5,379.088557 Z M859.268059,379.078076 C854.295377,379.078076 849.909008,380.409416 846.030089,383.082175 C842.402497,385.581389 839.874744,388.818682 838.39086,392.862086 L838.288276,393.152711 L838.288276,406.957272 L838.388732,407.22812 C839.865266,411.048981 842.215777,414.133058 845.479572,416.534212 L846.102246,416.976439 C849.928629,419.59891 854.290038,420.90651 859.268059,420.90651 C865.528284,420.90651 870.558258,418.990059 874.519234,415.147837 C878.448305,411.336527 880.400542,406.401972 880.400542,400.145571 C880.400542,393.879473 878.440983,388.881828 874.49504,384.966287 C870.534613,381.035141 865.514934,379.078076 859.268059,379.078076 Z M958.86933,377.259139 C952.409234,377.259139 948.172734,378.737559 944.69436,381.979409 C942.101016,384.397342 940.616183,386.901255 940.027711,390.130031 L939.925487,390.754586 L977.510593,390.754586 L977.495877,390.609769 C977.050768,387.132523 975.780586,384.530721 973.513413,382.163422 L973.12629,381.770933 C970.114377,378.802492 965.413394,377.259139 958.86933,377.259139 Z M1055.86933,377.259139 C1049.40923,377.259139 1045.17273,378.737559 1041.69436,381.979409 C1039.10102,384.397342 1037.61618,386.901255 1037.02771,390.130031 L1036.92549,390.754586 L1074.51059,390.754586 L1074.49588,390.609769 C1074.05077,387.132523 1072.78059,384.530721 1070.51341,382.163422 L1070.12629,381.770933 C1067.11438,378.802492 1062.41339,377.259139 1055.86933,377.259139 Z M417.775041,316.198674 C431.402128,329.803527 431.41213,351.839217 417.775041,365.434137 L394.310216,388.806613 L369.627998,364.198106 C355.999482,350.593253 335.549563,348.914464 330.119875,354.343918 L368.380599,316.187321 C382.017689,302.602335 404.127949,302.602335 417.775041,316.198674 Z" id="Combined-Shape"></path></g></g></g></svg>
				</a>
				<button title="알림설정" class="alarm">
				<svg viewBox="0 0 24 24" width="22px" height="22px" class="alarm_svg"><path d="M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z" color="#888888" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
				</button>
			</header>
			
			<div class="left-navigation">
				<h2>전체 정보</h2>
				<a class="menu chosen">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1 fill_black"><path d="M12 3l9 7.412V21h-6.75v-7.412h-4.5V21H3V10.412L12 3z"></path></svg>
					<div class="name bold">홈</div>
					<button class="btn1" name="HOME">
						<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg2_1"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					</button>
				</a>
				
				<a class="menu" href="Controller?command=updatebar1">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M1 18v3h3c0-1.66-1.34-3-3-3zm0-4v2c2.76 0 5 2.24 5 5h2c0-3.87-3.13-7-7-7zm18-7H5v1.63c3.96 1.28 7.09 4.41 8.37 8.37H19V7zM1 10v2a9 9 0 0 1 9 9h2c0-6.08-4.93-11-11-11zm20-7H3c-1.1 0-2 .9-2 2v3h2V5h18v14h-7v2h7c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">업데이트</div>
					<button class="btn1" name="ISSUE">
						<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg2_1"><path d="M12 8c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2zm0 2c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm0 6c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					</button>
				</a>
				
				<a class="menu" href="bookmark2.jsp">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"></path></svg>
					<div class="name">북마크</div>
				</a>
				
				<a class="menu" href="myPostCmt.jsp">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M2 12c0 5.52 4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2C6.47 2 2 6.48 2 12zm10 8.2c-4.53 0-8.2-3.67-8.2-8.2 0-4.53 3.67-8.2 8.2-8.2 4.53 0 8.2 3.67 8.2 8.2 0 4.53-3.67 8.2-8.2 8.2zm-2.588-7c.616 1.122 1.287 1.676 2.588 1.676 1.3 0 1.972-.554 2.588-1.676H16.5c-.703 1.933-2.452 3.3-4.5 3.3s-3.797-1.367-4.5-3.3zM8.65 8.4a1.35 1.35 0 110 2.7 1.35 1.35 0 010-2.7zm6.7 0a1.35 1.35 0 110 2.7 1.35 1.35 0 010-2.7z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">내가 작성한 문서</div>
				</a>
				
				<a class="menu">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M22,16 L22,20 L14,20 C12.8954305,20 12,19.1045695 12,18 C12,16.8954305 12.8954305,16 14,16 L22,16 Z M17,10 C18.1045695,10 19,10.8954305 19,12 C19,13.1045695 18.1045695,14 17,14 L7,14 C5.8954305,14 5,13.1045695 5,12 C5,10.8954305 5.8954305,10 7,10 L17,10 Z M10,4 C11.1045695,4 12,4.8954305 12,6 C12,7.1045695 11.1045695,8 10,8 L2,8 L2,4 L10,4 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">간트차트<span class="beta">Beta</span>
					</div>
				</a>
				
				<div class="menu">
					<button class="calendar_button"> 
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">전체 캘린더</div>
					</button>
				</div>
					
				<button class="menu">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M2,11.0015412 C2,13.1876518 2.97777778,15.2766019 4.75555556,16.8311695 C4.91111111,16.9769102 5.06666667,17.0983608 5.22222222,17.2198114 L5.05263158,21.5 L9.26666667,19.1387307 C10.1555556,19.3573417 11.0666667,19.4545022 12,19.4545022 C17.5111111,19.4545022 22,15.6652438 22,10.9772511 C22,6.31354849 17.5111111,2.5 12,2.5 C6.48888889,2.5 2,6.31354849 2,11.0015412 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">메신저</div>
				</button>
			</div>
			<div class="private">
				<h2>개인공간</h2>
				<a class="menu" href="">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					<div class="name">프라이빗 공간</div>
				</a>
			</div>
			<button class="new_workspace">새 협업공간 만들기</button>
		</div>
		<div style="margin: 0px 16px 4px;">
			<div style="position: relative;">
				<svg xmlns="http://www.w3.org/2000/svg" width="16px" height="16px" viewBox="0 0 24 24" style="position: absolute; left: 6px; top: 6px;"><path fill="#888888" fill-rule="evenodd" d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg>
				<input placeholder="협업공간 검색" class="w_search" value/>
			</div>
		</div>
		
		<div class="createFolder">
			<button type="button" class="btn2">
				<span class="contents">
					<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg3"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm5 11h-4v4h-2v-4H7v-2h4V7h2v4h4v2z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
					폴더 추가하기
				</span>
			</button>
			<input class="folder_namebox" type="text" placeholder="새 폴더(예시 : 프로젝트, 마케팅)" maxlength="20"/>
		</div>
	
		<div>
			<div class="folder1">


<%
	for(NoneFolderDto dto : listNone){
%>	
			
				<div class="f_container" workspaceId="<%= dto.getWorkspace_id()%>"> <!-- draggable="true" -->
					<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg4"><path d="M8 5.4A2.2 2.2 0 1 1 8 1a2.2 2.2 0 0 1 0 4.4zm0 8.8a2.2 2.2 0 1 1 0-4.4 2.2 2.2 0 0 1 0 4.4zM8 23a2.2 2.2 0 1 1 0-4.4A2.2 2.2 0 0 1 8 23zm8-17.6A2.2 2.2 0 1 1 16 1a2.2 2.2 0 0 1 0 4.4zm0 8.8a2.2 2.2 0 1 1 0-4.4 2.2 2.2 0 0 1 0 4.4zm0 8.8a2.2 2.2 0 1 1 0-4.4 2.2 2.2 0 0 1 0 4.4z" color="#C1C1C1"></path></svg>
					<div class="f_continer2">
						<div class="f_container3">
							<div>
								<svg viewBox="0 0 24 24" width="16px" height="16px" class="svg5"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></path></svg>
							</div>
							<div style="margin-top: 5px;" class="name" title="<%= dto.getWorkspace_name() %>"><%= dto.getWorkspace_name() %></div>
						</div>
					</div>
				</div>
				
<%
	}
%>	


			</div>	
		</div>
	
	<div class="sidebar-footer">
		<span>
		개인정보 처리방침<br/>
		이용 약관<br/>
		collabee Inc. © 2022
		</span>
	</div>
	</div>
	</nav>
	
	
	
	<div class="layout2">
	<div class="layout3">
	<div class="body_header">
	<div class="body_header2">
	<div class="top_left">
		<div class="top_header_title">
			<a class="home_title" href="">홈</a>
			<div class="mastersearchbar">
		        <div id="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
		        <input type ="text" id=searchbar placeholder="검색"/>
		    </div>
		</div>
		<div class="header_menu">
		<div class="header_menu2">
			<button type="button" title="할 일" class="header_menu3 header_menu_Todo">
			<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg11"><path d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			<span class="header_menu4">할 일</span>
			</button>
			
			<button type="button" title="일정" class="header_menu3">
			<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg11"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			<span class="header_menu4">일정</span>
			</button>
			
			<input type="file" id="fileupload" name="fileupload" onchange="uploadFile(this)" style="display: none;"/>
			<button type="button" title="파일" class="header_menu3" id="fileupload0">
			<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg11"><path d="M16.5 6v11.5c0 2.21-1.79 4-4 4s-4-1.79-4-4V5a2.5 2.5 0 0 1 5 0v10.5c0 .55-.45 1-1 1s-1-.45-1-1V6H10v9.5a2.5 2.5 0 0 0 5 0V5c0-2.21-1.79-4-4-4S7 2.79 7 5v12.5c0 3.04 2.46 5.5 5.5 5.5s5.5-2.46 5.5-5.5V6h-1.5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			<span class="header_menu4">파일</span>
			</button>
			
			<button type="button" title="의사결정" class="header_menu3" onClick="alert('준비 중입니다.')">
			<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg11"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			<span class="header_menu4">의사결정</span>
			</button>
			
			<div style="flex: 1 1 auto;">
			<button title="문서 작성" class="header_menu5">
			<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg21"><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" color="#fff" class="Beecon__Path-sc-3x6pq4-1 jdeJZe"></path></svg>
			<span style="margin-left: 4px; font-size: 13px;">문서 작성</span>
			</button>
			</div>
		</div>
		</div>
	</div>
	
	<div class="topright1">
		<div class="topright">
    		<button title="" class="btn11"></button>
    		<button title="파트너 초대" class="btn21">
    		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
    		</button>
    		<button class="btn31">
    		<span>파트너</span>
    		<span class="number">${partnerN }</span>
    		</button>
   		</div>
   		
   		<div class="subheader_right3">
			<div class="subheader_right3_menu">
			<a href="Controller?command=Todo" class="subheader_right3_menu2">할 일</a>
			<a href="0dm2.jsp" class="subheader_right3_menu2">의사결정</a>
		<div style="position: relative; margin-top: -5px;">
			<a class="file1" href="files.jsp">파일함
			<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg51"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			</a>
		</div>
		</div>
			<div id="div2">
      			<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><img src="Images/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
      			<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><img src="Images/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
   			</div>
		</div>
   	</div>
	</div>
	</div>
	
	
	<div class="body_body">
		<div class="homeBanner">
			<div class="homeBanner2">
				<h3>환영합니다. <%-- ${name } --%>김유라님 🎉</h3>
				<p class="disc">콜라비를 1분만에 배우고,<br>오늘의 업무를 시작해 보세요.</p>
				<button class="btn100"></button>
			</div>
		</div>
	
		<div class="recentList">
			<button class="recentList_btn1">최근 접속한 공간
			<svg viewBox="0 0 24 24" width="20px" height="20px" class="recent_svg1"><path d="M19 15H5l7-7z" color="#222222"></path></svg>
			</button>
			<div class="recentList1">
				
<%
	for(HomeRecentDto recent : listRecent){
%>				
				<div style="background-color: <%= recent.getColor() %>;" class="recent_container" workspaceId="<%= recent.getWorkspace_id()%>">
					<div class="recent_container2">
					<%= recent.getWorkspasce_name() %>
					</div>
					<div class="recent_container3">
						<%-- <div style="background-color: <%= recent.getColor() %>;" class="recent_container4 jh"></div>
						<div style="z-index: 2; background-color: <%= recent.getColor() %>;" class="recent_container4 ta"></div>
						<div style="z-index: 1; background-color: <%= recent.getColor() %>;" class="recent_container4 yr"></div> --%>
						<svg style="color: rgb(136,136,136);" viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
						<span id="more_people" style="margin-left: 4px;">
						<%= recent.getCount() %>명</span>
					</div>
				</div>
				
<%
	}
%>				
				
				
			</div>
		</div>
<div class="NofolderList">
<%
	for(NoneFolderDto dto : listNone){
%>


						<div style="background-color: <%= dto.getColor() %>;" class="recent_container" workspaceID="<%= dto.getWorkspace_id()%>">
				<div class="recent_container2">
				<%= dto.getWorkspace_name()%>
				</div>
				<div class="recent_container3">
					<svg style="color: rgb(136,136,136);" viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
					<span id="more_people" style="margin-left: 4px;">
					<%=dto.getCount() %>명</span>
			</div>
		</div>
<%
	}
%>						
		<button class="createW_btn">
		<svg viewBox="0 0 24 24" width="32px" height="32px" class="createW_svg"><path d="M10.286 10.286V18H7.714v-7.714H0V7.714h7.714V0h2.572v7.714H18v2.572z" color="#bdbab7"></path></svg>
		</button>			
	</div>
		
		
		
	</div>
	</div>
	</div>
	</div>
	
	<div class="float_root">
		<div class="frame1">
			<div class="B_Movie">
				<iframe class="B_Movie2" src="https://www.youtube.com/embed/DHWjid0EV74?autoplay=1&mute=1&start=00;" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
			<button class="B_Movie_close">
				<svg viewBox="0 0 24 24" width="24px" height="24px" class="B_Movie_close_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" color="#C1C1C1"></path></svg>
			</button>
		</div>
	</div>
	
	<script>
		var videoscreen = document.getElementsByClassName("float_root")[0];
		window.onclick = function(e){
			if(e.target == videoscreen){
				videoscreen.style.display = "none";
			}
		}
	</script>
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int loginMember_id = (int)(session.getAttribute("login_id")); */
	UpdatebarDao uDao = new UpdatebarDao();
	//ArrayList<NewsDto> list = uDao.getNews (4);
	//ArrayList<IssueDto> listIssue = uDao.getIssueUpdate (4);
	ArrayList<NewsDto> list = (ArrayList<NewsDto>)request.getAttribute("list"); 
	ArrayList<IssueDto> listIssue = (ArrayList<IssueDto>)request.getAttribute("list2");
	/* ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list3"); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>updatebar1</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	
	
	
	
	
	
	
	
	main{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
	}
	a{
		text-decoration: none;
	}
	button{
		border: none;
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
	    display: flex;
	    flex-direction: column;
	    height: 100vh;
	    overflow-y: auto;
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
    #searchbar { /*상단 검색창  / 클릭하면 길어지면서 문서작성 버튼 없어짐(할지말지 고민중) */
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
    } */
    /* .btn1::before{
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
    /* .btn2{
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
    	font-weight: bold;
	    color: rgb(34, 34, 34);
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
	    color: rgb(136, 136, 136);
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
    .components1{
    	display: flex;
	    flex-direction: row;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    background-color: rgb(251, 250, 244);
	    width: 100%;
    }
    .writer{
    	flex: 0 0 156px;
	    min-width: 0px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0px 18px 0px 20px;
    }
    .writer2{
    	display: flex;
	    flex-direction: row;
	    cursor: pointer;
    }
    .avatar_c{
    	margin-top: 4px;
    	flex-shrink: 0;
	    position: relative;
	    width: 25px;
	    height: 25px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
	    transition: border-color 0.3s ease 0s;
	    cursor: pointer;
    }
    .avatar_c::before{
    	position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    background-color: rgb(255, 255, 255);
	    transform: translate(1px, 1px);
	    width: 23px;
	    height: 23px;
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
	    content: "";
    }
    .new::before{
    	background-image: url(https://ifh.cc/g/TppacC.png);
    }
    .jh::before{
    	background-image: url(https://down.collabee.co/userProfile/2972655);
    }
    .yr::before{
    	background-image: url(https://down.collabee.co/userProfile/2972613);
    }
    .jm::before{
    	background-image: url(https://down.collabee.co/userProfile/2972576);
    }
    .avatar_c::after{
    	position: absolute;
	    display: block;
	    top: -1px;
	    left: -1px;
	    width: 23px;
	    height: 23px;
	    border-radius: 50%;
	    content: "";
	    border: 2px solid rgba(0, 0, 0, 0);
	    transition: border-color 0.3s ease 0s;
    }
    .avatar_c:hover::after{
    	border-color: rgb(217, 173, 43);
    }
    .nametag{
    	display: inline-block;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    padding-left: 8px;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    width: 76px;
	    line-height: 23px;
    }
    .components2{
    	flex: 1 1 auto;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    width: 100%;
	    min-width: 0px;
    }
    .components2_1{
    	font-size: 14px;
	    line-height: 1.54;
	    color: rgb(34, 34, 34);
    }
    .content{
    	border: 0px !important;
	    background-color: inherit !important;
	    color: inherit !important;
	    padding: 0px !important;
	    margin: 0px !important;
	    display: inline !important;
	    width: auto !important;
	    height: auto !important;
    }
    .date{
    	color: rgb(136, 136, 136);
	    font-size: 12px;
	    line-height: 1.5;
	    display: inline-block;
	    padding-top: 5px;
    }
    .components3{
    	flex: 0 0 152px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 8px;
    }
    .ok{
    	padding: 10px;
	    margin: 0px 2px;
	    font-size: 12px;
	    line-height: 1.5;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(136, 136, 136);
	    pointer-events: auto;
    }
    .ok:hover{
    	color: rgb(34, 34, 34);
    }
    .container1{
    	display: flex;
	    flex-direction: row;
	    min-height: 44px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    background-color: rgb(247, 246, 245);
    }
    .wname{
    	flex: 0 0 156px;
	    min-width: 0px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    padding: 0px 24px;
    }
    .wname2{
    	display: inline-block;
	    width: 100%;
	    font-size: 14px;
	    line-height: 1.54;
	    transition: color 0.2s ease 0s;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    color: rgb(34, 34, 34);
	    opacity: 0.6;
    }
    .title{
    	flex: 1 1 auto;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    width: 100%;
	    min-width: 0px;
    }
    .d_style0{
    	display: flex;
    	width: 25px;
    	flex-shrink: 0;
    }
    .d_style{
    	display: flex;
	    -webkit-box-align: center;
	    align-items: center;
	    color: rgb(136, 136, 136);
	    font-size: 13px;
	    line-height: initial;
    }
    .post_image{
    	width: 24px;
    	height: 24px;
    }
    .d_title{
    	display: flex;
    	overflow: hidden;
    }
    .d_title2{
    	display: inline-block;
	    margin-left: 5px;
	    margin-right: 5px;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    cursor: pointer;
	    line-height: 1.54;
	    transition: color 0.2s ease 0s;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    opacity: 0.6;
	    font-weight: normal;
	    text-decoration: line-through !important;
    }
    .d_title3{
    	display: inline-block;
	    margin-left: 5px;
	    margin-right: 5px;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    cursor: pointer;
	    line-height: 1.54;
	    font-weight: bold;
	    transition: color 0.2s ease 0s;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    opacity: 1;
    }
    .d_title4{
    	display: inline-block;
	    margin-left: 5px;
	    margin-right: 5px;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    cursor: pointer;
	    line-height: 1.54;
	    transition: color 0.2s ease 0s;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    opacity: 1;
    }
    .container_footer{
    	flex: 0 0 120px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 20px;
    }
    .cancel{
    	font-size: 12px;
	    line-height: 1.5;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(204, 153, 0);
	    pointer-events: auto;
    }
    .cancel:hover{
    	color: rgb(179, 142, 34);
    }
    .read{
    	background-color: rgb(255, 255, 255);
    }
    .date2{
    	color: rgb(136, 136, 136);
	    font-size: 14px;
	    line-height: 1.54;
    }
    .d_read{
    	color: rgb(217, 173, 43);
	    cursor: pointer;
	    display: none;
    }
    .pictures{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-left: 12px;
    }
    .writer11{
    	flex-shrink: 0;
	    position: relative;
	    width: 22px;
	    height: 22px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
	    transition: border-color 0.3s ease 0s;
	    cursor: pointer;
    }
    .writer11::before{
    	position: absolute;
	    display: block;
	    top: 0px;
	    left: 0px;
	    background-color: rgb(255, 255, 255);
	    transform: translate(1px, 1px);
	    width: 20px;
	    height: 20px;
	    border-radius: 50%;
	    background-size: cover;
	    background-position: center center;
	    content: "";
    }
    .writer11::after{
    	position: absolute;
	    display: block;
	    top: -1px;
	    left: -1px;
	    width: 20px;
	    height: 20px;
	    border-radius: 50%;
	    content: "";
	    border: 2px solid rgba(0, 0, 0, 0);
	    transition: border-color 0.3s ease 0s;
    }
    .writer11:hover::after{
    	border-color: rgb(217, 173, 43);
    }
    .live{
    	opacity: 1;
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
    
    /* 여기서부터 위젯 */
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
		
       	$('.ok').click(function(){
            var box = $(this).parent().parent();
            var id = $(this).attr('newsId');
            //alert(id);
            $.ajax({
            	type: 'get',
            	url: 'UpdatebarServlet1',
            	data: { "newsId" : id },
            	datatype: "json",
            	success: function(d){
            		box.remove();
            	},
            	error: function(r,s,e){
            		alert("error");
            	}
            });
            
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
		// 위젯임
		/* $('.dm5').mouseenter(function() {
            $(".dm3").css("fill","rgb(136, 136, 136)");
		});
        $('.dm5').mouseleave(function() {
            $('.dm3').css("fill","rgb(193, 193, 193)");
        });
         */
        // 여기는 아니고
        /* $('.date2').mouseenter(function() {
            if($(this).parent().parent().hasClass("read")){
            	$(this).html("읽음 표시");
            	$(this).css({color: "rgb(217, 173, 43)", cursor: "pointer", "font-size" : "12px"});
            }else{
            	$(this).html("안 읽음 표시");
            	$(this).css({color: "rgb(217, 173, 43)", cursor: "pointer", "font-size" : "12px"});
            }
		});
        $('.date2').mouseleave(function() {
        	
        }); */
        
	});
	</script>
</head>
<body>
<div class="row">	
	<div>
		<%@ include file="../WEB-INF/include/HomeSidebar.jsp" %>
	</div>	
	
	<main class="layout">
	<div>
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
		<a label href="" class="subheader3">
		<span class="subheader4">이슈 업데이트</span>
		</a>
		<div style="position: relative;">
			<button class="new" onClick="location.href='Controller?command=updatebar2'">뉴스피드</button>
		</div>
		<a class="call" label onClick="alert('준비 중입니다.')">
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
			<a href="" class="subheader_right3_menu2">할 일</a> <!-- 컨트롤러로 연결해야함 -->
			<a href="" class="subheader_right3_menu2">의사결정</a>
		<div style="position: relative;">
			<a class="file1" href="">파일함
			<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
			</a>
		</div>
			</div>
			<div id="div2">
      			<div class="div2_1"><a style="text-decoration:none; color: black;"><img src="Images/file.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
      			<div class="div2_1"><a style="text-decoration:none; color: black;"><img src="Images/link.svg" style="filter: opacity(0.5); width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
   			</div>
		</div>
		</div>
		</header>
		
		<div class="layout_body">
		<div class="main_section">
			<div class="taindex">
<%
	for(NewsDto dto : list){
%>			
				<div class="components1">
					<div class="writer">
						<div class="writer2">
							<button class="avatar_c new" name="<%= dto.getName()%>"></button>
							<span class="nametag"><%= dto.getName()%></span>
						</div>
					</div>
				<div class="components2">
				<div style="padding: 19px 0px;">
					<div class="components2_1">
					<span class="content">
					<strong><%= dto.getContent()%></strong>
					</span>
					</div>
					<span class="date">
					<%= dto.getCreation_date()%>
					</span>
				</div>
				</div>
				<div class="components3">
					<button class="ok" newsId="<%= dto.getNews_id()%>">확인</button>
				</div>
				</div>
<%
	}
%>	
		
<%
	for(IssueDto dto : listIssue){
%>				
				<div class="container1 read" documentId="<%= dto.getId()%>">
					<div class="wname">
						<a class="wname2 live" href=""><%= dto.getWname()%></a>
					</div>
					<div class="title">
					<div class="d_style d_style0">
						<span class="d_style2">
<%
	if(dto.getSort()==1){
%>
						<svg xmlns="http://www.w3.org/2000/svg" width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><%=dto.getPicture() %></g></svg>
						<!-- <svg xmlns="http://www.w3.org/2000/svg" width="22px" height="22px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#C1C1C1"></path></g></svg> -->
<%
	}else if(dto.getSort()==2){
%>
						<svg xmlns="http://www.w3.org/2000/svg" width="22px" height="22px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg>
<%
	}else{
%>
						
						<img src="<%=dto.getPicture() %>" class="post_image" size="24" data-project-no="-1" data-status-value="10">
<%
	}
%>						
						</span>
						</div>
						<div class="d_title">
<%
	if(dto.getSort()==1){
%>		
		<a href="" title="<%= dto.getTitle()%>" class="d_title3"><%= dto.getTitle()%></a>
		<span style="font-size: 12px; color: gray; margin-top: 3px; padding-left: 10px;"><%= dto.getName()%></span>
		<svg xmlns="http://www.w3.org/2000/svg" width="7.699999999999999" height="9.799999999999999" viewBox="0 0 11 14" style="margin-left: 7px; margin-right: 7px; margin-top: 6px;"><path fill="#c1c1c1" fill-rule="evenodd" d="M0 0v14l11-7z"></path></svg>				
		<span style="font-size: 12px; color: gray; margin-top: 3px;"><%= dto.getName2()%></span>
<%
	}else{
%>
		<a href="" title="<%= dto.getTitle()%>" class="d_title3"><%= dto.getTitle()%></a>
<%
	}
%>

						</div>
					</div>
					<div class="container_footer">
					<button type="button" class="d_read">읽음 표시</button>
					<span class="date2"><%= dto.getEdit_date()%></span>
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
		
		
	</div>
	</main>
	</div>
	
	
</body>
</html>
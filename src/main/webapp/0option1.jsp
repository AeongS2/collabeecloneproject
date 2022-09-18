<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	OptionDao oDao = new OptionDao();
	ArrayList<TimezoneDto> list = oDao.getTimezoneList();
	//int member_id = 10;
	ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");
	int corporation_id = 5;
	//int corporation_id = (Integer)session.getAttribute("corporation_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>option1</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	/* .nomal{
		display: flex;
	    flex-direction: row;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
	} */
	*{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
	}
	html {
	    position: relative;
	    min-height: 100%;
	    -webkit-tap-highlight-color: transparent;
	    overflow-x :  hidden;
	    overflow-y :  hidden;
	    height: 100%;
	}
	ul {
    	list-style-type: none;
	}
	a{
		text-decoration: none;
	}
	button{
		border: none;
	}
	
	
	
	
	
	
	
	
	
	
	
	.main::-webkit-scrollbar {
		width:4px;
	}
	.main::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background-color: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	.main::-webkit-scrollbar-track{
		background-color: white;
	}
	a{
		text-decoration: none;
		color: black;
	}
	ul {
	   list-style-type: none;
	}
	li{
		margin-left: -40px;
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
        border: 1px solid black;
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
    main{
	    display: flex;
	    flex-direction: column;
	    width: 100%;
    }
    header{
    	width: 100%;
    	height: 106px;
    	position: relative;
    }
    .top{
    	position: relative;
	    height: 68px;
	    display: flex;
	    flex-direction: row;
    }
    .title{
    	flex: 1 1 auto;
    	display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    -webkit-box-align: center;
	    align-items: center;
	    margin-right: 20px;
    }
    h1{
    	font-size: 22px;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    text-shadow: none;
	    margin-top: 0px;
	    margin-left: 40px;
    }
    .mastersearchbar{
    	display: flex;
	    flex-direction: row;
	    position: relative;
	    align-items: flex-start;
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
    }
    .btn1{
    	width: 32px;
	    height: 32px;
	    border-radius: 50%;
	    padding: 1px;
	    background-color: rgba(0, 0, 0, 0.1);
	    content: "";
        cursor: pointer;
        position: relative;
    }
    .btn1::before{
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
    .content{
    	padding: 30px;
	    width: 100%;
	    max-width: 900px;
	    box-sizing: border-box;
	    height: calc(100vh - 106px);
    }
    .main{
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
	.content_header{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
    }
    .picture{
    	position: relative;
	    content: "";
	    width: 114px;
	    height: 114px;
	    border-radius: 50%;
	    background-repeat: no-repeat;
	    flex-shrink: 0;
    }
    .layer_center{
    	font-size: 14px;
    	display: flex;
	    position: relative;
	    margin: auto;
	    z-index: 110;
	    width: 960px;
	    height: 680px;
	    background-color: #fff;
	    border-radius: 4px;
    }
    .input1{
    	visibility: collapse;
	    height: 0px;
	    width: 0px;
	    display: block;
	    border: none;
	    background-color: #fff;
	    overflow: visible;
    }
    .realpicture{
    	position: absolute;
	    transition: opacity 0.2s ease 0s;
	    opacity: 1;
	    border-radius: 50%;
	    width: 114px;
	    height: 114px;
    }
    .profile_change_btn{
    	all: unset;
	    position: absolute;
	    top: 0px;
	    width: 114px;
	    height: 114px;
	    cursor: pointer;
	    display: flex;
	    flex-direction: column;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 14px;
	    color: rgb(255, 255, 255);
	    text-shadow: rgba(0, 0, 0, 0.5) 1px 1px 2px;
	    box-sizing: border-box;
	    border-radius: 50%;
	    border-width: 1px;
	    border-style: solid;
	    border-color: rgb(242, 242, 242);
	    border-image: initial;
	    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.01) 29%, rgba(0, 0, 0, 0.2) 61%, rgba(0, 0, 0, 0.6));
	    transition: border-color 0.2s ease 0s;
    }
    .profile_change_btn:hover{
    	border-color: rgb(228, 197, 106);
    }
    .change{
    	display: inline-block;
    	padding-bottom: 10px;
    	outline: 0;
    }
    .myinfo1{
    	margin-left: 30px;
	    display: flex;
	    flex-direction: column;
	    align-items: flex-start;
    }
    .myinfo_name{
    	font-size: 28px;
	    color: rgb(34, 34, 34);
	    font-weight: bold;
    }
    .myinfo_email{
    	font-size: 14px;
	    color: rgb(34, 34, 34);
	    padding-top: 4px;
    }
    .myinfo_cname{
    	font-size: 14px;
	    color: rgb(204, 153, 0);
	    line-height: 1.3;
	    margin-top: 4px;
	    word-break: break-word;
    }
    h5{
    	font-size: 14px;
	    line-height: 1.5;
	    font-weight: bold;
	    color: rgb(34, 34, 34);
	    padding-left: 10px;
	    margin-top: 60px;
    }
    .myinfo_container1{
    	padding-top: 16px;
    }
    .myinfo_container2{
    	margin-bottom: 30px;
    }
    .myinfoInput_label{
    	font-size: 12px;
	    line-height: 1.5;
	    color: rgb(136, 136, 136);
	    padding-left: 10px;
    }
    .myinfoinput{
    	display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    transition: border-bottom-color 0.2s ease 0s;
	    border-bottom: 1px solid rgb(225, 225, 225);
    }
    .input2{
    	flex: 1 1 auto;
	    padding: 10px;
	    border: none;
	    border-radius: 0px;
	    font-size: 16px;
	    color: rgb(34, 34, 34);
	    background-color: white;
    }
   .myinfo_btn1{
		font-size: 14px;
		padding-left: 10px;
		padding-right: 10px;
		line-height: 1.5;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(204, 153, 0);
	    pointer-events: auto;
	}
	.myinfo_btn0{
		font-size: 14px;
    	line-height: 1.57;
    	padding: 8px 10px;
		background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(136, 136, 136);
	    pointer-events: auto;
	    display: none;
	    border: none;
	    box-sizing: border-box;
	    float:left;
	}
	.layout{
		display: flex;
		justify-content: space-between;
	}
	.li{
		padding: 19px 10px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	    color: rgb(34, 34, 34);
	    transition: color 0.2s ease 0s;
	    font-size: 14px;
	}
	.h{
		color: rgb(34, 34, 34);
	    transition: color 0.2s ease 0s;
	    font-size: 14px;
	    background-color: white;
	    box-sizing: border-box;
	    margin-left: -8px;
	}
	.h:hover{
		color: rgb(83, 83, 83);
		cursor: pointer;
	}
	.li_1{
		padding: 19px 10px;
	    color: rgb(34, 34, 34);
	    transition: color 0.2s ease 0s;
	    font-size: 14px;
	}
	#profile_change_file{
		display: none;
	}
	input:focus {outline: none;}
	
	
	/* 모달시작 */
	#timezone_modal{
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		margin:0;
		z-index: 50; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
		box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
		align-items: center;
    }
    #changePW_modal{
    	display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		margin:0;
		z-index: 50; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
		box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
		align-items: center;
    }
	.modal-content {
        background-color: #fff;
        margin: 5% auto;
    	padding: 27px 28px;
    	position: relative;
	    display: flex;
	    flex-direction: column;
        border: 1px solid #888;
        width: 580px;
        height: 480px;
        border-radius: 4px;
    }
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        margin-top: -35px;
    }
    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    h2{
	    font-size: 20px;
	    line-height: 24px;
	    margin: 0px;
    }
	.modal_footer{
    	margin-top: 28px;
    }
    .btn_box{
	    display: flex;
	    text-align: right;
	    justify-content: flex-end;
    }
	.modal_btn11{
	    height: 42px;
	    padding: 0 20px;
	    font-size: 14px;
	    line-height: 22px;
	    font-weight: 700;
	    cursor: pointer;
	    min-width: 10px;
	    background-color: initial;
	    border-color: transparent;
	    color: #888;
    }
    .modal_btn12{
	    width: 89px;
	    margin-left: 32px;
	    height: 42px;
	    padding: 0 20px;
	    font-size: 14px;
	    line-height: 22px;
	    font-weight: 700;
	    cursor: pointer;
	    background-color: #d9ad2b;
	    color: #fff;
	    border-color: transparent;
    }
	.timezone_subtitle{
	    color: #888;
	    font-size: 12px;
	    line-height: 18px;
    }
    .timezone_input1{
    	padding: 10px 12px;
    	font-size: 14px;
    	background-color: #fff;
	    border: 1px solid #e1e1e1;
	    border-radius: 4px;
	    width: 95.5%;
    }
    .timezone_box1{
	    position: relative;
	    height: 264px;
	    overflow-y: auto;
	    padding-left: 13px;
	    background-color: #fff;
	    border: 1px solid #e1e1e1;
	    border-radius: 4px;
	    margin-top: 16px;
    }
    .timezone_radio1{
	    margin-top: 12px;
	    font-size: 13px;
	    line-height: 20px;
    }
    .timezone_radio1[type=radio]{
	    opacity: 0;
	    margin-left: -14px;
    }
    .timezone_city{
	    position: relative;
	    cursor: pointer;
	    display: inline-block;
	    color: #222;
	    font-size: 13px;
	    line-height: 20px;
    }
    .timezone_radio1[type=radio]:checked+label:before{
	    content: "";
	    position: absolute;
	    left: 0;
	    top: 3px;
	    width: 14px;
	    height: 14px;
	    border: 1px solid #888;
	    border-radius: 100%;
	    background: #fff;
    }
    .timezone_radio1[type=radio]:checked+label:after{
	    opacity: 0;
	    transform: scale(0);
	    content: "";
	    width: 8px;
	    height: 8px;
	    background: #888;
	    position: absolute;
	    top: 6px;
	    left: 3px;
	    border-radius: 100%;
	    transition: all .2s ease;
    }
	.h3{
        margin-left: 4px;
        font-size: 12px;
	    line-height: 18px;
	    color: #888;
    }
	.password_container1{
    	margin-top: 25px;
    }
	.password_c_pw{
	    font-size: 14px;
	    line-height: 22px;
	    height: auto;
	    padding: 10px 4px;
	    display: block;
	    width: 100%;
	    border: none;
	    border-bottom: 1px solid #e1e1e1;
    }
    .password_validate{
	    opacity: 1;
	    display: block;
	    margin-left: 4px;
	    margin-top: 6px;
	    font-size: 12px;
	    line-height: 18px;
	    color: #888;
	    transition: all .1s ease-in-out;
    }
    .password_error{
    	color: #ed5454;
    	opacity: 0;
    }
    #out_background {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		margin:0;
		z-index: 50; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
		box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
		align-items: center;
    }
    .modal-content_out{
        background-color: #fff;
        margin: 5% auto;
    	padding: 27px 28px;
    	position: relative;
	    display: flex;
	    flex-direction: column;
        border: 1px solid #888;
        width: 450px;
        height: 180px;
        border-radius: 4px;
    }
    .subtitle_out{
	    margin-top: 20px;
	    margin-bottom: 10px;
	    white-space: inherit;
	    font-size: 14px;
	    line-height: 22px;
    }
	/* 모달끝 */
	.option_layout{
		display: flex;
	    flex-direction: row;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(255, 255, 255);
	}
	.makingCor{
		background-color: transparent;
	    color: rgb(179, 142, 34);
	    border-color: rgb(179, 142, 34);
	    font-size: 14px;
	    line-height: 1.3;
	    margin-top: 14px;
	    padding: 8px 18px;
	    position: relative;
	    min-height: inherit;
	    font-weight: 500;
	    border-radius: 4px;
	    text-align: center;
	    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
	    cursor: pointer;
	    opacity: 1;
	    width: auto;
	    box-shadow: none;
	    border: 1px solid rgb(217, 173, 43);
	}
	.makingCor:hover{
		background-color: transparent;
	    color: rgb(179, 142, 34);
	    border-color: rgb(179, 142, 34);
	}
	.hidden1{
		visibility: hidden;
	}
	.hidden{
		display: none;
	}
	</style>
	<script>
	$(function(){
		
		
		
       	
       	
       	
       	
      
       	
       	
       	
       	
       	
	
		$("#ready1, #ready2").click(function(){
			alert("서비스가 준비 중입니다.");
		});
       	
		$('.profile_change_btn').click(function (e) {
			e.preventDefault();
			$("#profile_change_file").click();
		});
		
		
		$('.input2').keyup(function(key){
            $(this).attr("value",$(this).val());
        });   
		
		//
		$("#myinfo_btn1").click(function(){
			var text = $(this).html();
			alert(text);
			var name = $(this).parent().parent().parent().find('.input2').val();
			//alert(name);
			if(text == "수정"){
				$.ajax({
					type: 'get',
					url: 'Option1ChangeNameServlet',
					data: {"name" : name},
					datatype: "json",
					success: function(d){
						//alert("hi");
						$("#minfo_name").html(name);
					},
					error: function(r,s,e){
						
					}
				});
			}else if(text == "취소"){
				$("#myinfo_name").blur();
			} 
		});
		
		$("#myinfo_btn3").click(function(){
			var text = $(this).html();
			var p = $(this).parent().parent().parent().find('.input2').val();
			//alert(p);
			if(text == "수정"){
				$.ajax({
					type: 'get',
					url: 'Option1ChangePhoneServlet',
					data: {"p" : p},
					datatype: "json",
					success: function(d){
						$("#myinfo_tellNo").html(p);
					},
					error: function(r,s,e){
						
					}
				});
			}else if(text == "취소"){
				$("#myinfo_tellNo").blur();
			} 
		});
		
		$("#myinfo_btn5").click(function(){
			var text = $(this).html();
			var team = $(this).parent().parent().parent().find('.input2').val();
			if(text == "수정"){
				$.ajax({
					type: 'get',
					url: 'Option1ChangeTeamServlet',
					data: {"team" : team},
					datatype: "json",
					success: function(d){
						$("#teamName").html(team);
					},
					error: function(r,s,e){
						
					}
				});
			}else if(text == "취소"){
				$("#teamName").blur();
			} 
		});
		$("#myinfo_btn7").click(function(){
			alert("click");
			var text = $(this).html();
			var task = $(this).parent().parent().parent().find('.input2').val();
			if(text == "수정"){
				$.ajax({
					type: 'get',
					url: 'Option1ChangeJobServlet',
					data: {"task" : task},
					datatype: "json",
					success: function(d){
						$("#mainJob").html(task);
					},
					error: function(r,s,e){
						
					}
				});
			}else if(text == "취소"){
				$("#mainJob").blur();
			} 
		});
		/* $("input[type='text']").on("focus", function(){
			var input_name = $(this).attr('id');
		}); */
		
		
		$("#myinfo_name").focus(function(){
			$("#myinfoinput").css("border-bottom","1px solid rgb(217, 173, 43)");
			$("#count0").removeClass("hidden1");
			$("#counter0").removeClass("hidden1");
			$("#myinfoinput").find("#myinfo_btn0").css("display", "block");
			$("#myinfoinput").find("#myinfo_btn1").html("저장");
			var content = $(this).val();
			$("#count0").html(content.length);
		});
		$("#myinfo_name").keyup(function(e){
			var content = $(this).val();
			$("#count0").html(content.length);
			
			if(content.length == 0){
				$("#count0").css("color", "red");
				$("#myinfoinput").css("border-bottom","1px solid red");
			}
			else if(content.length >= 20){
				alert("최대 20자까지 입력 가능합니다.");
				$(this).val(content.substring(0,20));
				$("#count0").html("20");
			}
			else{
				$("#count0").css("color", "rgb(204, 153, 0)");
				$("#myinfoinput").css("border-bottom","1px solid rgb(217, 173, 43)");
			}
		});
		$("#myinfo_name").blur(function(){
			$("#myinfoinput").css("border-bottom","1px solid rgb(225, 225, 225)");
			$("#count0").addClass("hidden1");
			$("#counter0").addClass("hidden1");
			$("#myinfoinput").find("#myinfo_btn0").css("display", "none");
			$("#myinfoinput").find("#myinfo_btn1").html("수정");
		});
		
		//$("#myinfo_btn3").click(function(){
		//	$("#myinfo_tellNo").focus();
		//});
		$("#myinfo_tellNo").focus(function(){
			$("#myinfoinput2").css("border-bottom","1px solid rgb(217, 173, 43)");
			$("#count1").removeClass("hidden1");
			$("#counter1").removeClass("hidden1");
			$("#myinfoinput2").find("#myinfo_btn2").css("display", "block");
			$("#myinfoinput2").find("#myinfo_btn3").html("저장");
			var content = $(this).val();
			$("#count1").html(content.length);
		});
		$("#myinfo_tellNo").keyup(function(e){
			var content = $(this).val();
			$("#count1").html(content.length);
			
			if(content.length == 0){
				$("#count1").css("color", "red");
				$("#myinfoinput2").css("border-bottom","1px solid red");
			}
			else if(content.length >= 20){
				alert("최대 20자까지 입력 가능합니다.");
				$(this).val(content.substring(0,20));
				$("#count1").html("20");
			}
			else{
				$("#count1").css("color", "rgb(204, 153, 0)");
				$("#myinfoinput2").css("border-bottom","1px solid rgb(217, 173, 43)");
			}
		});
		$("#myinfo_tellNo").blur(function(){
			$("#myinfoinput2").css("border-bottom","1px solid rgb(225, 225, 225)");
			$("#count1").addClass("hidden1");
			$("#counter1").addClass("hidden1");
			$("#myinfoinput2").find("#myinfo_btn2").css("display", "none");
			$("#myinfoinput2").find("#myinfo_btn3").html("수정");
		});
		
		//$("#myinfo_btn5").click(function(){
		//	$("#teamName").focus();
		//});
		$("#teamName").focus(function(){
			$("#myinfoinput3").css("border-bottom","1px solid rgb(217, 173, 43)");
			$("#count2").removeClass("hidden1");
			$("#counter2").removeClass("hidden1");
			$("#myinfoinput3").find("#myinfo_btn4").css("display", "block");
			$("#myinfoinput3").find("#myinfo_btn5").html("저장");
			var content = $(this).val();
			$("#count2").html(content.length);
		});
		$("#teamName").keyup(function(e){
			var content = $(this).val();
			$("#count2").html(content.length);
			
			if(content.length == 0){
				$("#count2").css("color", "red");
				$("#myinfoinput3").css("border-bottom","1px solid red");
			}
			else if(content.length >= 40){
				alert("최대 40자까지 입력 가능합니다.");
				$(this).val(content.substring(0,40));
				$("#count2").html("40");
			}
			else{
				$("#count2").css("color", "rgb(204, 153, 0)");
				$("#myinfoinput3").css("border-bottom","1px solid rgb(217, 173, 43)");
			}
		});
		$("#teamName").blur(function(){
			$("#myinfoinput3").css("border-bottom","1px solid rgb(225, 225, 225)");
			$("#count2").addClass("hidden1");
			$("#counter2").addClass("hidden1");
			$("#myinfoinput3").find("#myinfo_btn4").css("display", "none");
			$("#myinfoinput3").find("#myinfo_btn5").html("수정");
		});
		
		//$("#myinfo_btn7").click(function(){
		//	$("#mainJob").focus();
		//});
		$("#mainJob").focus(function(){
			$("#myinfoinput4").css("border-bottom","1px solid rgb(217, 173, 43)");
			$("#count3").removeClass("hidden1");
			$("#counter3").removeClass("hidden1");
			$("#myinfoinput4").find("#myinfo_btn6").css("display", "block");
			$("#myinfoinput4").find("#myinfo_btn7").html("저장");
			var content = $(this).val();
			$("#count3").html(content.length);
		});
		$("#mainJob").keyup(function(e){
			var content = $(this).val();
			$("#count3").html(content.length);
			
			if(content.length == 0){
				$("#count3").css("color", "red");
				$("#myinfoinput4").css("border-bottom","1px solid red");
			}
			else if(content.length >= 40){
				alert("최대 50자까지 입력 가능합니다.");
				$(this).val(content.substring(0,50));
				$("#count3").html("50");
			}
			else{
				$("#count3").css("color", "rgb(204, 153, 0)");
				$("#myinfoinput4").css("border-bottom","1px solid rgb(217, 173, 43)");
			}
		});
		$("#mainJob").blur(function(){
			$("#myinfoinput4").css("border-bottom","1px solid rgb(225, 225, 225)");
			$("#count3").addClass("hidden1");
			$("#counter3").addClass("hidden1");
			$("#myinfoinput4").find("#myinfo_btn6").css("display", "none");
			$("#myinfoinput4").find("#myinfo_btn7").html("수정");
		}); 
		
		<%-- var login_id = <%= member_id %>; &login_id="+login_id --%> 
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
				
		$("#MemberDelete").click(function(){
			location.href = "Controller?command=MemberDelete";
		});
		
		$("#profile_change_file").change(function(){
			$("#uploadpicture").click();
		});
	});
	</script>
</head>
<body>
<div class="option_layout">

	
	
	
	
	
	
	
	<main>
	<header>
		<div class="top">
		<div class="title">
			<div>
			<h1>설정</h1>
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
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m selected" href="">내 정보</a>
    			<a class="m" href="Controller?command=option2">알림</a>
    			<a class="m" href="partner_management.jsp">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m" href="setting_price.jsp">가격 및 결제</a>
    			<a class="m" href="Controller?command=option3">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
	</header>
	<div class="main">
	<div class="content">
	<div class="content_header">
	
		<div class="picture">
		<img src="${picture }" alt="user" class="realpicture"/>
		<button class="profile_change_btn"><span class="change">변경</span></button>
		
		<form action="UploadMPServlet" method="post" enctype="multipart/form-data">
		<input type="file" id="profile_change_file" name="profile_name"/>
		<input type="submit" style="display: none;" id="uploadpicture"/>
		</form>
		</div>
		<div class="myinfo1">
		<span class="myinfo_name">${name }</span>
		<span class="myinfo_email">${email }</span>
<%
if (corporation_id != 0){
%>
		<div class="myinfo_cname">${corName }</div>
<%
}else{
%>		
		<button class="makingCor">회사 선택 또는 만들기</button>
<% 
}
%>
		</div>
	</div>
	
	<div>
	<h5>내 정보 관리</h5>
	<div class="myinfo_container1">
	<div class="myinfo_container2">
		<label for="name" class="myinfoInput_label">이름</label>
		<div class="myinfoinput" id="myinfoinput">
		<input type="text" id="myinfo_name" name="user-name" placeholder="홍길동" maxlength="20" class="input2" value="${name }"/><!-- value="${name }" -->
		<div style="flex: 0 0 auto;">
		<div style="display: flex; flex-direction: row; margin-bottom: -3px;">
			<button class="myinfo_btn0" id="myinfo_btn0">취소</button>
			<button class="myinfo_btn1" id="myinfo_btn1">수정</button>
		</div>
		</div>
		</div>
		<div style="padding-top: 3px;">
			<div class="hidden1" id="count0" style="float: left; margin-left: 10px; margin-top:4px; font-size: 12px; color: rgb(204, 153, 0);">0</div>
			<span class="hidden1" id="counter0" style="margin-left: 3px; color: rgb(136, 136, 136); font-size: 12px;">/20</span>
		</div>
	</div>
	
	<div style="margin-bottom: 50px;">
		<label for="name" class="myinfoInput_label">아이디</label>
		<div class="myinfoinput">
		<input type="text" disabled name="user-email" maxlength="50" class="input2" value="${email }"/>
		<div style="flex: 0 0 auto;">
		<div style="display: flex;">
		<div title="Google 간편로그인 연결됨: 2022-04-07" style="margin-right: 8px;">
		<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20px" height="20px" viewBox="0 0 20 20"><defs><path id="a" d="M10 1.667c2.06 0 4.005.752 5.514 2.084l.203.186-2.287 2.425a5 5 0 101.285 5.306L10 11.667V8.333h8.208c.083.503.13 1.047.138 1.634.003.151-.005.301-.023.45A8.333 8.333 0 0110 18.333 8.333 8.333 0 011.667 10 8.333 8.333 0 0110 1.667z"></path></defs><g fill="none" fill-rule="evenodd"><path d="M0 0h20v20H0z"></path><mask id="b" fill="#fff"><use xlink:href="#a"></use></mask><use fill="#34A853" xlink:href="#a"></use><path fill="#EA4335" d="M8.412.515l10.309 1.676-10.293 9.307L.472 5.641z" mask="url(#b)"></path><path fill="#FBBC04" d="M1.667 5.833L7.5 10l-5.833 5-1.385-4.64z" mask="url(#b)"></path><path fill="#4285F4" d="M10 7.5h10V20l-10-8.333z" mask="url(#b)"></path></g></svg>
		</div>
		<div style="width: 1px; height: 18px; border-left: 1px solid rgb(225, 225, 225);"></div>
		<button class="myinfo_btn1" id="myinfo_id_btn">수정 불가</button>
		</div>
		</div>
		</div>
	</div>
	
	<div class="myinfo_container2">
		<label for="name" class="myinfoInput_label">휴대폰 번호</label>
		<div class="myinfoinput" id="myinfoinput2">
		<input type="text" id="myinfo_tellNo" name="tellNo" placeholder="010-1234-5678" maxlength="20" class="input2" value="${phoneNum }" />
		<div style="flex: 0 0 auto;">
		<div style="display: flex; flex-direction: row; margin-bottom: -3px;">
			<button class="myinfo_btn0" id="myinfo_btn2">취소</button>
			<button class="myinfo_btn1" id="myinfo_btn3">수정</button>
		</div>
		</div>
		</div>
		<div style="padding-top: 3px;">
			<div class="hidden1" id="count1" style="float: left; margin-left: 10px; margin-top:4px; font-size: 12px; color: rgb(204, 153, 0);">0</div>
			<span class="hidden1" id="counter1" style="margin-left: 3px; color: rgb(136, 136, 136); font-size: 12px;">/20</span>
		</div>
	</div>
	
	<div class="myinfo_container2">
		<label for="name" class="myinfoInput_label">부서명</label>
		<div class="myinfoinput" id="myinfoinput3">
		<input type="text" id="teamName" name="teamName" placeholder="서비스 기획팀" maxlength="40" class="input2" value="${team }"/>
		<div style="flex: 0 0 auto;">
		<div style="display: flex; flex-direction: row; margin-bottom: -3px;">
			<button class="myinfo_btn0" id="myinfo_btn4">취소</button>
			<button class="myinfo_btn1" id="myinfo_btn5">수정</button>
		</div>
		</div>
		</div>
		<div style="padding-top: 3px;">
			<div class="hidden1" id="count2" style="float: left; margin-left: 10px; margin-top:4px; font-size: 12px; color: rgb(204, 153, 0);">0</div>
			<span class="hidden1" id="counter2" style="margin-left: 3px; color: rgb(136, 136, 136); font-size: 12px;">/40</span>
		</div>
	</div>
	
	<div class="myinfo_container2">
		<label for="name" class="myinfoInput_label">주요업무</label>
		<div class="myinfoinput" id="myinfoinput4">
		<input type="text" id="mainJob" name="mainJob" placeholder="서비스 기획 및 프로젝트 관리" maxlength="50" class="input2" value="${task }"/>
		<div style="flex: 0 0 auto;">
		<div style="display: flex; flex; flex-direction: row; margin-bottom: -3px;">
			<button class="myinfo_btn0" id="myinfo_btn6">취소</button>
			<button class="myinfo_btn1" id="myinfo_btn7">수정</button>
		</div>
		</div>
		</div>
		<div style="padding-top: 3px;">
			<div class="hidden1" id="count3" style="float: left; margin-left: 10px; margin-top:4px; font-size: 12px; color: rgb(204, 153, 0);">0</div>
			<span class="hidden1" id="counter3" style="margin-left: 3px; color: rgb(136, 136, 136); font-size: 12px;">/50</span>
		</div>
	</div>
	</div>
	
	<h5>기타설정</h5>
	<ul style="margin-bottom: 40px;">
		<li class="li layout">
			<button class="h" id="open_timezone_btn">타임존 설정</button><span>Pacific/Niue, -11:00</span>
		</li>
		<li class="li">
			<button class="h" id="open_password_btn">비밀번호 변경</button>
		</li>
		<li class="li">
			<button class="h" id="logout">로그아웃</button>
		</li>
		<li class="li_1">
			<button class="h" id="open_out_btn">회원 탈퇴</button>
		</li>
	</ul>
	</div>
	</div>
	</div>
	</main>
	
</div>	
</div>	
	
	<!-- 모달시작 -->
	<div id="timezone_modal">
	<div class="modal-content">
		<div class="modal_header">
			<div class="title-text">
				<h2>Timezone</h2>
				<span class="close" id="close_timezone">&times;</span>
			</div>
			
			<div style="padding-top: 10px;">
				<span class="timezone_subtitle">도시명을 입력 및 선택하시면 도시의 현재 시각으로 설정됩니다.</span>
			</div>
		</div>
		
		<div>
			<div style="margin-top: 32px;">
				<input type="text" maxlength="100" placeholder="도시명을 입력하세요." class="timezone_input1"/>
			</div>
			<div class="timezone_box1">
<% 				
				for(TimezoneDto dto : list){
%>
				<div class="timezone_radio1">
					<input type="radio" name="timezone" value="<%= dto.getTimezone_id() %>"/> <!-- id="timezone001" -->
					<label for="timezone001" class="timezone_city">
					<span><%=dto.getCapital_name() %>(GMT <%= dto.getTime() %>)</span>
					</label>
				</div>
<% 				
				}
%>				
			</div>
		</div>
	<div class="modal_footer">
		<div class="btn_box">
			<button type="button" class="modal_btn11" id="close_timezone2">
				<span>취소</span>
			</button>
			<button type="button" class="modal_btn12">
				<span>저장</span>
			</button>
		</div>
	</div>
	</div>
	</div>
	
	
	<div id="changePW_modal">
		<div class="modal-content" style="height: 445px;">
			<div class="modal_header">
				<div class="title-text">
					<h2>비밀번호 변경</h2>
					<span class="close" id="close_password">&times;</span>
				</div>
			</div>
			
			<div class="modal_body">
				<div class="password_container1">
					<h3 class="h3">
						<span>현재 비밀번호</span>
					</h3>
					<input type="password" id="current" placeholder="현재 비밀번호를 입력해주세요." class="password_c_pw" autocomplete="off" minlength="6" maxlength="30" value="" required/>
					<span class="password_validate">
						<span class="password_error" id="password_error1">
						비밀번호를 입력해 주세요.
						</span>
					</span>
				</div>
				
				<div class="container1">
					<h3 class="h3">
						<span>새 비밀번호</span>
					</h3>
					<input type="password" id="newPassword" placeholder="새 비밀번호를 입력해주세요." class="password_c_pw" autocomplete="off" minlength="6" maxlength="30" value="" required/>
					<span class="password_validate">
						<span class="password_error" id="password_error2">
						6자리 ~ 30자리 이내로 입력해주세요.
						</span>
					</span>
				</div>
				
				<div class="password_container1">
					<h3 class="h3">
						<span>새 비밀번호 확인</span>
					</h3>
					<input type="password" id="newCheck" placeholder="새 비밀번호를 다시 한 번 입력해 주세요." class="password_c_pw" autocomplete="off" minlength="6" maxlength="30" value="" required/>
					<span class="password_validate">
						<span class="password_error" id="password_error3">
						6자리 ~ 30자리 이내로 입력해주세요.
						</span>
					</span>
				</div>
			</div>
			
			<div class="modal_footer">
				<div class="btn_box">
					<button type="button" class="modal_btn11" id="close_password2">
						<span>취소</span>
					</button>
					<button type="button" class="modal_btn12" id="change_password_btn">
						<span>저장</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="out_background">
		<div class="modal-content_out">
			<div class="modal_header">
				<div><h2>회원 탈퇴</h2>
					<span class="close" id="close_out">&times;</span>
				</div>
				<div class="subtitle_out">※주의!<br/>회원 탈퇴를 하시면 <b>현재까지 등록된 모든 정보와 컨텐츠가 삭제</b>되며, 이는 복원이 불가능합니다. 정말 탈퇴하시겠습니까?</div>
			</div>
			<div class="modal_footer">
				<div class="btn_box">
					<button type="button" class="modal_btn12" id="close_out2">
						<span>취소</span>
					</button>
					<button type="button" class="modal_btn11" id="MemberDelete">
						<span>회원 탈퇴</span>
					</button>
				</div>
			</div>	
		</div>
	</div>
	<script>
	$(function(){
		$("#change_password_btn").click(function(){
			var Pw = ${Pw};
			var one = $("#current").val();
			var two = $("#newPassword").val();
			var three = $("newCheck").val();
			$.ajax({
				type: 'post',
				url: 'Option1ChangePwServlet',
				data: { "newPassword" : two, "member_id" : 4 },
				datatype: "json",
				success: function(d){
					alert("success");
					$("#changePW_modal").css("display", "none");
					alert("비밀번호가 바뀌었습니다.");
				},
				error: function(r,s,e){
					alert("error");
				}
			});
		});
		
		$("input[type=password]").keyup(function(key){
            $(this).attr("value",$(this).val());
        });  
		$("input[type=password]").focus(function(){
			$(this).css("border-bottom-color", "#d9ad2b");
		});
		
		$(document).on("focusout", "#current", function(){
			var current = $(this).val();
			var Pw = ${Pw};
			if(current.length<6 || current.length>30){
            	$("#password_error1").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error1").html("6자리 ~ 30자리 이내로 입력해주세요.");
    			return false;
            }else if(current != Pw){
            	$("#password_error1").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error1").html("현재비밀번호를 다시 입력해주세요.");
    			return false;
            }else{
            	$("#password_error1").css("opacity","0");
    			$(this).css("border-bottom-color", "#e1e1e1");
    			return true;
            }
		});
		
		$(document).on("focusout", "#newPassword", function(){
			var npw = $(this).val();
            var number = npw.search(/[0-9]/g);
            var english = npw.search(/[a-z]/ig);
            if(npw.length<6 || npw.length>30){
    			$("#password_error2").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error2").html("6자리 ~ 30자리 이내로 입력해주세요.");
    			return false;
    		}else if(npw.search(/\s/) != -1){
    			$("#password_error2").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error2").html("비밀번호는 공백없이 입력해주세요.");
    			return false;
    		}else if(number<0 || english<0){
    			$("#password_error2").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error2").html("영문, 숫자를 혼합하여 입력해주세요.");
    			return false;
    		}else{
    			$("#password_error2").css("opacity","0");
    			$(this).css("border-bottom-color", "#e1e1e1");
    			return true;
    		}
		});
       
		$(document).on("focusout", "#newCheck", function(){
			var npw = $("#newPassword").val();
			var newCheck = $(this).val();
			if(newCheck.length<6 || newCheck.length>30){
            	$("#password_error3").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error3").html("6자리 ~ 30자리 이내로 입력해주세요.");
    			return false;
            }else if(newCheck != npw){
            	$("#password_error3").css("opacity","1");
    			$(this).css("border-bottom-color","#ed5454");
    			$("#password_error3").html("변경할 비밀번호가 일치하지 않습니다. 비밀번호를 다시 확인해 주세요.");
    			return false;
            }else{
            	$("#password_error3").css("opacity","0");
    			$(this).css("border-bottom-color", "#e1e1e1");
    			return true;
            }
		});    
       
		
	});
	</script>
	
	<script>
	    var timezone_modal = document.getElementById('timezone_modal');
	    var password_modal = document.getElementById('changePW_modal');
	    var out_modal = document.getElementById('out_background');
	    var open_timezone = document.getElementById('open_timezone_btn');
	    var open_password = document.getElementById('open_password_btn');
	    var open_out = document.getElementById('open_out_btn');
	    var close_timezone = document.getElementById('close_timezone');
	    var close_password = document.getElementById('close_password');
	    var close_out = document.getElementById('close_out');
	    var close_timezone2 = document.getElementById('close_timezone2');
	    var close_password2 = document.getElementById('close_password2');
	    var close_out2 = document.getElementById('close_out2');
	    var el = document.getElementsByClassName('password_c_pw');
	    var Pw = ${Pw};
	    open_timezone.onclick = function(e){
	        timezone_modal.style.display = "block";
	    }
	    open_password.onclick = function(e){
	    	if(Pw == null){
	    		alert("비밀번호를 바꿀 수 없는 아이디입니다.");
	    	}else{
	    		password_modal.style.display = "block";
	    	}
	    }
	    open_out.onclick = function(e){
	        out_modal.style.display = "block";
	    }
	    close_timezone.onclick = function(e){
	        timezone_modal.style.display = "none";
	    }
	    close_password.onclick = function(e){
	    	password_modal.style.display = "none";
	    	for(var i=0; i<el.length; i++){	el[i].value = '';}
	    }
	    close_out.onclick = function(e){
	    	out_modal.style.display = "none";
	    }
	    close_timezone2.onclick = function(e){
	        timezone_modal.style.display = "none";
	    }
	    close_password2.onclick = function(e){
	    	password_modal.style.display = "none";
	    	for(var i=0; i<el.length; i++){	el[i].value = '';}
	    }
	    close_out2.onclick = function(e){
	    	out_modal.style.display = "none";
	    }
	    window.onclick = function(event) {
	        if(event.target == password_modal){
	        	var result = confirm("비밀번호 변경을 하지 않고 나가시겠습니까?");
	        	if(result){
	        		password_modal.style.display = "none";
	        		for(var i=0; i<el.length; i++){	el[i].value = '';}
	        	}
	        }
	    }
	</script>
	
	
	
</body>
</html>
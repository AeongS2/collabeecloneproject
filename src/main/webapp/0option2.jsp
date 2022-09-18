<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int member_id = (Integer)(session.getAttribute("member_id")); */
	HomeDao hDao = new HomeDao();
	
	int member_id = 4;
	int corporation_id = 5;
	ArrayList<NoneFolderDto> listNone = (ArrayList<NoneFolderDto>)request.getAttribute("list2");
	//int corporation_id = (Integer)session.getAttribute("corporation_id");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>option2</title>
	<link rel="icon" href="Images/favicon.ico" type="image/x-icon">
	<script src="js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  	<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
  	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<style>
	
	
	
	
	
	
	
	
	.a{
		display: none;
	}
	body{
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		font-size: 13px;
    	color: #222;
	}
	a{
		text-decoration: none;
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
    .im{
    	width: 240px;
    	float: left;
    	margin-left: -10px;
    	margin-top: -10px;
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
    	background-color: white;
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
	.p1{
    	display: block;
	    font-size: 12px;
	    line-height: 1.5;
	    margin-top: -10px;
	    color: rgb(136, 136, 136);
    }
	.content{
    	flex: 1 1 auto;
    	height: 100vh;
    	max-width: 900px;
	    overflow-y: auto;
	    overflow-x: hidden;
	    padding: 40px;
	    margin-top: -30px;
    }
    .content::-webkit-scrollbar {
		width:4px;
	}
	.content::-webkit-scrollbar-thumb {
	    height: 70%; /* 스크롤바의 길이 */
	    background-color: #e1e1e1; /* 스크롤바의 색상 */
	    border-radius: 2px;
	}
	.content::-webkit-scrollbar-track{
		background-color: white;
	}
	.setting_item_subtitle{
		display: inline-block;
	    font-size: 12px;
	    line-height: 18px;
	    color: #888;
	    font-weight: 700;
	}
	.list_item{
		display: flex;
	    align-items: center;
	    margin-top: 12px;
	}
	.checkbox_label{
		margin-right: 5px;
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	}
	input {
    	background-color: #fff;
	}
	.checkbox_input{
		margin-right: 0.2em;
		display: inline-block;
	    vertical-align: middle;
	    accent-color: gray;
	    border: 2px solid gray;
	}
	.week{
		vertical-align: middle;
		padding-right: 15px;
	}
	select{
		height: 32px;
	    text-indent: 10px;
	    border: 1px solid #e1e1e1;
	    background-color: #fff;
	    font-size: 12px;
	    width: 120px;
	}
	.tilt{
		padding-left: 12px;
    	padding-right: 12px;
	}
	.mailAlarm_header{
		padding: 40px 0px 40px 10px;
    	border-bottom: 1px solid rgb(225, 225, 225);
    	display: block;
	}
	h2{
		font-size: 18px;
	    font-weight: bold;
	    line-height: 1.2;
	    color: rgb(34, 34, 34);
	}
	.wAlarm_header{
		padding-top: 40px;
	    padding-left: 10px;
	    padding-bottom: 13px;
	}
	.mailAlarm_body{
		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	}
	.option_w_list{
		padding-bottom: 40px;
	}
	.list_li{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    padding: 16px 0px 16px 10px;
	    border-bottom: 1px solid rgb(225, 225, 225);
	}
	.list_li1{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	}
	/*토글시작*/
	.toggleSwitch{
		width: 37px;
	    height: 15px;
	    background-color: rgb(212 211 208);
	    border-radius: 11px;
	    cursor: pointer;
	    content: "";
	    position: relative;
	    display: block;
	}
	/* 토글 버튼 */
	.toggleSwitch .toggleButton {
		position: absolute;
	    top: 7px;
	    left: 0px;
	    cursor: pointer;
	    /* background-color: rgb(255, 255, 255); */
	    width: 22px;
	    height: 22px;
	    background-color: #fafafa;
	    border-radius: 50%;
	    content: "";
	    transition: transform 0.2s ease 0s;
	    transform: translateY(-50%);
	    box-shadow: 0px 1px 3px 0px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 2px 1px -1px rgb(0 0 0 / 12%);
	}
	#toggle:checked ~ .toggleSwitch{
		background: rgba(217, 173, 43, 0.38);
	}
	#toggle:checked ~ .toggleSwitch .toggleButton{
		left: calc(100% - 20px);
		background: #d9ad2b;
	}
	
	.toggleSwitch1{
		width: 37px;
	    height: 15px;
	    background-color: rgb(212 211 208);
	    border-radius: 11px;
	    cursor: pointer;
	    content: "";
	    position: relative;
	    display: block;
	}
	/* 토글 버튼 */
	.toggleSwitch1 .toggleButton1 {
		position: absolute;
	    top: 7px;
	    left: 0px;
	    cursor: pointer;
	    width: 22px;
	    height: 22px;
	    background-color: #fafafa;
	    border-radius: 50%;
	    content: "";
	    transition: transform 0.2s ease 0s;
	    transform: translateY(-50%);
	    box-shadow: 0px 1px 3px 0px rgb(0 0 0 / 20%), 0px 1px 1px 0px rgb(0 0 0 / 14%), 0px 2px 1px -1px rgb(0 0 0 / 12%);
	}
	.toggle1:checked ~ .toggleSwitch1{
		background: #76c3ac8f;
	}
	.toggle1:checked ~ .toggleSwitch1 .toggleButton1{
		left: calc(100% - 20px);
		background: #33846C;
	}
		
	/* 이거 그러면 협업공간은 다 같이 움직일텐데 우짜지 */
	</style>
	<script>
	$(function(){
		
		
		
		
	
		$("#ready1, #ready2").click(function(){
			alert("서비스가 준비 중입니다.");
		});
		
		$("#allDayOn").click(function(){
			if($("#allDayOn").is(":checked")==true){
				$("select[name=alarmStart]").val('0800').prop("selected",true);
				$("select[name=alarmEnd]").val('1900').prop("selected",true);
				$("select[name=alarmStart]").attr("disabled",true);
				$("select[name=alarmEnd]").attr("disabled",true);
			} else{ //if($('.allDayOn').is(":checked")==false)
				$("select[name=alarmStart]").removeAttr("disabled");
				$("select[name=alarmEnd]").removeAttr("disabled");
			}
		});
		
	});
	</script>
</head>
<body>
	
	
	
	
	
	
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
    		
    	<!-- <div class="topright">
    		<button class="btn1"></button>
    		<button class="btn2">
    		<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
    		</button>
    		<button class="btn3">
    		<span>파트너</span>
    		<span class="number">4</span>
    		</button>
    	</div> -->
    	
    	</div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="Controller?command=option1">내 정보</a>
    			<a class="m selected" href="">알림</a>
    			<a class="m" href="partner_management.jsp">파트너 관리</a>
    			<a class="m" id="ready1">외부 서비스</a>
    			<a class="m" href="setting_price.jsp">가격 및 결제</a>
    			<a class="m" href="Controller?command=option3">업데이트</a>
    			<a class="m" id="ready2">Webhook &#946;</a>
    		</nav>
    	</div>
	</header>

	<div class="content">
		<div class="content_header">
			<h2>알림 시간 설정</h2>
			<p class="p1">회사의 근무일과 근무시간에 맞춰서 콜라비 알림을 설정하세요. 설정한 시간이 지나면 알림을 받지 않게 됩니다.<br/>
			알림을 받지 않더라도 '새로운 소식'에서 동 소식을 확인할 수 있습니다.</p>
		</div>
	
	<div style="padding-bottom: 40px; border-bottom: 1px solid rgb(225, 225, 225);">
	<div style="margin-top: 28px;">
		<span class="setting_item_subtitle">선택한 요일에 알림받기</span>
		<div class="list_item">
		<label for="Mon" class="checkbox_label">
		<input type="checkbox" id="Mon" name="monday" class="checkbox_input"/>
		<span class="week">월</span>
		</label>	
		
		<label for="Tue" class="checkbox_label">
		<input type="checkbox" id="Tue" name="tuesday" class="checkbox_input"/>
		<span class="week">화</span>
		</label>
		
		<label for="Wed" class="checkbox_label">
		<input type="checkbox" id="Wed" name="wednesday" class="checkbox_input"/>
		<span class="week">수</span>
		</label>
		
		<label for="Thu" class="checkbox_label">
		<input type="checkbox" id="Thu" name="thursday" class="checkbox_input"/>
		<span class="week">목</span>
		</label>
		
		<label for="Fri" class="checkbox_label">
		<input type="checkbox" id="Fri" name="Friday" class="checkbox_input"/>
		<span class="week">금</span>
		</label>
		
		<label for="Sat" class="checkbox_label">
		<input type="checkbox" id="Tue" name="Saturday" class="checkbox_input"/>
		<span class="week">토</span>
		</label>
		
		<label for="Sun" class="checkbox_label">
		<input type="checkbox" id="Sun" name="Sunday" class="checkbox_input"/>
		<span class="week">일</span>
		</label>
		</div>
	</div>

	<div style="margin-top:28px;">
		<span class="setting_item_subtitle">선택한 시간대에 알림 받기</span>
		<div class="list_item">
			<select name="alarmStart" disabled>
			<option value="0800" selected disabled hidden>08:00</option>
				<option value="0000">00:00</option>
				<option value="0030">00:30</option>
				<option value="0100">01:00</option>
				<option value="0130">01:30</option>
				<option value="0200">02:00</option>
				<option value="0230">02:30</option>
				<option value="0300">03:00</option>
				<option value="0330">03:30</option>
				<option value="0400">04:00</option>
				<option value="0430">04:30</option>
				<option value="0500">05:00</option>
				<option value="0530">05:30</option>
				<option value="0600">06:00</option>
				<option value="0630">06:30</option>
				<option value="0700">07:00</option>
				<option value="0730">07:30</option>
				<option value="0800">08:00</option>
				<option value="0830">08:30</option>
				<option value="0900">09:00</option>
				<option value="0930">09:30</option>
				<option value="1000">10:00</option>
				<option value="1030">10:30</option>
				<option value="1100">11:00</option>
				<option value="1130">11:30</option>
				<option value="1200">12:00</option>
				<option value="1230">12:30</option>
				<option value="1300">13:00</option>
				<option value="1330">13:30</option>
				<option value="1400">14:00</option>
				<option value="1430">14:30</option>
				<option value="1500">15:00</option>
				<option value="1530">15:30</option>
				<option value="1600">16:00</option>
				<option value="1630">16:30</option>
				<option value="1700">17:00</option>
				<option value="1730">17:30</option>
				<option value="1800">18:00</option>
				<option value="1830">18:30</option>
				<option value="1900">19:00</option>
				<option value="1930">19:30</option>
				<option value="2000">20:00</option>
				<option value="2030">20:30</option>
				<option value="2100">21:00</option>
				<option value="2130">21:30</option>
				<option value="2200">22:00</option>
				<option value="2230">22:30</option>
				<option value="2300">23:00</option>
				<option value="2330">23:30</option>
				<option value="2400">24:00</option>
			</select>
			<span class="tilt">~</span>
			<select name="alarmEnd" disabled>
			<option value="1900" selected disabled hidden>19:00</option>
				<option value="0000">00:00</option>
				<option value="0030">00:30</option>
				<option value="0100">01:00</option>
				<option value="0130">01:30</option>
				<option value="0200">02:00</option>
				<option value="0230">02:30</option>
				<option value="0300">03:00</option>
				<option value="0330">03:30</option>
				<option value="0400">04:00</option>
				<option value="0430">04:30</option>
				<option value="0500">05:00</option>
				<option value="0530">05:30</option>
				<option value="0600">06:00</option>
				<option value="0630">06:30</option>
				<option value="0700">07:00</option>
				<option value="0730">07:30</option>
				<option value="0800">08:00</option>
				<option value="0830">08:30</option>
				<option value="0900">09:00</option>
				<option value="0930">09:30</option>
				<option value="1000">10:00</option>
				<option value="1030">10:30</option>
				<option value="1100">11:00</option>
				<option value="1130">11:30</option>
				<option value="1200">12:00</option>
				<option value="1230">12:30</option>
				<option value="1300">13:00</option>
				<option value="1330">13:30</option>
				<option value="1400">14:00</option>
				<option value="1430">14:30</option>
				<option value="1500">15:00</option>
				<option value="1530">15:30</option>
				<option value="1600">16:00</option>
				<option value="1630">16:30</option>
				<option value="1700">17:00</option>
				<option value="1730">17:30</option>
				<option value="1800">18:00</option>
				<option value="1830">18:30</option>
				<option value="1900">19:00</option>
				<option value="1930">19:30</option>
				<option value="2000">20:00</option>
				<option value="2030">20:30</option>
				<option value="2100">21:00</option>
				<option value="2130">21:30</option>
				<option value="2200">22:00</option>
				<option value="2230">22:30</option>
				<option value="2300">23:00</option>
				<option value="2330">23:30</option>
				<option value="2400">24:00</option>
			</select>
		</div>
		<div class="list_item">
		<label for="allDayOn" class="checkbox_label">
		<input type="checkbox" id="allDayOn" name="allDayOn" class="checkbox_input" checked/>
		<span class="week">하루 종일 알림 받기</span>
		</label>
		</div>
	</div>
	</div>
	
	<div class="mailAlarm_header">
		<h2>메일 알림 설정</h2>
		<div class="mailAlarm_body">
		<p class="p1">모든 활동 소식을 메일로 받아보세요. 뉴스피드를 기준으로 소식을 알려드립니다.<br/>
		단, 메일 인증이 완료된 계정으로만 메일이 발송됩니다.</p>
		<div>
			<div style="float: right; padding-left: 10px; padding-right: 10px;">
			<input type="checkbox" id="toggle" hidden checked>
			<label for="toggle" class="toggleSwitch">
	  		<span class="toggleButton"></span>
			</label>
			</div>
		</div>
		</div>
		
	</div>
	
	<div class="wAlarm_header">
		<h2>협업공간 알림 설정</h2>
		<p class="p1">내가 가입한 협업공간의 알림을 꺼보세요. 협업공간 내 모든 활동의 알림을 받지 않게 됩니다.<br/>
		나를 언급한 멘션, 할 일, 의사결정의 활동알림은 받게 됩니다.</p>
		<ul class="option_w_list">
			<li class="list_li">
				<div class="list_li1">
				<svg class="svg1" viewBox="0 0 24 24" width="23px" height="23px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
				<span>프로젝트</span>
				</div>
				<div>
					<div style="float: right; padding-left: 10px; padding-right: 10px;">
					<input type="checkbox" class="toggle1" id="toggle_w" hidden checked>
					<label for="toggle_w" class="toggleSwitch1">
			  		<span class="toggleButton1"></span>
					</label>
					</div>
				</div>
			</li>
		
		</ul>
	</div>
	
	
	
	
	</div>
	</main>
</body>
</html>
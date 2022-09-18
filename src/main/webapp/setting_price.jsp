<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가격 및 결제</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
   
    <style> /* 사이드바 */
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
    .left-top{
        padding-left:22px;
        height: 72px;
        /* position: fixed; */
        top: 0px;
    }
    nav ul{
		list-style-type: none;
        margin-bottom:20px;
    }
	li a {
		display: block;
		color: #000;
		text-decoration: none;
	}
	li a:hover:not(.active){
		background-color: #eae9e9;
	}
	.sidebar{
		padding:5px 16px 5px 20px;
        align-items:stretch;
	}
	.exp{
		margin: 0px 0px 3px 22px;
	}
	.left-bar{
		background: #f7f6f5;
		top: 0;
		left: 0;
		width: 240px;
		height: 100%;
		/* padding: 20px 0; */
		transition: all 0.5s ease;
		/* overflow-y: auto; */
	}
	.left-bar::-webkit-scrollbar {
		width:4px;
	}
	.left-bar::-webkit-scrollbar-thumb {
        height: 70%; /* 스크롤바의 길이 */
        background: #e1e1e1; /*스크롤바의 색상*/
        border-radius: 2px;
	}

    </style>
    
    <style>  /* 설정 상단 탭 */
    body, *{
        font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
        box-sizing: border-box;  
        margin:0;
        padding:0;
        outline: none;
        font-size:13px;
        color:rgb(34, 34, 34);
    }
    div{
        -webkit-box-sizing: border-box;
        -moz-box-sizing: border-box;  
        box-sizing: border-box; 
    }
    a{
        text-decoration:none;
    }
    input, button{
        border:none;
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
    .content{
    	flex: 1 1 auto;
    	height: 100vh;
	    overflow-y: auto;
	    overflow-x: hidden;
	    padding: 40px;
	    margin-top: -30px;
    }
    header{
    	width: 100%;
    	height: 106px;
        position: fixed;
        background-color: rgb(255,255,255);
        z-index: 1;
    }
    .setting_top{
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
	    margin-left: 40px;
    }
    .mastersearchbar{
    	display: flex;
	    flex-direction: row;
	    position: relative;
	    align-items: center;
    }
    .searchbar { /*상단 검색창*/
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
    .searchbar::placeholder{
        color:rgb(225, 225, 225);
    }
    .searchbar:hover{
        border:1px solid rgb(136, 136, 136);
    } 
    .searchbar:focus{
        background-color: rgba(255, 255, 255, 0.2);
        border: ipx solid rgb(136, 136, 136);
        width:269px;
    }
    .search_icon{
        fill: rgb(225, 225, 225);
        position: absolute;
        transition: fill 0.2s ease 0s;
        -webkit-box-align: center;
        border:none;
        margin-left:10px;
    }
    .topright{
    	position: relative;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: end;
	    justify-content: flex-end;
	    padding-right: 280px;
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
    }
    .btn2:hover, .btn3:hover{
    	filter: brightness(90%);
		transition: transform 10s;
    }
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
    .posting_bnt {/* 상단 문서작성버튼*/
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
        margin-right:70px;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
    }
    .posting_bnt:hover{
        background-color: rgb(179, 142, 34);
        border-color: rgb(179, 142, 34);
    }
    .posting_icon{ /*svg 색지정은 fill로!!*/
        fill: rgb(255, 255, 255);
        width:13px;
        height:13px;
    }
    .non{
        display:none;
    }


    </style>
 
    <style>
    #setting_price{
        display:flex;
        flex-direction:row;
        width: 100vw;
        min-width: 1100px;
        height: 100vh;
        overflow:hidden;
    }
    #price_container1{
        display:flex;
        flex-direction:column;
        /* width: 100%; */
        flex:1 1 auto;
        height: 100vh;
        min-width: 690px;
        overflow-y: auto;
    }
    #price_container2{
        min-width: 680px;
        max-width: 900px;
        overflow-x: hidden;
        padding: 40px;
        margin-top: 104px;
    }
    #price_head{
        display:flex;
        flex-direction:row;
        min-width: 860px;
        margin-bottom: 30px;
        line-height:1.6;
        justify-content:space-between;
    }
    #price_bnt1{
        display:none;
    }
    #price_bnt1_label{ /* 동그라미 라벨*/
        position: relative;
        width: 36px;
        height: 22px;
        background-color: rgb(217, 173, 43);
        border-radius: 11px;
        cursor: pointer;
        content:"";
    }
    #price_monthly{
        font-size:12px; 
        padding-right:10px;
    }
    #price_daily{
        font-size:12px; 
        padding-left:10px;
        color:rgb(136, 136, 136);
    }
    /* 버튼 누르면 가격 바뀌고 동그라미 옮겨짐. 제이쿼리 */
    .bnt1_style{ /* 동그라미*/
        display: block;
        position: absolute;
        top: 2px;
        left: 0px;
        cursor: pointer;
        background-color: rgb(255, 255, 255);
        width: 18px;
        height: 18px;
        border-radius: 9px;
        content: "";
        transition: transform 0.2s ease 0s;
        transform: translateX(2px);
    }
    table{
        width: 860px;
        border-collapse: separate;
        border-spacing: 0px;
        margin-bottom: 8px;
        font-size:14px;
    }
    thead, tbody{
        display: table-row-group;
        vertical-align: middle;
        border-spacing: 0px;
    }
    tbody{
        margin-bottom:30px;
    }
    th{
        border-bottom:1px solid rgb(34, 34, 34);
        text-align:left;
        font-size: 14px;
        line-height: 22px;
        font-weight: bold;
    }
    .price_table1{
        width: 140px;
        height: 226px;
        position: relative;
        text-align: center;
        padding: 0px 12px 10px;
        margin: 0px 8px 0px 45px;
    }
    .price_table2{
        text-align: left;
        vertical-align: middle;
        padding: 12px 0px;
        line-height: 1.5;
        color: rgb(34, 34, 34);
        font-size: 14px;
        font-weight: normal;
        border-bottom: 1px solid rgb(225, 225, 225);
    }
    .price_table3{
        text-align: center;
        vertical-align: middle;
        padding: 12px 8px;
        line-height: 1.5;
        color: rgb(34, 34, 34);
        border-bottom: 1px solid rgb(225, 225, 225);
        font-size: 14px;
    }
    .price_table4{
        display: flex;
        -webkit-box-align: center;
        padding: 16px 0px;
        line-height: 1.57;
        color: rgb(34, 34, 34);
        font-size: 14px;
        border-bottom: 1px solid rgb(225, 225, 225);
        align-items: center;
    }
    .price_table5{
        text-align: center;
        vertical-align: middle;
        padding: 16px 8px;
        line-height: 1.5;
        color: rgb(34, 34, 34);
        border-bottom: 1px solid rgb(225, 225, 225);
        font-size: 14px;
        width:172px;
    }
    .price_table6{
        border-right: 1px solid rgb(225, 225, 225);
    }
    .font_weight{
        font-weight:bold;
    }
    .price_thead_title{
        height: 26px;
        font-size: 16px;
        font-weight: bold;
        line-height: 26px;
        padding: 0px 16px;
        border-radius: 8px;
        margin-bottom:30px;
    }
    .price_thead_bnt{
        position: relative;
        font-size: 16px;
        padding: 10px 0px;
        margin-top:25px;
        border-radius: 8px;
        width: 100%;
        border-width:1px;
        border-style:solid;
        font-weight: 500;
        line-height: 1.5;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
    }
    .thead_bnt_style1{
        margin-top:61px;
        cursor: not-allowed;
        opacity: 0.6;
        background-color: transparent;
        border-color: rgb(193, 193, 193);
    }
    .thead_bnt_style2{
        color:rgb(255,255,255);
        border-color:rgb(217,173,43);
        background-color:rgb(217,173,43);
        cursor:pointer;
    }
    .thead_bnt_style2:hover{
        background-color: rgb(179, 142, 34);
        border-color: rgb(179, 142, 34);
    }
    .thead_bnt_style3{
        color:rgb(255,255,255);
        border-color:rgb(0,113,99);
        background-color:rgb(0, 113, 99);
        cursor:pointer;
    }
    .thead_bnt_style3:hover{
        background-color: rgb(17, 87, 78);
        border-color: rgb(17, 87, 78);
    }
    .thead_bnt_style4{
        color:rgb(0, 113, 99);
        border-color:rgb(0, 113, 99);
        background-color:rgb(255, 255, 255);
        cursor:pointer;
    }
    .thead_bnt_style4:hover{
        color:rgb(255,255,255);
        background-color:rgb(0, 113, 99);
    }
    .price_span_style1{
        height: 32px;
        margin-left: 4px;
        border-radius: 8px;
        background-color: rgb(245, 244, 243);
        padding: 4px 8px;
        font-weight: bold;
        line-height: 24px;
        font-size: 16px;
        text-align: center;
    }
    .price_ask{
        margin-left: 4px;
        font-size: 14px;
        border-bottom:1px solid rgb(204, 153, 0);
        color: rgb(204, 153, 0);
        background-color: rgb(255, 255, 255);
        cursor:pointer;
    }
    .price_messenger{
        font-size: 14px;
        line-height: 22px;
        padding: 2px 6px;
        margin-left:3px;
        border-radius: 8px;
        position: relative;
        font-weight: 500;
        text-align: center;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
        cursor: pointer;
        color: rgb(204, 153, 0);
        background-color: rgb(255, 255, 255);
        border: 1px solid rgb(217, 173, 43);
    }
    #price_fold{
        display: flex;
        align-items: center;
        height: 32px;
        margin-bottom: 24px;
        padding: 5px 16px 5px 20px;
        border-radius: 16px;
        box-shadow: rgb(0 0 0 / 20%) 0px 2px 4px 0px;
        border: 1px solid rgba(0, 0, 0, 0.1);
        background-color: rgb(255, 255, 255);
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s;
        font-size: 14px;
        line-height: 22px;
        cursor:pointer;
    }
    ::-webkit-scrollbar{
        width:4px;
    }
    ::-webkit-scrollbar-thumb{
        border-radius:2px;
        background:#e1e1e1;
    }


    .none{
        display:none;
    }
    .hidden{
        visibility:hidden;
    }
   
    </style>

    <script>
    var loginId = <%=(Integer)session.getAttribute("loginJH")%>;  
    
        $(function(){
        	$(".thead_bnt_style2").click(function(){
                $("#payment_b").css({visibility:"visible",opacity:1});
            });
        	
            $(".thead_bnt_style3").click(function(){
                var modal = $(this).attr("class");
                $("#payment_e").css({visibility:"visible",opacity:1});
            });
            
            //기본기능 열고 접기
            $("#price_fold").click(function(){
                var text = $(this).text();
                if(text=="자세히 보기"){
                    $("#price_fold span").html("간략히 보기");
                    $("#price_fold svg").css("transform", "rotate(0deg)")
                } else {
                    $("#price_fold span").html("자세히 보기");
                    $("#price_fold svg").css("transform", "rotate(180deg)")
                }
                $("tr.non").toggle();
            });
            //검색창 hover
            $(".searchbar").hover(function(){ 
                $(".searchbar::placeholder").css("color","rgb(136,136,136)");
                $(".search_icon svg").css("fill","rgb(136,136,136)");
            }, function(){
                $(".searchbar::placeholder").css("color", "rgb(225,225,225)");
                $(".search_icon svg").css("fill", "rgb(225,225,225)");
            });

            //문서작성클릭
            $(".posting_bnt").click(function(){
                location.href="Document.jsp";
            });

            //정기결제 가격 변동
            $("div.bnt1_style").click(function(){
                var text = $(this).css("transform");
                if(text.indexOf(16)>0) {
                    $(this).css("transform", "matrix(1, 0, 0, 1, 2, 0)");
                    $("#price_container2 thead tr td:nth-child(3) .font_weight:nth-child(2)").html("$6");
                    $("#price_container2 thead tr td:nth-child(4) .font_weight:nth-child(2)").html("$12");
                } else if(text.indexOf(2)>0){
                    $(this).css("transform","matrix(1, 0, 0, 1, 16, 0)");
                    $("#price_container2 thead tr td:nth-child(3) .font_weight:nth-child(2)").html("$5");
                    $("#price_container2 thead tr td:nth-child(4) .font_weight:nth-child(2)").html("$10");
                }
            });
            
            //가격정보 버튼 클릭시 페이지 이동(해야됨)
            // $(".thead_bnt_style2").click(function(){
            //     location.href="";
            // });
            // $(".thead_bnt_style3").click(function(){
            //     location.href="";
            // });
            $(".thead_bnt_style4, .price_ask, .price_messenger").click(function(){ 
                alert("서비스 준비중 입니다.");
            });
        });

    </script>
</head>
<body>
<div style="z-index:20; position:absolute;">
<%@ include file="payment.jsp"%>
</div>
<div id="setting_price">

<%@ include file="../WEB-INF/include/HomeSidebar.jsp" %>
    
<section id="price_container1"> 
    <header>
		<div class="setting_top">
            <div class="title">
            <div><h1>설정</h1></div>
			<div>
                <div class="mastersearchbar">
                    <div class="search_icon" class="bnt_base"><svg class="micro" viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
                    <input type ="text" class=searchbar placeholder="검색"/>
                    <button class="posting_bnt">
                        <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
                        <span style="color:rgb(255,255,255)">문서 작성</span>
                    </button>
                </div>
        	</div>
        </div>
    		
            <div class="topright">
                <button class="btn1"></button>
                <button class="btn2">
                <svg width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M15 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm-9-2V7H4v3H1v2h3v3h2v-3h3v-2H6zm9 4c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg>
                </button>
                <button class="btn3">
                <span>파트너</span>
                <span class="number">4</span>
                </button>
            </div>
        </div>
    	
    	<div class="header_mid">
    		<nav class="sort">
    			<a class="m" href="">내 정보</a>
    			<a class="m" href="">알림</a>
    			<a class="m" href="">파트너 관리</a>
    			<a class="m" id="ready">외부 서비스</a>
    			<a class="m" href="">가격 및 결제</a>
    			<a class="m selected" href="">업데이트</a>
    			<a class="m" id="ready">Webhook &#946;</a>
    		</nav>
    	</div>
	</header>
<div>   
    <div id="price_container2">
    <div id="price_head">
        <div>
            <span style="font-size:18px;" class="font_weight">가격정보</span>
            <p style="color:rgb(136, 136, 136); font-size:12px;">한 페이지 안에서 할 일, 파일, 의사결정, 일정 및 커뮤니케이션을 모두 담아 이슈를 해결해 보세요.
                <br/>동료들과 함께 무료로 시작해보세요.</p>
        </div>
        <div style="margin:30px; display:flex;">
            <span id="price_monthly">월간 정기 결제</span>
            <label for="price_bnt1" id="price_bnt1_label"><input type="checkbox" id="price_bnt1"><div class="bnt1_style"></div></label>
            <span id="price_daily">일간 정기 결제</span>
        </div>
    </div>

    <table>
        <thead>
            <tr>
                <td class="price_table1"></td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title price_thead_title">Free</div>
                    <div class="font_weight" style="font-size: 40px;">$0</div>
                    <button class="price_thead_bnt thead_bnt_style1">사용 중</button>
                </td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title" style="background-color: rgb(250, 243, 223); color: rgb(204, 153, 0);">Business</div>
                    <div class="font_weight" style="font-size: 40px;">$6</div>
                    <label for="">월간<br/>1인 기준 이용요금</label>
                    <button class="price_thead_bnt thead_bnt_style2">변경하기</button>
                </td>
                <td class="price_table1 price_table6">
                    <div class="font_weight price_thead_title" style="background-color: rgb(229, 241, 238); color: rgb(0, 115, 94);">Enterprise</div>
                    <div class="font_weight" style="font-size: 40px;">$12</div>
                    <label for="">월간<br/>1인 기준 이용요금</label>
                    <button class="price_thead_bnt thead_bnt_style3">변경하기</button>

                </td>
                <td class="price_table1">
                    <div class="font_weight price_thead_title" style="background-color: rgb(229, 241, 238); color: rgb(0, 115, 94);"">구축형</div>
                    <div><svg width="53px" height="53px" viewBox="0 0 56 56"><path d="M7 48V21a3 3 0 013-3h1v-3c0-2.21 1.79-4 4-4h.5V8.5a1.5 1.5 0 013 0V11h.5c2.21 0 4 1.79 4 4v3h1a3 3 0 013 3v5h4V13.315a3 3 0 014.045-2.813l12 4.457A3.002 3.002 0 0149 17.772V48H7zm17-27.5H10a.5.5 0 00-.492.41L9.5 21v24.5H18V29a3 3 0 013-3h3.5v-5a.5.5 0 00-.41-.492L24 20.5zm11 8H21a.5.5 0 00-.492.41L20.5 29v16.5h15V29a.5.5 0 00-.41-.492L35 28.5zm-1-15.685a.5.5 0 00-.492.41l-.008.09L33.499 26H35a3 3 0 013 3v16.5h8.5V17.772a.5.5 0 00-.246-.431l-.08-.038-12-4.457a.519.519 0 00-.174-.031zM24 31a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zm4 0a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zm4 0a1 1 0 011 1v8a1 1 0 01-2 0v-8a1 1 0 011-1zM19 13.5h-4a1.5 1.5 0 00-1.493 1.356L13.5 15v3h7v-3a1.5 1.5 0 00-1.356-1.493L19 13.5z" fill="#222" fill-rule="nonzero"></path></svg></div>
                    <label for="">On-premise<br/>Private SaaS</label>
                    <button class="price_thead_bnt thead_bnt_style4">도입문의</button>
                </td>
            </tr>
        </thead>
        
        <tbody>
            <th>
                기본 기능
            </th>
            <th class="price_table6"></th>
            <th class="price_table6"></th>
            <th class="price_table6"></th>
            <th></th>
            <tr>
                <td class="price_table2">알림을 받을 수 있는 협업
                    공간</td>
                <td class="price_table3 price_table6"><span class="font_weight" style="font-size:14px;">3개</span><br/>
                    <span style="color:rgb(134, 134, 134); font-size:13px;">회사 생성 시 공용공간 1개 추가</span></td>
                <td class="price_table3 font_weight price_table6">무제한</td>
                <td class="price_table3 font_weight price_table6">무제한</td>
                <td class="price_table3 font_weight">무제한</td>
            </tr>
            <tr>
                <td class="price_table2">완료된 협업공간</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr>
                <td class="price_table2">1회 업로드 용량</td>
                <td class="price_table3 price_table6">50MB</td>
                <td class="price_table3 price_table6">300MB</td>
                <td class="price_table3 price_table6">500MB</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">퇴사자 관리</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">회사/팀 통합 관리 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr> 
            <tr class="non">
                <td class="price_table2">협업공간 관리 (준비 중)</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr> 
            <tr class="non">
                <td class="price_table2">공용공간 관리 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">멤버 수</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">외부 협업자 수</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">CS (1:1 채팅상담)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#d9ad2b" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
            <tr class="non">
                <td class="price_table2">외부 서비스 연동 (준비 중)</td>
                <td class="price_table3 price_table6">5개</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3 price_table6">무제한</td>
                <td class="price_table3">무제한</td>
            </tr>
            <tr class="non">
                <td class="price_table2">이메일 연동 (준비 중)</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6">-</td>
                <td class="price_table3 price_table6"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
                <td class="price_table3"><svg width="22px" height="22px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path fill="#007163" d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z"></path></g></svg></td>
            </tr>
        </tbody>
    </table>

    <div style="display: flex; justify-content: center;"><button id="price_fold"><span>자세히 보기</span><svg viewBox="0 0 24 24" width="20px" height="20px" style="transform: rotate(180deg);"><path d="M19 15H5l7-7z" color="#222222"></path></svg></button></div>
       
    <table style="padding-bottom:40px;">
        <th colspan="5">
            부가 서비스 <span style="font-weight:normal;">*월간, 1인 기준 이용요금</span>
        </th>
        <tr>
            <td class="price_table4">대용량 파일 업로드<span class="price_span_style1">$4</span></td>
            <td class="price_table5 price_table6">-</td>
            <td class="price_table5 price_table6">준비 중 <span class="price_ask">문의하기</span></td>
            <td class="price_table5 price_table6">준비 중 <span class="price_ask">문의하기</span></td>
            <td class="price_table5">무제한</td>
        </tr>
        <tr>
            <td class="price_table4">콜라비 메신저 <span class="price_span_style1">$4</span></td>
            <td colspan="4" class="price_table5">*현재 무료로 이용 가능 <button class="price_messenger">콜라비 메신저로 이동<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path fill="rgb(217, 173, 43)" d="M12 4l-1.41 1.41L16.17 11H4v2h12.17l-5.58 5.59L12 20l8-8z" color="#D9AD2B"></path></svg></span></button></td>
        </tr>
        <tr>
            <th colspan="5">
            </th>
        </tr>
    </table>
    </div>
</div>
</section>

</div>
</body>
</html>
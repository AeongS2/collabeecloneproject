<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서보기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<style>
	.postedHeader{
		position:fixed; 
		z-index:113;
		justify-content:space-between;
	    top: 0px;
	    width: 100%;
	    height: 72px;
	    padding: 15px 24px 12px 16px;
	    background-color: rgb(255, 255, 255);
	    -webkit-box-pack: justify;
	    -webkit-box-align: center;
	    align-items: center;
	    border-bottom: 1px solid rgb(225, 225, 225);
	}
	.postedMore{
	    cursor:pointer;
	    background-color:transparent;
	    top:0;
	    width:24px; 
	    height:24px;
	    background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='rgb(136,136,136)' %3E%3Cpath d='M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z'%3E%3C/path%3E%3C/svg%3E");
	}
	.postedDel{
	    box-shadow:0 0 8px 2px rgb(0 0 0 / 10%);
	    font-size:13px;
	    border:1px solid #e1e1e1;
	    border-radius:4px;
	    position:absolute;
	    background-color:rgb(255,255,255);
	    width: 190px;
	    padding:15px 20px;
	    transform: translate3d(-20px, 45px, 0px);
	    cursor:pointer;
	    z-index:100;
	}
	.postedDel:hover{
		background-color:#f2f2f2;
	}
	.historyBack{
		width: 16px;
	    height: 16px;
	    font-size: 16px;
    	cursor: pointer;
    	margin:20px;
    	padding-right:10px;
	}
	.arrow {
	    position: relative;
	}
	
	.arrow::after {
	    position: absolute;
	    left: 0; 
	    top: 0; 
	    content: '';
	    width: 10px; /* 사이즈 */
	    height: 10px; /* 사이즈 */
	    border-top: 2px solid rgb(136,136,136); /* 선 두께 */
	    border-right: 2px solid rgb(136,136,136); /* 선 두께 */
	    transform: rotate(225deg); /* 각도 */
	}
	/*색 바꿔야함 제이쿼리로ㅓ*/
	.postedAlarm{
		width:20px;
		height:20px;
		/*색없는 알람*/background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20px' height='20px' viewBox='0 0 24 24'%3E%3Cpath fill='%23bdbab7' d='M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z'%3E%3C/path%3E%3C/svg%3E");
		/*있는 알람*/background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' %3E%3Cpath d='M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z' color='%23888888'%3E%3C/path%3E%3C/svg%3E");
		/*없는 북마크*/background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20px' height='20px' viewBox='0 0 24 24'%3E%3Cpath fill-rule='evenodd' fill='%23bdbab7' d='M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z'%3E%3C/path%3E%3C/svg%3E");
		/*잇는 북*/background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='20px' height='20px' viewBox='0 0 24 24'%3E%3Cpath fill='%23888888' fill-rule='evenodd' d='M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z'%3E%3C/path%3E%3C/svg%3E");
	}
	.icon1{
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill='%23bdbab7' d='M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z'%3E%3C/path%3E%3C/svg%3E");
		width:20px;
		height:20px;
	}
	.icon2{
		width:20px;
		height:20px;
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24'%3E%3Cpath fill-rule='evenodd' fill='%23bdbab7' d='M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z'%3E%3C/path%3E%3C/svg%3E");
	}
	.icon1 path, .icon2 path{
		transition: fill 0.2s ease 0s;
    	fill: rgb(136, 136, 136);
	}
	.postedSection {
	    width: 1px;
	    background-color: rgb(225, 225, 225);
	    margin: 0px 12px;
	}   
	.display_inherit{
		display: inherit;
	}
	.postedTitle{
		font-size: 14px;
	    font-weight: bold;
	    line-height: 24px;
	    color: rgb(34, 34, 34);
	    text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow: hidden;
	    overflow-wrap: break-word;
	    margin-left: 2px;
	} 
	.postedSecondTitle{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    color: rgb(136, 136, 136);
	    font-size: 14px;
	    line-height: 24px;
	    padding-left: 2px;
	    text-align:center;
	}
	.postedBnt1{
		height: 24px;
	    font-size: 14px;
	    line-height: 1.71;
	    color: rgb(136, 136, 136);
	    background-color: transparent;
	    margin-left: -2px;
	    padding: 0px 3px;
	    border-radius: 4px;
	    display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    cursor:pointer;
	}
	.postedBnt1:hover, .postedBnt1:active{
		    background-color: rgb(247, 246, 245);
	}
	.postedImg{
		width: 18px;
	    height: 18px;
	    border-radius: 50%;
	    position: relative;
	    flex-shrink: 0;
	    line-height: 1;
	    overflow: hidden;
	    border: 0;
	    box-sizing: initial;
	    cursor: pointer;
	    background:transparent;
	    margin-top: 7px;
    	margin-right: 5px;
	}
	.posting_bnt {
	    color: rgb(255, 255, 255);
	    font-size: 12px;
	    font-weight: 500;
	    border-radius: 4px;
	    background-color:rgb(51, 132, 108);
	    /* border: 1px solid rgb(217, 173, 43);
	    background-color: rgb(217, 173, 43); 제이쿼리 rgb(51, 132, 108);*/
	    cursor: pointer;
	    width: 105px;
	    height: 28px;
	    border: 1px solid rgba(255, 255, 255, 0.2);
	    margin-right: 80px;
	    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
	}
	/* .posting_bnt:hover{
		background-color: rgb(179, 142, 34);
   		border-color: rgb(179, 142, 34);
	} 제이쿼리 rgb(51, 132, 108);*/
	.posting_icon{ 
		fill: rgb(255, 255, 255);
		width:13px;
		height:13px;
	}
	.icon_color{
	    fill:rgb(136,136,136);
	    cursor:pointer;
	}
	.postBnt2{
		 margin-top:3px; 
		 margin-left:4px;
		 cursor:pointer;
	}
</style>
<style>
	.picList{ /*누르면 열리는 협업공간 멤버 목록*/
        height:180px;
        width:240px;
        line-height: 2.3;
        cursor: pointer;
        transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
        position:fixed;
        top: 60px;
   	 	left: 195px;
        font-size:14px;
        color:rgb(34, 34, 34);
        border-radius:4px;
        padding:1px;
        z-index:115;
        overflow-y:auto;
        box-shadow:rgb(0 0 0 / 10%) 0px 0px 6px 2px;
	    border: 1px solid rgb(225, 225, 225);
		background-color: rgb(255, 255, 255);

     }
     .picList ul{
         list-style: none;
         padding-top: 12px;
         padding-left: 16px;
     }
     .picList li{
         margin-left:27px;
     }
     .picList li:hover{
     	background-color: rgba(242, 242, 242, 0.4);
     }
     .picture_sch{
         width: 20px;
         height:20px;
         border-radius:50%;
         background-color:rgb(255, 255, 255);
         content:"";
         background-size:cover;
         position:absolute;
         margin-top:5px;
     }
     .picture2_sch{ /*picture_sch보다 아래 있어야함*/
         position:unset; 
         margin: 0px 5px 0px 0px;
     }
	
	 ::-webkit-scrollbar {
        width:4px;
        height:4px;
     }
     ::-webkit-scrollbar-thumb {
		height: 20%;  /*스크롤바의 길이*/ 
        background: #e1e1e1; /* 스크롤바의 색상*/ 
        border-radius:2px;
     }
</style>


<body>
<div class="alert"><svg viewBox="0 0 24 24" width="24px" height="24px" class="closed"><path fill="rgb(255,255,255)" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>
<!-- 헤더  -->
<div class="row postedHeader">
	<div class="display_inherit">
		<a href="" class="historyBack arrow"></a>
		<div class="colum">
			<div class="row">
				<span class="postedTitle">jspf 홈페이지 상단 메뉴</span>
				<div class="postBnt2">
					<span id="postAlarm"><svg id="noAlarm" width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" d="M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z"></path></svg></span>
					<span id="postBookmark"><svg id="noBookmark" width="20px" height="20px" viewBox="0 0 24 24"><path fill-rule="evenodd" fill="#888888" d="M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z"></path></svg></span>
				</div>
			</div>
			<div class="row postedSecondTitle">
				<button id="postDate" class="postedBnt1">시작일 ~ 종료일</button><div id="startPost"></div><div id="endPost"></div>
				<div class="postedSection" style="height:16px;"></div>
				<button id="postedBnt1" class="postedBnt1"><span><img class="postedImg" src="https://down.collabee.co/userProfile/-1"/></span><span>담당자</span></button>
			</div>
		</div>
	</div>
	
	<div class="display_inherit">
		<button class="postedMore" title="문서삭제로 바꿈"></button>
		<div class="postedDel hidden">삭제</div>
		<div class="postedSection" style="height:32px;"></div>
		<div>
		<button class="posting_bnt" style="margin-right:0px;">
			<svg viewBox='0 0 24 24' width='13px' height='13px'><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon"></path></svg>
			<span style="color:rgb(255,255,255)">문서 작성</span>
		</button>
		</div>
	</div>
</div>

         <div class="picList hidden"><!-- 참석자 목록 -->
             <ul>
                <div class="row"><span><img class="postedImg picture_sch" src="https://down.collabee.co/userProfile/-1"/></span><li title="담당자 없음" style="width:100%;">담당자 없음</li></div>
                <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강지현</li></div>
                <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">이정민</li></div>
                <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">김유라</li></div>
                <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강태안</li></div>
             </ul>
         </div>
    

	<script>
	$(function(){
		var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
		
		$(".postBnt2 span").click(function() {
			var ws = $(".document_ws").text();
			if(ws=='프라이빗 공간') {
				fill = "rgb(217, 173, 43)";
			} else {
				fill = "rgb(51, 132, 108)"; 
			}
			var title = $(this).attr("id");
			var state = $(this).children().attr("id");

			if(title=="postAlarm"){
				if(state=="noAlarm"){//알람 킨거면
					$(this).html("<svg viewBox='0 0 24 24' width='20px' height='20px'><path fill='"+fill+"' d='M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z'></path></svg>");	
					var alert_message = $(".alert").html(x+"문서 알림이 켜졌습니다.");
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				} else {//알람 끈거면
					$(this).html("<svg id='noAlarm' width='20px' height='20px' viewBox='0 0 24 24'><path fill='#888888' d='M13.99 19.5c0 .28-.05.54-.15.78-.26.6-.79 1.04-1.44 1.18-.087.02-.173.031-.263.036L12 21.5c-1.06 0-1.919-.82-2.003-1.851L9.99 19.5h4zM4 4.26l1.27-1.27L21 19.22l-1.27 1.27-1.916-1.99H4v-1l2-2v-5c0-1.266.275-2.444.8-3.44L4 4.26zm4.004 5.996L8 10.5v5.828l-.173.172h8.062L8.297 8.615c-.171.492-.271 1.042-.293 1.641zM12 2c.781 0 1.42.593 1.493 1.355l.007.145v.68c2.776.66 4.402 3.1 4.496 6.05l.004.27v2.577l-2-2.063V10.5c0-2.208-1.06-3.822-2.77-4.323l-.193-.051-1.036-.247-.795.189-1.565-1.614c.195-.08.399-.15.609-.21l.25-.064V3.5c0-.781.593-1.42 1.355-1.493L12 2z'></path></svg>");
					var alert_message = $(".alert").html(x+"문서 알림이 꺼졌습니다. 알림을 끄더라도 나를 언급한 할일 등은 알림을 받게 됩니다.");
					alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
					var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				}
			} else if (title=="postBookmark"){
				if(state=="noBookmark"){//북마크 설정한거면
					$(this).html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='"+fill+"' fill-rule='evenodd' d='M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z'></path></svg>");	
					var alert_message = $(".alert").html(x+"북마크가 설정됐습니다.");
	    	 		
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				} else {//북마크 해제한거면
					$(this).html("<svg id='noBookmark' width='20px' height='20px' viewBox='0 0 24 24'><path fill-rule='evenodd' fill='#888888' d='M17 3c1.05 0 1.918.866 1.994 1.954l.006.157V22l-7-3.167L5 22l.01-16.889c0-1.108.81-2.024 1.841-2.105L7 3h10zm0 2H7c.014 0 .018.004.018.015l-.008.097L7.001 18.9 12 16.639l5 2.261V5.111c0-.06-.017-.092-.012-.105L17 5z'></path></svg>");
					var alert_message = $(".alert").html(x+"북마크가 해제됐습니다.");
					alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				//alert_message.fadeOut();
	         			}, 3000);
	     			});
					var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
				}
			}
			//안내창 x누르면 닫기
	   		$(".closed").click(function(){
	   			alert_message.fadeOut();
	   		});
		});
		
		//담당자 목록 열기
		$(document).click (function(e){
			if($(e.target).is("#postedBnt1 span, #postedBnt1 img")==false) {
				if($(".picList").has(e.target).length==0) {
					$(".picList").addClass("hidden");
				}
			} else {
				$(".picList").removeClass("hidden");
			}
		});
		
		//담당자 선택하면 값 바뀌기
		$(".picList ul div").click(function(){
			var picture = $(this).find(".picture_sch").css("background-image");
			var name = $(this).find("li").text();
			var email = $(this).find("li").attr("email");
			
			if(name=="담당자 없음"){
				$(".postedBnt1 span:nth-child(2)").text("담당자");
			} else {
				$(".postedBnt1 span:nth-child(2)").text(name).attr("email", email);
			}
			$(".postedBnt1").find(".postedImg").attr("src", picture);//따옴표 없애기
			
		});
		
		//삭제 열고닫기
	    $(document).on("click", function(e){
	        if($(e.target).is(".postedMore")) {
	          $(".postedDel").removeClass("hidden");
	        } else {
	          $(".postedDel").addClass("hidden");
	        } 
	    });
		
		//삭제 클릭
		$(".postedDel").click(function(){
		if(confirm("문서를 삭제하시겠습니까?")==true){
			var alert_message = $(".alert").html(x+"문서가 삭제되었습니다.");
          	alert_message.fadeIn(function(){
            	setTimeout(function(){
              	alert_message.fadeOut();
            }, 3000);
        });
        //글자수에 따라 높이 정하기
	        var height = alert_message.prop("scrollHeight");
	        alert_message.css("height", height);
        } else {
        	return;
      	}
		});

		
		/* $("#postDate").click(function(){
			alert("서비스 준비중 입니다.");
		}); */
	});
    </script>
  
	<%@ include file="../WEB-INF/include/include_postedDocument.jspf"%>
	<%@ include file="../WEB-INF/include/include_rightBar.jspf"%>

</body>
</html>
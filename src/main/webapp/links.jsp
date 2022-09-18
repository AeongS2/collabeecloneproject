<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ta.dto.*" %>
<%@ page import="com.ta.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	session.setAttribute("id",1);
	int loginId = (int)(session.getAttribute("id"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(function() {
            $("#fileBoxBtn").mouseenter(function() {
                $("#fileBoxList").css("display","block");
            });
            $("#fileBoxList").mouseleave(function() {
                $("#fileBoxList").css("display","none");
            });
            $("#close").click(function() {
                window.close();
            });
            $("#close").hover(function(){
                $("#close").find("img").css("fillter","brightness(0) saturate(100%) invert(56%) sepia(77%) saturate(393%) hue-rotate(8deg) brightness(105%) contrast(96%)");
            });
            $("#me").click(function(){          
                alert("내 링크");
            });
            $("#all").click(function(){
                alert("전체 링크");
            });
            $("#documentwrite").click(function(){
                alert("문서작성");
            });
            $("#documentwrite").hover(function(){
                $("#documentwrite").css("background-color","rgb(179,142,34)"); 
                $("#documentwrite").css("cursor","pointer");
            },function(){
                $("#documentwrite").css("background-color","rgb(217,173,43)");
            });
            // 할일 의사결정 파일함 hover
            $(".hoverRightTop").hover(function(){
                $(this).css("color","#dee0db");
            },function(){
                $(this).css("color","white");
            });
            $("#search").focusin(function(){
                $(".search_bar").width("268px");
                $("#search").width("233px");
                $("#documentwrite").css("display","none");
            });
            $("#search").focusout(function(){
                $(".search_bar").width("143px");
                $("#search").width("100px");
                $("#documentwrite").css("display","block");
            });
            $("#search").keyup(function(key){
                $(this).attr("value",$(this).val());
                if(key.keyCode==13){
                    alert($(this).val());
                }
            });
            $(".fileTypeAndFilter").hover(function(){
                $(this).css("filter","opacity(0.4) drop-shadow(0 0 0 white)"); 
            },function(){
                $(this).css("filter","opacity(0.6) drop-shadow(0 0 0 white)"); 
            });
            $("#me").hover(function(){
                $(this).css("color","white");
                $(this).css("cursor","pointer");
            },function(){
                $(this).css("color","rgb(190,194,183)");
            });
            $("#me").click(function(){
                location.href="/links/link.me.html";
            });
            $("#workspaceListBtn").click(function(){ 
                $("#workspace_list").children().css("display","block");
                $("#workspaceListBtn").html("공간 검색").css("color", "rgb(255, 255, 255)");
            });
            $(".li").click(function(){
                var workspace = $(this).text();
                $("#workspaceListBtn").html(workspace);
                $("#workspace_list").children().css("display","none");
                alert($(this).attr("workspace_id"));
            });
            $(".li").hover(function (){
                $(this).css("background-color", "rgb(242,242,242)");
                $(this).css("cursor","pointer");
            }, function(){
                $(this).css("background-color", "rgb(255, 255, 255)");
            });
        });
        
    </script>
     <style>
		.fileTypeAndFilter {
            float: right;
            width: 20px;
        }
        body{
            margin: 0px;
            padding: 0px;
         }
         * {
            font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
         }
        #rooptop {
            position:fixed;
            z-index: 1;
        }
        #top {
            width:1720px;
            height:122px;
            background-image: url('image/linkBI.png');
            margin-left: 1px;
         }
        #top2 {
            position: absolute;
            content: "";
            display: block;
            width: 1720px;
            height: 122px;
            background-color: rgba(0, 0, 0, 0.6);
            z-index:0;
        } 
        #bottom {
            margin-top: 122px;
        }
        #leftTop {
            position: relative;
            padding-left: 40px;
            flex-direction: column;
            -webkit-box-pack: justify;
            justify-content: space-between;
            width:1423px;
            height: 121px;
            margin-right:0px;      
        }
        #rightTop {
            width:240px;
            height:101px;
            margin-left:0px;
            margin-top:25px;
            font-size: 12px;
            color:white;  
            position: relative; 
            float:right;  
            padding: 0px;  
        }
        
        #leftBottom {
            float: left;
            width: 1470px;
            height:840px;
            padding: 7px 0 0 0;
            overflow: auto;
           
        }
        #leftBottom::-webkit-scrollbar {
            width: 4px;
        }
        #leftBottom::-webkit-scrollbar-track {
            background-color: white;
            border-radius: 5px;
        }
        #leftBottom::-webkit-scrollbar-thumb {
            background-color: rgb(225,225,225);
            border-radius: 5px;
        }

        #rightBottom {
            float: right;
            width:180px;
            height:100%;
            margin-top: 33px;
            margin-left: 1500px;
            position: fixed;
           
        }
        .fileicon {
            float: right;
            width: 21px;
            height: 21px;
        }
        option {
            background-color: aliceblue;
            color: black;
        }
        select {
            border: 0px; 
            background-color: rgb(22,74,102);
            margin-top: 24px;
            margin-bottom: 12px;
            color:white;
            
        }
        .search_bar{
            float: right;
            border: 1px solid rgba(255, 255, 255, 0.6);
            border-radius: 4px;
            width:143px;
            height:27px;
            margin-top: 18px;

        }
        #search {
            width:100px;
            height: 27px;
            background-color: rgba(255, 255, 255, 0);
            font-size: 13px;
            border: 0px ; 
            color: white;
            vertical-align: top;
        }
        #search_img {
            margin-top: 5px;
            margin-left: 7px;
            width: 17px;
            top: 10px;
            right: 12px;
        }
        #documentwrite {
            float: right; 
            background-color: rgb(217,173,43);
            text-align: center;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 500;
            line-height: 1.5;
            border: 1px solid rgba(255, 255, 255, 0.2);
            padding: 0px;
            width: 105px;
            height: 28px;
            margin-top: 18px;
            margin-left: 20px;

        }
        .extension {
            font-size:14px;
            margin-top: 0;
            padding: 0;
        }
        .recentlyLinks {
            font-size: 14px;
            color: rgb(136,136,136)
        }
        #left {
            float: left;
            width: 200px;
            height: 969px;
            background-color: #232323;
            border: none;
            position:absolute;
            display:block;
        }
        #right {
            float: left;
            margin-left: 200px;
            height: 100px; 
        }
        #fileBoxBtn {
            float: left; 
            margin-left:20px;
            cursor: pointer;
        
        }
        #fileBoxList {
            display : none; 
            border: 1px solid white; 
            width:150px; 
            height: 75px; 
            margin-top: 3px;
            border-radius: 5px; 
            margin-left: 60px; 
            background-color: white;
            color: black;
            cursor: pointer;
           
        }
        img {
            filter: opacity(0.6) drop-shadow(0 0 0 white);
        }  
        #close{
            background-color: #232323;
            z-index: 1;
        }
        /* #me #all {
            cursor: pointer;
        } */
        .file_img_red {
                    filter: brightness(0) saturate(100%) invert(13%) sepia(62%) saturate(6719%) hue-rotate(359deg) brightness(75%) contrast(115%);
        } /* 파일 이미지들 색바꾸기 */
        #workspaceListBtn {
	    	margin-top : 24px;
			white-space: nowrap;
			text-overflow: ellipsis;
			overflow: hidden;
			background-color: rgba(255, 255, 255, 0);
			color: white;
			font-weight: bold;
			border:none;
	    }
	    #workspaceDownSvg {
	        filter: brightness(0) saturate(100%) invert(100%) sepia(100%) saturate(0%) hue-rotate(241deg) brightness(103%) contrast(103%);
	    }
	    #workspace_list {
	    	display:flex;
			justify-content: right;
			position: absolute;
			margin-top:-10px;
			margin-left: 240px;
			z-index: 1;
	    }
	    #workspace_list ul{ 
	        position: absolute;
	        list-style: none;
	        background-color: rgb(255, 255, 255);
	        border-radius: 4px;
	        width: 160px;
	        height: 205px;
	        border:1px solid #e1e1e1;
	        font-size: 14px;
	        font-weight: 500;
	        color:rgb(34, 34, 34);
	        padding:5px 12px;
	        line-height: 2.5;
	        display:none;
	        overflow: auto;
	    }
	    #workspace_list ul::-webkit-scrollbar {
            width: 4px;
        }
        #workspace_list ul::-webkit-scrollbar-track {
            background-color: white;
            border-radius: 5px;
        }
       	#workspace_list ul::-webkit-scrollbar-thumb {
            background-color: rgb(225,225,225);
            border-radius: 5px;
        }
	    #workspace_list ul li:nth-child(1){
	        color:rgb(136, 136, 136); 
	        font-size: 10.5px; 
	        pointer-events: none;
	    }
	    #workspace_list li{
	    	padding:2px;
	        display:flex;
	        flex-direction: row;
	        align-items: center;
	        border-radius:5px;
	    }
	</style>
</head>
<body>
	<div id="left">
        <button id="close" style="border: 0px; width:40px; height:40px; margin-left: 18px; margin-top: 18px; padding:0px; z-index:1; position: fixed;">
            <img src="image/x.svg" style="width:35px; height:35px; margin:0px; padding: 0px; "/>
        </button>
    </div>
    <div id="right"> 
        <div id="rooptop">
            <div id="top2"></div>
            <div id="top" >
                <div style="float:left;" id="leftTop" >
                	<%
                    	FileDao fDao = new FileDao();
                    	ArrayList<WorkspaceListDto> wDto = fDao.getFileWorkspaceList(loginId);
                    %>
                    <p style="float: left; margin-top: 20px; margin-bottom: 3px; color:white; font-size: 22px; margin-right: 8px;  font-weight: 900;" >파일 </p>
                    <button id="workspaceListBtn">모든 공간</button>
					<svg id="workspaceDownSvg" viewBox="0 0 24 24" width="16px" height="16px" class="svg1"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="Beecon__Path-sc-3x6pq4-1 jRUwgg"></path></svg>
                    <div id="workspace_list">
                		<ul>
                    		<li class="li">공간 검색</li>
                    		<li class="li" workspace_id="0">모든 공간</li>
                    <%
                    	for(WorkspaceListDto workspaceList : wDto){
                    %>
                    		<li class="li" workspace_id="<%=workspaceList.getWorkspaceId()%>"><span><%=workspaceList.getWorkspaceName()%></span></li>
					<%
                    	}
					%>
		                </ul>
           			</div>
                    <button id="documentwrite">
                        <img style="width:13px; height: 13px; margin-top: 3px;" src="image/pen.svg"/>
                        <span style="color:white; vertical-align:top;">문서 작성</span>
                    </button>
                    <div class="search_bar">
                        <img src="image/magnifier.svg" id="search_img"/>
                        <input id="search" type="search" placeholder="검색"/>
                    </div>
                    <p style="clear:both; margin-top:0px; font-size: 12px; color: white; margin-bottom: 18px;"><b>업로드한 링크를 관리할 수 있습니다.</b></p>
                    <span id="me" style="margin-right: 26px; font-size: 12px; color: rgb(190,194,183);">내 링크</span>
                    <span id="all" style="font-size: 12px; color: white;">전체 링크</span>
                    <span id="pilter"><img class="fileTypeAndFilter" style="margin-left:17px;" src="image/filter.svg " class="fileicon"/></span>
                </div>
                    <div id="rightTop">
                        <!--할일 + 의사결정 a태그 주소값-->
                        <div id="do" style="float: left; margin-left: 34px;"><a class="hoverRightTop" href="https://www.collabee.co/home/files/0/all/grid" style="text-decoration:none; color:white;">할 일</a></div>
                        <div id="decision_making" style="float: left; margin-left:26px; "><a class="hoverRightTop" href="https://www.collabee.co/home/files/0/all/grid" style="text-decoration:none; color:white;">의사결정</a></div>
                        <div class="hoverRightTop" id = "fileBoxBtn" style="margin-left: 26px;">파일함 <img src="image/down.svg" style="width:12px; height:12px;; vertical-align: center;"/></div><br/>
                        <div id = "fileBoxList">
                            <div style="margin: 17px 0px 0px 10px;"><a href="files.jsp" style="text-decoration:none; color: black;"><img src="image/file.svg" style="width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</a></div>
                            <div style="margin: 10px 0px 0px 10px;"><img src="image/link.svg" style="width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</div>
                        </div>
                    </div>
                </div>
        </div>
        <div id="bottom">
            <div id="leftBottom">
                <div style="padding: 16 16 16 16; width:1300px; height: 100%;  margin-top:15px; margin-left: 35px;">
                    <div style="border-bottom: 1px solid rgb(225,225,225); padding-bottom: 14px; width: 1400px; height: 100px; margin-bottom: 14px;">
                        <div style="float:left; border: 1px solid rgb(225,225,225); border-radius:3px; width:130px; height:100px; margin-right: 15px; margin-left: 15px;">
                            <img src="image/comment.svg" style="width:140px; height:100px;"/>
                        </div>
                        <div style="float: right; margin-right: 10px;">
                            <img src="image/bell.svg" style="width:20px;"/>
                        </div>
                        <div>
                            <h4 style="margin-bottom: 5px; margin-top: 0px;">asdasd</h4>
                            <p style="margin-top: 5px; margin-bottom: 0px; font-size: 12px; color:gray;">asdasdasd</p>
                            <div style="margin-top: 0px; margin-bottom:20px; font-size: 12px;">
                                <a style="color: blue;">asdasd</a>
                            </div>
                            <span style="font-size: 12px; ">코드공유 공간</span>
                            <span style="font-size: 12px;">/ CSS 속성 예시보기</span>
                        </div>
                    </div>
                   
                </div>
            </div>
            <div id="rightBottom">
                <div class="recentlyLinks">최근 올린 링크</div>
                <li></li>
                <li></li>
                <li></li>
            </div>
        </div>
    </div>
</body>
</html>
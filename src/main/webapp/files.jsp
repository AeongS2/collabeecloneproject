<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ta.dto.*" %>
<%@ page import="com.ta.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	session.setAttribute("id",2);
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
            $("#FileBoxBtn").mouseenter(function() {
                $("#FileBoxList").css("display","block");
            });
            $("#FileBoxList").mouseleave(function() {
                $("#FileBoxList").css("display","none");
            });
            $("#close").on("click",function() {
                window.close();
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
            $(".hoverRightTop").hover(function(){
                $(this).css("color","#dee0db");
            },function(){
                $(this).css("color","white");
            });
            $("#search").focusin(function(){
                $(".search_bar").width("268px");
                $("#search").width("233px");
                $("#documentwrite").css("display","none");
                $(this).css("outline","none");
            });
            $("#search").focusout(function(){
                $(".search_bar").width("143px");
                $("#search").width("100px");
                $("#documentwrite").css("display","block");
            });
            $("#search").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search =  $(this).val();
                $(".fileName").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).parent().css("display","block");                		
                	} else {
						$(item).parent().css("display","none");
                	}
                });
            });
           
            $(".fileTypeAndFilter").hover(function(){
                $(this).css("filter","opacity(0.4) drop-shadow(0 0 0 white)"); 
            },function(){
                $(this).css("filter","opacity(0.6) drop-shadow(0 0 0 white)"); 
            });
            $(".file_information").hover(function(){  
                $(this).css("box-shadow","5px 5px 5px gray"); 
            }, function(){
                $(this).css("box-shadow","none"); 
            });
            
            if($("#me").css("color")!="white"){
	            $("#me").hover(function(){
	                $(this).css("color","white");
	                $(this).css("cursor","pointer");
	            },function(){
	                $(this).css("color","rgb(190,194,183)");
	            });
            }
            if($("#me").css("color")!="white"){
	            $("#all").hover(function(){
	                $(this).css("color","white");
	                $(this).css("cursor","pointer");
	            },function(){
	                $(this).css("color","rgb(190,194,183)");
	            });
            }
            
            $("#me").click(function(){
            	$(this).css("color","white");
            	$("#all").css("color","rgb(190, 194, 183)");
            });
            $("#all").click(function(){
            	$(this).css("color","white");
            	$("#me").css("color","rgb(190, 194, 183)");
            });
            $("#workspaceListBtn").click(function(){ 
                $("#workspace_list").children().css("display","block");
                $("#workspaceListBtn").html("공간 검색").css("color", "rgb(255, 255, 255)");
            });
            $(".li").click(function(){
                var workspace = $(this).text();
                $("#workspaceListBtn").html(workspace);
                $("#workspace_list").children().css("display","none");
                var workspace_id = $(this).attr("workspace_id");
                $("#workspaceListBtn").attr("workspace_id",workspace_id);
                $("#files").html("");
                $("#recentlyImg").html("");
                $("#recentlyFile").html("");
                $.ajax({
                	type: 'get',
                	url: 'FileSelectWorkspaceServlet',
                	data: {"workspace_id": workspace_id, "login_id" : <%=loginId%>},
                	datatype: "json",
                	success : function(data){
                		console.log(data);
                		$.each(data, function(index, item){
                			if(index==0){
                				console.log(item);
                				$.each(item, function(index, item2){
                					var file = "";
                					if(item2.picture=="img"){
	                					file =
                						"<div class='file'>" +
	                                    	"<div class='file_information' file_id='"+item2.file_id+"' style='background-image:url(image/"+item2.file_name+");'></div>" +
	                                    	"<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
	                                    	"<span class='fileA'>"+item2.workspace_name +"</span>" +
	                                	"</div>";
                					} else {
                						console.log(item2.file_name);
                						file =
                						"<div class='file'>" +
                	                        "<div class='file_information' file_id='"+item2.file_id+"'>" +
                	                            "<img class ='file_img "+item2.picture+"' src='image/file.svg' /><br/>" + 
                	                            "<span class='extension'>"+item2.picture+"</span>" +
                	                        "</div>" +
                	                        "<span class='fileA fileName'>"+item2.file_name+"</span><br/>" +
                	                        "<span class='fileA'>"+item2.workspace_name+"</span>" +
                	                    "</div>";	
                					}	
                					$("#files").append(file);
                				});
                			} else if(index==1){
                				var recentlyImg = "";
                				if(item==""){
                					recentlyImg =
										"<p style='font-size:12px; margin-left:5px;'>최근 올린 이미지가 없습니다.</p>";
                					$("#recentlyImg").append(recentlyImg);
                				} else {
									$.each(item, function(index, item3){
										recentlyImg = 
											"<li file_id='"+item3.file_id+"' style='font-size:14px; margin: 5px 0px 0px 0px;'>"+item3.file_name+"</li>";
										$("#recentlyImg").append(recentlyImg);
	                				});
                				}
                			} else if(index==2){
                				var recentlyFile = "";
                				if(item==""){
                					recentlyFile =
										"<p style='font-size:12px; margin-left:5px;'>최근 올린 이미지가 없습니다.</p>";
                					$("#recentlyFile").append(recentlyFile);
                				} else {
                					console.log(item);
	                				$.each(item, function(index, item4){
										recentlyFile =										
											"<li file_id='"+item4.file_id+"' style='font-size:14px; margin: 5px 0px 0px 0px;'>"+item4.file_name+"</li>";
										$("#recentlyFile").append(recentlyFile);
	                				});
                				}
                			}
                		});
                	},
                	error : function(r,s,e){
                		
                	}
                });
            });
            $(".li").hover(function (){
                $(this).css("background-color", "rgb(242,242,242)");
                $(this).css("cursor","pointer");
            }, function(){
                $(this).css("background-color", "rgb(255, 255, 255)");
            });
            $(".file_information").click(function(){
            	$(this).attr("file_id");
            });
        });
        
    </script>
     <style>
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
            background-image: url('image/fileTop.png');
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
            height:121px;
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
            padding: 0px;
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
            background-color: #5c664c;
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
            border: none;
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
        .file {
            width:136px;
            height:176px;
            float:left;
            margin-left: 8px;
            text-align: left;
            margin-top: 5px;
        }
        .file_information {
            border: 1px solid rgb(220,220,220);
            width: 133px;
            height: 100px;
            text-align: center;
            background-color: #fafafa;
            border-radius: 2px;
            margin-bottom: 4px;
        }
        .file_img {
            width:29px;
            height:29px;
            margin-top: 25px;
            margin-bottom: 0;
        }
        .extension {
            font-size:14px;
            margin-top: -5px;
            padding: 0;
            display: block;
        }
        .fileA {
            font-size: 12px;
        }
        .recentlyFiles {
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
        #FileBoxBtn {
            float: left; 
            margin-left:20px;
            cursor: pointer;
        
        }
        #FileBoxList {
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
        .fileTypeAndFilter {
            float: right;
            width: 20px;
        }
        img {
            filter: opacity(0.6) drop-shadow(0 0 0 white);
        }  
        #close{
            background-color: #232323;
        }
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
	    #files {
	    	padding: 16 16 16 16; width:1300px; height: 98%;  margin-top:15px; margin-left: 32px;
	    }
	    .pptx {
        	filter: brightness(0) saturate(100%) invert(27%) sepia(86%) saturate(1088%) hue-rotate(346deg) brightness(106%) contrast(105%); 
        } 
        .xlsx {
        	filter: brightness(0) saturate(100%) invert(30%) sepia(14%) saturate(1966%) hue-rotate(77deg) brightness(98%) contrast(86%);
        }
        .zip {
        	filter: brightness(0) saturate(100%) invert(21%) sepia(57%) saturate(867%) hue-rotate(238deg) brightness(91%) contrast(92%);
        }
        .docx {
        	filter: brightness(0) saturate(100%) invert(31%) sepia(7%) saturate(3352%) hue-rotate(160deg) brightness(94%) contrast(92%);
        }
        .pdf {
        	filter: brightness(0) saturate(100%) invert(10%) sepia(88%) saturate(5623%) hue-rotate(343deg) brightness(71%) contrast(114%);
        }
        .etc {
        	filter: brightness(0) saturate(100%) invert(62%) sepia(3%) saturate(12%) hue-rotate(47deg) brightness(85%) contrast(91%);
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
                        <input id="search" type="search" value="" placeholder="검색"/>
                    </div>
                    <p style=" clear:both; margin-top:0px; font-size: 12px; color: white; margin-bottom: 18px;"><b>어디서든 Drag&Drop으로 파일을 업로드할 수 있습니다.</b></p>
                    <span id="me" style="margin-right: 26px; font-size: 12px; color: rgb(190,194,183);">내 파일</span>
                    <span id="all" style="font-size: 12px; color: white;">전체 파일</span>
                    <span><img class="fileTypeAndFilter" style="margin-left:14px; margin-top: 2px;" src="image/filter.svg " class="fileicon"/></span>
                    <span><img class="fileTypeAndFilter" src="image/list,gird.svg" style="margin-top: 2px;" class="fileicon"/></span>
              	</div>
                    <div id="rightTop">
                        <div id="do" style="float: left; margin-left:34px;"><a class="hoverRightTop" href="" style="text-decoration:none; color:white;">할 일</a></div>
                        <div id="decision_making" style="float: left; margin-left:26px; "><a  class="hoverRightTop" href="" style="text-decoration:none; color:white;">의사결정</a></div>
                        <div id = "FileBoxBtn" class="hoverRightTop" style="margin-left: 26px;">파일함 <img src="image/down.svg" style="width:12px; height:12px;; vertical-align: center;"/></div><br/>
                        <div id = "FileBoxList">
                            <div style="margin: 17px 0px 0px 10px;"><img src="image/file.svg" style="width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>파일</div>
                            <div style="margin: 10px 0px 0px 10px;"><a href="links.jsp" style="text-decoration:none; color:black;"><img src="image/link.svg" style="width: 15px; height:15px; margin-right: 8px;  vertical-align: bottom;"/>링크</a></div>
                        </div>
                    </div>
                </div>
        </div>
        <div id="bottom">
            <div id="leftBottom">
                <div id="files">
                    <%
                    	ArrayList<FileDto> allWorkspaceTotalFileArr = fDao.getAllWorkspaceTotalFile(loginId);
                    	for(FileDto allWorkspaceTotalFile : allWorkspaceTotalFileArr) {
                    		if(allWorkspaceTotalFile.getPicture().equals("img")){
                    %>			
                    <div class="file">
                        <div class="file_information" file_id="<%=allWorkspaceTotalFile.getFile_id() %>" style="background-image:url(image/file.svg);"></div>
                        <span class="fileA fileName"><%=allWorkspaceTotalFile.getFile_name() %></span><br/>
                        <span class="fileA"><%=allWorkspaceTotalFile.getWorkspace_name() %></span>
                    </div>
                    <% 			
                    		} else {
                    %>
                    <div class="file">
                        <div class="file_information"  file_id="<%=allWorkspaceTotalFile.getFile_id() %>">
                            <img class ="file_img <%=allWorkspaceTotalFile.getPicture()%>" src="image/file.svg" /><br/> 
                            <span class="extension"><%=allWorkspaceTotalFile.getPicture()%></span>
                        </div>
                        <span class="fileA fileName"><%=allWorkspaceTotalFile.getFile_name() %></span><br/>
                        <span class="fileA"><%=allWorkspaceTotalFile.getWorkspace_name() %></span>
                    </div>	
                    <%		
                    		}
                    	}	
                    %>
                </div>
            </div>
            <div id="rightBottom">
                <div class="recentlyFiles">최근 올린 이미지</div>
                <div id="recentlyImg">
                <%
                	ArrayList<RecentlyImgOrFileDto> allWorkspaceRecentlyImgArr = fDao.getAllWorkspaceRecentlyImg(loginId);
          			if(allWorkspaceRecentlyImgArr.size()==0){
          		%>	
          			<p style="font-size:12px; margin-left:5px;">최근 올린 이미지가 없습니다.</p>
          		<%		
          			} else {
	                	for(RecentlyImgOrFileDto allWorkspaceRecentlyImg : allWorkspaceRecentlyImgArr){
                %>
               		<li file_id="<%=allWorkspaceRecentlyImg.getFile_id()%>" style="font-size:14px; margin: 5px 0px 0px 0px;"><%=allWorkspaceRecentlyImg.getFile_name()%></li>
                <%			
 		               	}
          			}
                %>
                </div>		
                <div class="recentlyFiles">최근 올린 파일</div>
                <div id="recentlyFile">
                <%
                	ArrayList<RecentlyImgOrFileDto> allWorkspaceRecentlyFileArr = fDao.getAllWorkspaceRecentlyFile(loginId);
          			if(allWorkspaceRecentlyFileArr.size()==0){
          		%>	
          			<p style="font-size:12px; margin-left:5px;">최근 올린 파일이 없습니다.</p>
          		<%		
          			} else {
	                	for(RecentlyImgOrFileDto allWorkspaceRecentlyFile :allWorkspaceRecentlyFileArr){
                %>
               		<li file_id="<%=allWorkspaceRecentlyFile.getFile_id()%>" style="font-size:14px; margin: 5px 0px 0px 0px;"><%=allWorkspaceRecentlyFile.getFile_name()%></li>
                <%			
 		               	}
          			}
                %>	
                </div>
            </div>
        </div>
    </div>
</body>
</html>
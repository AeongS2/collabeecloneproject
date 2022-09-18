<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.ta.dto.*" %>
<%@ page import="com.ta.dao.*" %>
<%@ page import="java.util.ArrayList" %>
<%
	session.setAttribute("id",3);
	int loginId = (int)(session.getAttribute("id"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	 <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
    	// 웹소켓 ajax 하고
       	var webSocket = new WebSocket("ws://localhost:9090/Collabee/broadcasting");
       	webSocket.onmessage = function(e) {
       		alert("메시지가 도착함! : " + e.data);
   			$("#chatting_middle").append("<p class='chat'>"+e.data+"</p>");
   			//<div class="message">
            //   <div>
            //       <img class="messageProfile" src="image/bell.svg"/>
            //   </div>
            //   <div>
            //       <div><span>이름</span><span> 시간</span></div>
            //       <div>내용</div>
            //   </div>
            //</div>
   		}
   		webSocket.onopen = function(e) {
   			//$("").append("<p class='chat'>채팅에 참여하였습니다</p>");
   			alert("접속성공!");
   		}
   		webSocket.onerror = function(e) {
   			alert(e.data);
   		}
         $(function(){
    		$("#btn_send").click(function() {
				//var my_id = $("#id_chat").val();
				//var msg = $("#input_message").val();
				//webSocket.send(my_id + "|" + msg);
				webSocket.send('test');
				alert('sent!');
				//$("#div_message").append("<p class='chat'>나 : " + msg + "</p>");
			}); 
			$(".chatting_room_name").hover(function(e){
            	$(this).css("background-color","rgb(46,44,39)") // 여기도 문제
            	e.preventDefault();
                e.stopPropagation();
            },function(e){
            	$(this).css("background-color","#393731") // 여기서 해결
            	e.preventDefault();
                e.stopPropagation();
            });
            $(".chatting_room_name").click(function(e){
            	$("#chatting_middle").html("");
            	$("#messengerFiles").css("display","none");
            	$("#messengerLinks").css("display","none");
            	$("#inviteChattingRoom").css("display","none");
            	$("#chattingRoomInformation").css("display","none");
            	$("#chattingOnOff").css("display","block");
                e.preventDefault();
                e.stopPropagation();
                if($("#chattingOnOff").css("display")=="block"){
                    $(this).css("background-color","rgb(110,101,84)")
                }
               /*  $(".chatting_room_name").hover(function(){
                      $(this).css("background-color","rgb(46,44,39)");
                  },function(){
                      if($("#chattingOnOff").css("display")=="none"){
                          $(this).css("background-color","#393731");
                      } else {
                          $(this).css("background-color","rgb(110,101,84)");
                     }
                }); */
	           	var chatting_room_id = $(this).attr("chatting_room_id");
	       		$.ajax({
	       			type: 'get',
	       			url: 'ChattingMessageServlet',
	       			data : {"loginId": <%=loginId%>, "chatting_room_id": chatting_room_id},
	       			datatype: "json",
	       			success: function(data) {
	       				$.each(data, function(index, item){
	       					if(index==0)
	       						$.each(item, function(index, item){
									$("#chatting_room_name").attr("chatting_room_id",item.chatting_room_id);		       						
	       							$("#chatting_room_name").text(item.chatting_room_name);
	       						});
	       					else if(index>0){
	       						$.each(item, function(index, item){
	       							if(item.file_id==0 && item.link_id==0){
	       								var chattingContent =  
			       						"<div class='message' message_id="+item.message_id +">" +
			       			                "<div>" +
			       			                    "<img class='messageProfile' src="+item.picture+"/>" +
			       			                "</div>" +
			       			                "<div>" +
			       			                    "<div><span class='Cname'>"+item.name+"</span><span>"+item.send_time+"</span></div>" +
			       			                    "<div class='chattingMessage'>"+item.message+"</div>"+
			       			                "</div>"+
			       			            "</div>";
		       							$("#chatting_middle").append(chattingContent);	  
		       							// append 위쪽에서 -> ajax success 한부분 찾아가서 채워주기
	       							} else if(item.file_id > 0){
			       			             $.ajax({
				       			       		type: 'get',
				       			       		url: 'ChattingFileMessageServlet',
				       			       		data : {"fileId": item.file_id},
				       			       		datatype: "json",
				       			       		async: false,
				       			       		success: function(data) {
		       									var chattingFileContent =  
					       					"<div class='message' id="+item.message_id +">" +
					       			        	"<div>" +
					       			            	"<img class='messageProfile' src="+item.picture+"/>" +
					       			            "</div>" +
					       			            "<div>" +
					       			                "<div><span class='Cname'>"+item.name+"</span><span> "+item.send_time+"</span></div>" +
					       			             	"<div class='messageFile' file_id='"+item.file_id+"'>" +
				                     				"<img class='"+data.picture+"' src='image/file.svg'/>" +
					                     			"<span>"+data.file_name+"</span>" +
					                     			"</div>" +
					                     			"<div style='clear:both;''></div>" +
					                         	"</div>" +
					                     	"</div>"
				       							$("#chatting_middle").append(chattingFileContent);	
				       			       		}, 
					       			       	error: function(r,s,e){
					       		       			alert("파일실패");
					       		       		}
	       								}); 
	       							} else if(item.link_id>0) {
										$.ajax({
											type:'get',
											url : 'ChattingLinkMessageServlet',
											data : {"linkId": item.link_id},
											datatype: "json",
											async:false,
											success: function(data){
												var chattingLinkContent	=
											"<div class='message' id="+item.message_id+">" +
							                    "<div>" +
							                        "<img class='messageProfile' src="+item.picture+"/>" + // 경로 image/ 추가
							                    "</div>" +
							                    "<div style='width:350px;'>" +
							                    "<div><span class='Cname'>"+item.name+"</span><span> "+item.send_time+"</span></div>" +
							                        "<a target='_blank' class='chattingLinkA' href='"+data.link_name+"'>"+data.link_name+"</a>" +
							                        "<div class='messageLink' link_id='"+item.link_id+"'>" +
							                        	"<div class='linkImgBox' style='background-image:url(image/"+data.picture+");'></div>" +
							                        	"<div class='linkContent'>" +
								                			"<p>"+data.link_title+"</p>" +
															"<p>"+data.link_explanation+"</p>" +									                        	
							                        	"</div>" +
							                		"</div>" +
							                		"<div style='clear:both;'></div>" +
							                    "</div>" +
							                "</div>";
												$("#chatting_middle").append(chattingLinkContent);
											}, 
											error : function(r,s,e){
												alert("링크실패");
											}
										});	       		
									}
	       						});
	       					}
	       				});
	       			},
	       			error: function(r,s,e){
	       				alert("실패");
	       			}
	            });  
            });
            $("#xbutton").click(function(){
                $("#chattingOnOff").css("display","none");
                $("#messengerLinks").css("display","none");
                $("#messengerFiles").css("display","none");
                $("#chatting_middle").html("");
            });
            $(".xBtn").click(function(e){
                $(this).parent().parent().css("display","none");
                $("#chattingFiles").html("");
                e.preventDefault();
                e.stopPropagation();
            });
            $("#slide_chat_up").on("click", function(e){
                $("#right").slideToggle("fast");
                e.preventDefault();
            });
            $("#documentwrite").click(function(e){
            	$(".documentWriteClickAfterBanner").css("display","block");
            	$(this).parent().css("display","none");
            	$(this).parent().parent().find(".chatting_name").css("display","none")
            	$(".messageProfile").each(function(index,item) {
            		$(item).attr("origin",$(item).attr("src"));
            	});
            	$(".messageProfile").attr("src","image/check.svg");
            	$(".messageProfile").addClass("check");
                $(this).parent().parent().parent().find("#chatting_bottom").children("input").css("display","none");
                $("#fileUpload").css("display","none");
                $(this).parent().parent().parent().find("#documentWriteBtn").css("display","block");
                e.preventDefault();
                e.stopPropagation();
            });
            //$(".messageProfile").on("click",function(){
            $(document).on("click", ".messageProfile", function() {
            	if($(this).attr("class").includes("check")){
					if($(this).attr("class").includes("filter-active")) {
						$(this).removeClass("filter-active");
					}else {
						$(this).addClass("filter-active");
					}            		
            	}
            });
            $(".xbutton").click(function(){
            	$(".messageProfile").each(function(index,item) {
            		$(item).attr("src",$(item).attr("origin"));
            		$(item).css("filter","brightness(0) saturate(100%) invert(54%) sepia(0%) saturate(0%) hue-rotate(51deg) brightness(98%) contrast(97%)");
            	});
            	$(".messageProfile").removeClass("check");
            	$(".documentWriteClickAfterBanner").css("display","none");
            	$("#documentwrite").parent().css("display","block");
            	$(".chatting_name").css("display","block")
            	$("#chatting_bottom").children("input").css("display","block");
            	$("#documentWriteBtn").css("display","none");
            	$("#fileUpload").css("display","block");
            });
            $("#documentwrite").hover(function(){
                $(this).css("background-color","rgb(179,142,34)"); 
                $(this).css("cursor","pointer");
            },function(){
                $(this).css("background-color","rgb(217,173,43)");
            });
            // 채팅창에서 채팅창명 클릭시 나오는 방정보
            $("#chattingRoomInformationBtn").click(function(e){
            	$("#chattingparticipantsInformation").html("");
            	$("#chattingParticipantsInformation2").html("");
            	var chatting_room_id = $(this).children("#chatting_room_name").attr("chatting_room_id");
            	$.ajax({
			       		type: 'get',
			       		url: 'ChattingParticipantsServlet',
			       		data : {"chatting_room_id": chatting_room_id },
			       		datatype: "json",
			       		success: function(data) {
			       			$.each(data, function(index, item){
			       				if(index==0){
				       				$("#participants").find("span").text(item.countParticipants);			       					
			       				}
			       				if(index > 0){
			       					var participants =
			       						"<div>" +
                                        	"<img class='participantsImg' src='"+item.picture+"'>" +
                                        	"<span style='font-size: 10px; margin: 0px 0px 0px 3px;'>"+item.name+"</span>" +
                                    	"</div>";
                                    $("#chattingparticipantsInformation").append(participants);
                                    var participants2 = 
                                    	"<div class='participantBox'>" +
						    				"<img src='"+item.picture+"'/> " + item.name +
						    			"</div>" ;
						    		$("#chattingParticipantsInformation2").append(participants2);
			       				}
			       			});
			       		},
			       		error : function(r,s,e) {
			       			
			       		}
            		
            	});
                if($(this).parent().find("#chattingRoomInformation").css("display")=="none"){
                	$(this).parent().find("#chattingRoomInformation").css("display","block");
                } else {
                	$(this).parent().find("#chattingRoomInformation").css("display","none");
                }
                e.preventDefault();
                e.stopPropagation();
            });
            $("#alarmBtn").click(function(e){
                if($("#alarmSetting").css("display")=="none"){
                    $("#alarmSetting").css("display","block");
                } else {
                    $("#alarmSetting").css("display","none");
                }
                e.preventDefault();
                e.stopPropagation();
            });
            $("#alarmOn").click(function(e){
                $(this).css("color","rgb(217,173,43)");
                $(this).parent().children("#alarmOff").css("color","black");
                $(this).parent().parent().find("span").find("img").attr("src","image/bell.svg");
                $(this).parent().parent().find("#alarmText").text(" 모든 메세지 알림받기");
                $("#alarmSetting").css("display","none");
                e.preventDefault();
                e.stopPropagation();
            });
            $("#alarmOff").click(function(e){
                $(this).css("color","rgb(217,173,43)");
                $(this).parent().children("#alarmOn").css("color","black");
                $(this).parent().parent().find("span").find("img").attr("src","image/bellOff.png");
                $(this).parent().parent().find("#alarmText").text(" 끄기");
                $("#alarmSetting").css("display","none");
                e.preventDefault();
                e.stopPropagation();
            });
            $("#alarm").click(function(e){
                if($(".mainAlarm").css("display")=="none"){
                    $(".mainAlarm").css("display","block");
                } else {
                    $(".mainAlarm").css("display","none");
                }
                e.preventDefault();
                e.stopPropagation();
            });
            $(".notDistrubMode").click(function(e){
                $("#alarm").children().attr("src","image/zAlarm.svg"); 
                $(this).css("color","rgb(217,173,43)")
                $(".distrubMode").css("display","block");
                $(".mainAlarm").css("display","none");
                e.preventDefault();
                e.stopPropagation();
            });
            $(".distrubMode").click(function(e){
                $(".notDistrubMode").css("color","black");
                $("#alarm").children().attr("src","image/bell.svg"); 
                $(".distrubMode").css("display","none");
                $(".mainAlarm").css("display","none");
                e.preventDefault();
                e.stopPropagation();
            });
            $("#chattingFileBtn").click(function(e){
            	var chatting_room_id = $(this).parents().parents().parents().find("#chatting_room_name").attr("chatting_room_id");
            	$("#chattingFiles").html(""); 	
            	$.ajax({
            		type: 'get',
		       		url: 'ChattingFileServlet',
		       		data : {"chatting_room_id": chatting_room_id },
		       		datatype: "json",
		       		success: function(data) {
		       			$.each(data,function(index,item){
							var files =
								"<div class='chattingFile' file_id='"+item.file_id+"'>" +
			                		"<div style='float:left;'>" +
			                    		"<img src='image/file.svg' class='"+item.file_picture+"'/>" +
			                		"</div>" +
			                		"<div style='float:left;'>" +
			                    		"<p class='fileInformation'><b>"+item.file_name+"</b></p>" +
			                    		"<p class='fileInformation'><span>"+item.file_date+"</span><span> "+item.name+"</span></p>" +
			                		"</div>" +
			                		"<div style='float:right'>" +
			                    		"<img src='"+item.picture+"' style='width:20px; margin-top:3px; margin-right: 5px; border-radius: 35px; filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;'/>" +
			                		"</div>" +
			            		"</div>";
			            	$("#chattingFiles").append(files);
						});
		       		},
		       		error: function(r,s,e) {
		       			
		       		}
            	});
                $(this).parent().parent().parent().parent().parent().parent().find("#messengerFiles").animate({width:"toggle"},500);;
                e.preventDefault();
                e.stopPropagation();
            })
            $("#chattingLinkBtn").click(function(e){
            	var chatting_room_id = $(this).parents().parents().parents().find("#chatting_room_name").attr("chatting_room_id");
            	$("#chattingLinks").html("");  	
            	$.ajax({
            		type: 'get',
		       		url: 'ChattingLinkServlet',
		       		data : {"chatting_room_id": chatting_room_id },
		       		datatype: "json",
		       		success: function(data) {
		       			$.each(data,function(index,item){
							var links =
								"<div class='chattingLink' link_id='"+item.link_id+"'>" +
			                		"<div style='float:left;'>" +
			                    		"<img src='"+item.link_picture+"' style='width:30px'/>" +
			                		"</div>" +
			                		"<div style='float:left;'>" +
			                    		"<p class='fileInformation'><b>"+item.link_title+"</b></p>" +
			                    		"<p class='fileInformation'>"+item.link_explanation+"</p>" +
			                    		"<a target='_blank' class='fileInformation' style='text-decoration: none; display: block;' href='"+item.link_name+"' >"+item.link_name+"</a>" +
			                    		"<p class='fileInformation'><span>"+item.link_date+"</span><span> "+item.name+"</span></p>" +
			                		"</div>" +
			                		"<div style='float:right'>" +
			                    		"<img src='"+item.picture+"' style='width:20px; margin-top:3px; margin-right: 5px; border-radius: 35px; filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;'/>" +
			                		"</div>" +
			            		"</div>";
			            	$("#chattingLinks").append(links);
						});
		       		},
		       		error: function(r,s,e) {
		       			
		       		}
            	});
                $(this).parent().parent().parent().parent().parent().parent().find("#messengerLinks").animate({width:"toggle"},500);;
                e.preventDefault();
                e.stopPropagation();
            });
            $("#chattingSearch").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".chatting_room_name").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).css("display","block");                		
                	} else {
						$(item).css("display","none");
                	}
                });
            });
            $("#chattingFileSearch").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".chattingFile").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).css("display","block");                		
                	} else {
						$(item).css("display","none");
                	}
                });
            });
            $("#inviteSearchPartner").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".chattingInviteParterList").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).css("display","block");                		
                	} else {
						$(item).css("display","none");
                	}
                });
            });
            $("#chattingLinkSearch").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".chattingLink").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).css("display","block");                		
                	} else {
						$(item).css("display","none");
                	}
                });
            });
            $("#inviteSearchPartner").hover(function(e){
            	$(this).css("border","1px solid rgb(158,158,158)");
            	e.preventDefault();
            	e.stopPropagation();
            },function(e){
            	$(this).css("border","1px solid rgb(208,208,208)");
            	e.preventDefault();
            	e.stopPropagation();
            });
            $("#inviteSearchPartner").focus(function(){
            	$("#invitePartnerList").html("");
            	$.ajax({
            		type : 'get',
            		url : 'ChattingInvitePartnerListServlet',
            		data : {"loginId":<%=loginId%>},
            		datatype: "json",
            		success: function(data){
            			$.each(data, function(index, item){
            				var chattingInviteParterList = 
            					"<div class='chattingInviteParterList' member_id='"+item.member_id+"'>" +
		    						"<img src='"+item.picture+"'/> "+item.name+" <span>"+item.email+"</span>" +
		    					"</div>";
		    				$("#invitePartnerList").append(chattingInviteParterList);
            			});
            		},
            		error: function(r,s,e){
            			
            		}
            	});
            	$(this).parent().parent().find("#invitePartnerList").css("display","block");
            	$(this).css("outline","2px solid #dfba4c");
            });
            $(document).on("click",".chattingInviteParterList",function(){
				$(this).css("cursor","pointer");
				var member_id = $(this).attr("member_id");
				var nameEmail = $(this).text();
				$("#inviteSearchPartner").val(nameEmail);
				$("#inviteSearchPartner").attr("member_id",member_id);
				$("#invitePartnerList").css("display","none");
            });
 			$(".closeInviteBox").click(function(e){
            	$(this).parent().css("display","none");
            	e.preventDefault();
                e.stopPropagation();
            });
            $("#inviteBtn").click(function(){
            	var member_id = $("#inviteSearchPartner").attr("member_id");
            	var chatting_room_id = $(this).parent().parent().parent().parent().find("#chatting_room_name").attr("chatting_room_id");
            	if(member_id==null){
            		alert("초대할 대상을 선택해주세요");
            	} else {
            		$.ajax({
    					type : 'get',
    					url : 'ChattingInviteMemberServlet',
    					data : {"member_id" : member_id, "chatting_room_id" : chatting_room_id},
    					datatype : "json",
    					success: function(data) {
    						if(data.name==null){
    							alert("이미 채팅방에 있는 사람입니다.");
    						} else {
    							$("#countParticipantsMember").text(data.count);
    							var inviteMember = 	
    								"<div class ='participantBox'>" +
    									"<img src='"+data.picture+"'/> " + data.name +
    								"</div>";
    							var inviteMember2 =
    								"<div>" +
    									"<img class='participantsImg' src='"+data.picture+"'>" +
    									"<span style='font-size: 10px; margin: 0px 0px 0px 3px;'>"+data.name+"</span>" +
    								"</div>";
    							$("#chattingParticipantsInformation2").append(inviteMember);
    							$("#chattingparticipantsInformation").append(inviteMember2);
    						}
    					},
    					error: function(r,s,e){
    						
    					}
                	});
            	}
            });
            $("#inviteBtn").hover(function(){
            	$(this).css("background-color","rgb(179,142,34)")
            },function(){
            	$(this).css("background-color","rgb(217,173,43)")
            })
            $(".inviteChattingMemberBtn").click(function(e){
            	$(this).parent().parent().parent().find(".inviteChattingRoom").css("display","block");
            	e.preventDefault();
                e.stopPropagation();
            });
            $("#chattingFile").change(function(){
    			$("#loginIdInput").val(<%=loginId%>);
    			var chatting_room_id = $(this).parent().parent().parent().find("#chatting_room_name").attr("chatting_room_id");
    			$("#chattingRoomIdInput").val(chatting_room_id);
            	$("#fileUpload").submit();
    		});
        });
    </script>
    <style>
    	.chattingInviteParterList {
    		display:none;
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
        .img {
        	filter: brightness(0) saturate(100%) invert(42%) sepia(100%) saturate(809%) hue-rotate(360deg) brightness(105%) contrast(107%);
        }
    	.messageProfile {
    		border-radius:35px;
    	}
    	.Cname, .chattingMessage{
    		padding:0px 5px;
    	}
        body{
            margin:0px;
            padding: 0px;
        }
        #right {
            float:left;
            width:236px;
            height:400px;
            margin: 0px;
           	display:none;
        }
        #top {
            position:fixed;
            width:236px;
            background-color: #393731;
            margin: 0px;
        }
        #bottom {
            margin-top: 76px;
            float:left;
            width:236px;
            background-color: #393731;
            height:400px;
            overflow:auto;
        }
        #bottom::-webkit-scrollbar {
            width: 5px;
        }
        #bottom::-webkit-scrollbar-track {
            background-color: #393731;
            border-radius: 5px;
           
        }
        #bottom::-webkit-scrollbar-thumb {
            background-color: gray;
            border-radius: 5px;
        }
        #alarm {
            width: 20px;
            height: 20px;
            padding: 0px;
            margin: 0px 0px 0px 35px;
            border:none;
            background-color: #393731;
            float:right; 
            margin-right: 10px;
        }
        .title {
            color: gray;
            font-size: 12px;
            margin-bottom: 0px;
        }
        .chatting_title {
            margin-left: 8px;
            margin-bottom: 8px;
        }
        .chatting_room_name {
            margin:0px;
            padding: 2px 5px 2px 5px;
            color:white;
            cursor: pointer;
            border-radius: 5px;
            font-size:12px;
        }
        .chatting_partner {
            margin:0 0 0 0;
            padding: 0px;
            color:white;
            cursor: pointer;
            font-size:12px;
        }
        #chatting_top {
            position:fixed;
            width: 400px;
            height: 40px;
            border-bottom: 1px solid gray; 
            z-index: 1;
        }
        #chatting_middle {
            width: 400px;
            height: 470px;
            padding: 0;
            overflow:auto;
        }
        #chatting_middle::-webkit-scrollbar {
            width: 5px;
        }
        #chatting_middle::-webkit-scrollbar-track{
            background-color: white;
            border-radius: 5px;
        }
        #chatting_middle::-webkit-scrollbar-thumb{
            background-color: gray;
            border-radius: 5px;
        }
        #chatting_bottom {
            width:400px;
            height: 70px;
            position: fixed;
        }
        .chatting_name {
            float:left;
            margin-top: 3px;
        }
        #down_button {
            filter: brightness(0) saturate(100%) invert(0%) sepia(1%) saturate(5580%) hue-rotate(332deg) brightness(95%) contrast(92%);
        }
        #documentwrite {
            margin-top: 6px; 
            background-color: rgb(217,173,43);
            text-align: center;
            border-radius: 4px;
            border: 1px solid rgba(255, 255, 255, 0.2); 
            width: 75px;
            height: 25px;
        }
        .file_link_img {
            width:20px; 
            height: 20px; 
            vertical-align: bottom; 
            filter: brightness(0) saturate(100%) invert(54%) sepia(0%) saturate(0%) hue-rotate(51deg) brightness(98%) contrast(97%);
        }
        #chattingFileBtn {
            margin-right: -4px;
        }
        #chattingFileBtn #chattingLinkBtn {
            border-radius: 5px;
        }
        .message {
            margin-left: 2px;
            margin-top: 10px;
            font-size: 12px;
            clear: both;
            width:393px;
            height:40px; 
        }
        .documentWriteClickAfterBanner {
       		padding: 5px;
       		display:none;
       	}
       	.documentWriteClickAfterBanner > span {
       		font-size : 12px;
       	}
        #chattingRoomInformation{
            margin-left: 60px;
            height:120px;
            width:180px;
            border-radius: 5px;
            border: 1px solid gray;
            background-color: white;
            font-size: 12px;
            display: none;
        }
        #participants {
            overflow: auto;
            width:180px; 
            height:57px; 
            border-radius: 10px;
        }
        #participants::-webkit-scrollbar{
            width: 2px;
        }
        #participants::-webkit-scrollbar-thumb{
            border-radius: 2px;
            background-color: black;
        }
        #participants::-webkit-scrollbar-track{
            border-radius: 2px;
        }
        #alarmSetting {
            margin-left: 180px;
            margin-top:-30px;
            font-size:10px; 
            border-radius: 5px; 
            border: 1px solid gray; 
            width:130px; 
            background-color: white;
            display: none;
        }
        #alarmBtn {
            border: none; font-size:10px; margin:0px; padding:0px; border-radius: 5px; 
            background-color: white; height:30px;
        }
        #make_chatting_room {
            border: none; 
            background-color:#393731; 
            margin-left: 130px;
        }
        .mainAlarm {
            padding:5px 10px 5px 10px;
            width:190px; 
            height:auto; 
            border:1px solid gray; 
            border-radius:5px;
            display: none;
        }
        #chattingOnOff {
            border: 1px solid black; 
            width:400px; height:600px; 
            margin: 0px; padding: 0px; 
            border-radius: 4px;
            display: none;
        }
        #make_chatting_room > img {
       		width:18px; background-color: #393731; vertical-align: bottom;
       	}
       	#down_button {
       		width:18px; vertical-align: bottom;
       	}
       	.participantsImg {
       		width:15px; margin-left: 10px; border-radius: 35px; border:1px solid gray; vertical-align: top;
       	}
       	#participants > p {
       		margin-left: 10px; font-size: 10px; margin-bottom: 2px;
       	}
       	.closeInviteBox > img {
       		filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%);
       	} 
       	.xbutton > img {
       		filter: brightness(0) saturate(100%) invert(0%) sepia(50%) saturate(4692%) hue-rotate(129deg) brightness(99%) contrast(96%);
       	}
       	.xBtn {
       		width:20px; height:20px; padding: 0px; float: right; margin-right:15px; margin-top: 2px; border:none; background-color: white;
       	}
       	.xBtn > img {
       		filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;
       	}
       	#messagerFiles > input {
       		margin-left:20px; margin-top: 10px; width: 250px;
       	}
       	.chattingFile > div > img {
       		width:30px
       	}
        .mainAlarmBtn {
            width: 200px;
            margin-top: 5px;
            font-size: 12px;
            background-color: white;
            border: none;
            text-align: left;
        }
        #xbutton {
            width: 20px; 
            height:20px; 
            margin-left: 378px; 
            margin-top: 2px; 
            margin-bottom: 2px; 
            padding: 0px;
        }
        .xbutton {
        	float: right;
        	width: 20px; 
            height:20px; 
            margin-left: 375px; 
            margin-top: 2px; 
            margin-bottom: 2px; 
            padding: 0px;
            margin-top: -16px;
  			border: none;
    		background-color: white;
        }
        #chattingRoomInformationBtn {
            height:30px; text-align: center; border: none; background-color: white;
        }
        #chattingFiles {
            width:300px;
            height: 532px;
            border-radius: 5px; 
            margin-top: 5px;
            overflow: auto;
        }
        #chattingFiles::-webkit-scrollbar {
            width: 1px;
        }
        #chattingFiles::-webkit-scrollbar-thumb {
            border-radius: 5px;
            background-color: #393731;
        }
        #chattingFiles::-webkit-scrollbar-track {
            border-radius: 5px;
            background-color: white;
        }
        .chattingFile {
            width:270px;
            height: 45px;
            border-bottom: 1px solid rgb(142,142,142);
            padding: 10px 10px 0px 19px;
            margin-bottom: 1px;
        }
        .fileInformation {
            width: 205px;
            padding: 0px;
            margin: 0px;
            font-size: 11px;
            margin-left: 5px;
            height:15px;
            white-space: nowrap;
            overflow: hidden;   
            text-overflow: ellipsis;
            -webkit-line-clamp: 1;
        }
        #messengerFiles {
            float: left; 
            width:300px; 
            height:600px; 
            border:1px solid black; 
            border-radius:5px;
            display: none;
        }
        #messengerFiles > input {
        	margin-left: 20px;
    		width: 265px;
    		margin-top: 5px;
        }
        #messengerLinks {
            float: left; 
            width:300px; 
            height:600px; 
            border:1px solid black; 
            border-radius:5px;
            display: none;
        }
        #chattingLinks {
            width:300px;
            height: 532px;
            border-radius: 5px; 
            margin-top: 5px;
            overflow: auto;
        }
        #chattingLinks::-webkit-scrollbar {
            width: 1px;
        }
        #chattingLinks::-webkit-scrollbar-thumb {
            border-radius: 5px;
            background-color: #393731;
        }
        #chattingLinks::-webkit-scrollbar-track {
            border-radius: 5px;
            background-color: white;
        }
        .chattingLink {
            width:270px;
            height: 70px;
            border-bottom: 1px solid rgb(142,142,142);
            padding: 10px 10px 0px 19px;
            margin-bottom: 1px;
        }
        .chattingProfileImg {
            width:15px;
            vertical-align: bottom;
            border-radius: 35px;
        }
        .chattingMemberPicture {
            width:20px; 
            float: left; 
            border-radius: 35px; 
            height: 20px;
        }
        .onOffImg {        
            width:5px; float: right;
            border-radius: 35px;
            border: 1px solid gray;
            filter: brightness(0) saturate(100%) invert(92%) sepia(82%) saturate(4726%) hue-rotate(30deg) brightness(112%) contrast(97%);
            background-color: #96fc1f;
            display: block;
        }
        #alarmOn {
			width:130px; font-size: 10px; border: none; background-color:white; border-radius: 5px; margin-top: 5px; color:#d9ad2b
		}
		#alarmOn > img {
			width:15px;  vertical-align: top;
		}
		#alarmOff {
			width:130px; font-size: 10px; text-align: left; border: none; background-color:white; border-radius: 5px;
		}
		#alarmOff > img {
			width: 17px; margin-left: 3px; vertical-align: top; margin-top: -5px;
		}
		#alarmSetting > p {
			margin-top:5px; margin-left: 10px; margin-bottom: 0px;
		}
		#documentwrite > span {
			color:white; font-size: 12px;
		}
		.message > div {
			float:left;
		}
		.message > div > img {
			width:30px; height:30px; filter: brightness(0) saturate(100%) invert(54%) sepia(0%) saturate(0%) hue-rotate(51deg) brightness(98%) contrast(97%);
		}
		.chattingDateTime {
			text-align: center; font-size: 10px;
		}
		.chattingDateTime > span {
			border: 1px solid rgb(245,245,245); background-color:rgb(245,245,245); border-radius:10px; padding: 0px 5px 0px 5px;
		}
		#chatting_bottom > input {
			margin: -32px 16px 16px 27px ; width:360px; height:30px; font-size: 12px; border-radius: 5px;
		}
		.inviteChattingRoom{
	    	border: 1px solid black;
	    	width:400px;
	    	height:500px;
			margin-left: 180px;
			background-color: white;
			border-radius:5px;
			padding: 10px 15px;		
			overflow:auto;
			display:none;
    	}
    	.inviteChattingRoom::-webkit-scrollbar {
    		width:1px;
    	}
    	.inviteChattingRoom::-webkit-scrollbar-trace {
    		border-radius: 5px;
      		background-color: #white;
    	}
    	.inviteChattingRoom::-webkit-scrollbar-thumb {
    		border-radius: 5px;
      		background-color: #393731;
    	}
    	.inviteChattingRoom h2 {
    		margin-top:0px;
    	}
    	.inviteChattingRoom p {
    		color:gray;
    	}
    	#inviteSearchPartner {
    		width:300px; height:20px; border-radius:5px; border: 1px solid rgb(208,208,208);
    	}
    	#inviteBtn {
    		color:white; background-color:rgb(217,173,43); border-radius:5px; width:75px; height:27px; border:none; font-size: 12px; margin-left:5px;
    	}
    	#invitePartnerList {
    		width: 284px; height: 100px; border: 1px solid rgb(208,208,208); border-radius:5px; padding:0px 10px 10px 10px;
    		overflow: auto;
    		display:none;
    	}
    	#invitePartnerList > div > img {
    		border-radius: 35px;
    	}
    	#invitePartnerList::-webkit-scrollbar{
    		width: 1px
    	}
    	#invitePartnerList::-webkit-scrollbar-thumb{
    		border-radius: 5px;
      		background-color: #393731;
    	}
    	#invitePartnerList::-webkit-scrollbar-trace{
    		border-radius: 5px;
      		background-color: #white;
    	}
    	#invitePartnerList > div {
    		padding: 5px; border-radius:5px; width:260px; margin: 5px 10px 0px 0px;
    	}
    	#invitePartnerList > div > img {
    		width:10px; height:10px;
    	}
    	#invitePartnerList > div > span {
    		color:gray;
    	}
    	.participantBox {
    		float:left; padding: 5px; background-color:rgb(245,245,245); border-radius:5px; width:180px; margin: 10px 10px 0px 0px;
    	}
    	.participantBox > img {
    		width:10px; height:10px; border-radius: 35px;
    	}
    	.closeInviteBox {
    		width: 20px; 
            height:20px; 
            margin-left: 378px; 
            margin-top: 2px; 
            margin-bottom: 2px; 
            padding: 0px;
            border:none;
            background-color:white;
    	}
    	.inviteChattingMemberBtn {
       		margin-top:1px; height:30px; width:180px; padding-top: 0px; padding-bottom: 0px; text-align:left; background-color:white; border:none; border-radius:5px;
       	}
       	#chatting_bottom > button {
       		width: 359px;
       		height: 25px;
			margin-left: 20px;
			color: white;
			background-color: rgb(217, 173, 43);
			border:none;
			border-radius:5px;
			font-size: 12px;
			margin-top: 10px;
       	}
       	#documentWriteBtn {
       		display: none;
       		margin-top:20px;
       	}
       	#chattingSearch {
       		width:210px; height: 25px; font-size:12px; background-color: #393731; color:white; border: 0.5px solid gray; border-radius: 3px;
       	}
       	
       	.filter-active {
       		filter: brightness(0) saturate(100%) invert(83%) sepia(67%) saturate(2404%) hue-rotate(331deg) brightness(89%) contrast(92%) !important;
       	}
       	#chattingFile {
       		display:none;
       	}
       	#chatting_bottom > form > label > img {
       		width:24px;
       		margin : 12px 0px 0px 2px;
       	}
       	.messageFile {
            width: 200px;
            height: 25px;
          	border: 2px solid gray;
          	border-radius: 5px;
          	padding: 5px;
          	margin-bottom:5px;
        }
        .messageFile > img {
          	width:25px;
          	float:left;
        }
        .messageFile > span {
          	float:left;
          	width: 170px;
          	white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
        }
        .messageLink {
          	width: 200px;
          	height: 35px;
          	border: 2px solid gray;
          	border-radius: 5px;
          	margin-bottom:5px;
        }
        .linkImgBox > img {
          	width:25px;
        }
        .linkImgBox {
          	float:left;
          	border-radius:5px;
          	width: 35px;
          	height: 35px;
        }
        .linkContent {
          	width:155px;
          	height:35px;
          	float:left;
          	border-left:1px solid gray;
        }
        a {
        	text-decoration : none;
        	color:blue;
        }
        .chattingLinkA {
        	
        	display:block;
        	margin-left:5px;
        	width:200px;
        	white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
        }
        .linkContent > p {
          	margin:2px 0px 0px 2px;
          	width:150px;
          	white-space: nowrap;
			overflow: hidden;
			text-overflow: ellipsis;
        }
        #loginIdInput, #chattingRoomIdInput {
        		display:none;
        }
    </style>
</head>
<body>
	<div><button id="slide_chat_up">UP</button></div>
    <div id="right">
        <div id="top">
            <div style=" margin-bottom: 0px; padding-bottom:0px; margin:10px 0px;">
             	<p style="margin:0px 0px 0px 13px; color:white;">
             		<%
             			ChattingDao chattingDao = new ChattingDao();
             			String chattinMainName = chattingDao.getChattingMainName(loginId);
             			
             			PartnerDao partnerDao = new PartnerDao();
             		%>
             		<%=chattinMainName%> 
	                <button id="alarm"><img src="image/bell.svg"/></button>
             	</p>
            </div>
            <div style="margin-top:0px; width:236px; margin-left: 13px; margin-bottom:10px;">
            	<input id="chattingSearch" type="search" placeholder="대화방, 파트너 검색"/>
            </div>
        </div>
        <div id="bottom">
            <div id="workspaceM" class="chatting_title">
                <div class="title">협업공간 대화</div>
                <%
                	ArrayList<ChattingDto> workspaceChattingName = chattingDao.getWorkspaceChattingNameList(loginId);
                	for(ChattingDto workspaceChattingNameList : workspaceChattingName) {
                %>
					<div style="padding-right:10px;">
						<p class="chatting_room_name" chatting_room_id="<%=workspaceChattingNameList.getChatting_room_id()%>"><%=workspaceChattingNameList.getChatting_name() %></p>
					</div>                
                <%
                	}
                %>
            </div>
            <div id="groupM" class="chatting_title">
                <div class="title">그룹 대화</div>
                <%
                	ArrayList<ChattingDto> groupChattingName = chattingDao.getGroupChattingList(loginId);
                	for(ChattingDto groupChattingNameList : groupChattingName) {
                %>
					<div style="padding-right:10px;">
						<p class="chatting_room_name" chatting_room_id="<%=groupChattingNameList.getChatting_room_id()%>"><%=groupChattingNameList.getChatting_name() %></p>
					</div>                
                <%
                	}
                %>
            </div>
            <%
            	if(partnerDao.CompanyCheck(loginId)){
            %>		
            	<div id="corporationP" class="chatting_title">
                <div class="title">회사 동료</div>
                <%
               		ArrayList<PartnerDto> partnerList = partnerDao.getCompanyColleague(loginId);
                	for(PartnerDto commpanyColleague : partnerList) {
                %>
	            <div class="chatting_partner">
	                <div class="chattingMemberPicture" style="background-image: url(<%=commpanyColleague.getPicture()%>);">
	                	<img class="onOffImg" src="image/bell.svg"/>
	                </div><%=commpanyColleague.getName()%> <%=commpanyColleague.getEmail() %>
	            </div>
	            <div style="clear:both;"></div>
                <%
                	}
                %>
            </div>
            <div id ="partner" class="chatting_title">
                <div class="title">외부 협업자</div>
                <%
	            	ArrayList<PartnerDto> partnerList2 = partnerDao.getExternalPartner(loginId);
                	for(PartnerDto externalPartner : partnerList2) {
                %>
                <div class="chatting_partner">
                	<div class="chattingMemberPicture" style="background-image: url(<%=externalPartner.getPicture()%>);">
                		<img class="onOffImg" src="image/bell.svg"/>
                	</div><%=externalPartner.getName()%> <%=externalPartner.getEmail()%>
                </div> 
                <div style="clear:both;"></div>
                <% 
                	}
                %>
            </div>
            <%		
            	} else {
            %>		
            <%
            	ArrayList<PartnerDto> partnerList3 = partnerDao.getPartner(loginId);
            %>
            <div id ="partner" class="chatting_title">
                <div class="title">파트너</div>
            <%
               for(PartnerDto partner : partnerList3) {
            %>
                <div class="chatting_partner">
                	<div class="chattingMemberPicture" style="background-image: url(<%=partner.getPicture()%>);">
                		<img class="onOffImg" src="image/bell.svg"/>
                	</div><%=partner.getName()%> <%=partner.getEmail()%>
                </div> 
                <div style="clear:both;"></div>
            <% 
               }
            %>
            </div>
            <%		
            }
            %>
            
        </div>
    </div>
    <div style="float: left;">
        <div class="mainAlarm">
            <button class="mainAlarmBtn distrubMode" style="display: none">방해금지 모드 해제</button>
            <button class="mainAlarmBtn notDistrubMode">1시간 동안 알림 끄기</button>
            <button class="mainAlarmBtn notDistrubMode">2시간 동안 알림 끄기</button>
            <button class="mainAlarmBtn notDistrubMode">3시간 동안 알림 끄기</button>
            <button class="mainAlarmBtn notDistrubMode">다음날 이 시간까지 알림 끄기</button>
        </div>
        <div id="chattingOnOff">
            <div style="width:400px; height: 25px; border-bottom: 1px solid black;">
                <button id="xbutton">
                    <img src="image/x.svg" style="filter: brightness(0) saturate(100%) invert(0%) sepia(50%) saturate(4692%) hue-rotate(129deg) brightness(99%) contrast(96%);"/>
                </button>
            </div>
            
            <div id="chatting_top">
                <div class="chatting_name">
                        <button id="chattingRoomInformationBtn">
                            <img src="image/+.svg" style="width:18px; vertical-align:bottom"/>
                            <span id="chatting_room_name">방 제목</span>
                            <img id="down_button" src="image/down.svg"/>
                        </button>
                        <div id="chattingRoomInformation">
                            <div style="width:180px; height: 30px; padding:2xp 2px 2px 2px;">
                                <button id="alarmBtn">
                                    <span><img src="image/bell.svg" style="width:15px; margin-top: 0px; vertical-align: bottom; margin-left: 10px;"/></span>
                                    <span> 알 림 : </span>
                                    <span id="alarmText" style="color: #d9ad2b"> 모든 메세지 알림받기</span>
                                    <img src="image/down.svg" style="width:15px; vertical-align:bottom; margin-left:5px; filter: brightness(0) saturate(100%) invert(54%) sepia(0%) saturate(18%) hue-rotate(184deg) brightness(92%) contrast(81%);"/>
                                </button>
                                <div style="width:180px; height: 31px; border-top:1px solid gray; border-bottom: 1px solid rgb(128, 128, 128);">
                                    <button class="inviteChattingMemberBtn">
                                        <img src="image/+.svg" style="width:15px;"/>
                                        <span> 초대</span>
                                    </button>
                                </div>
        
                                <div id="participants">
                                    <p><b>참여자 <span id="countParticipantsMember"></span></b></p>
                                   	<div id="chattingparticipantsInformation">
	                                    <div>
	                                        <img class="participantsImg" src="image/comment.svg"/>
	                                        <span style="font-size: 10px; margin-top: 0px;">강태안</span>
	                                    </div>
                                   	</div>
                                </div>
                            </div>
							<div id="alarmSetting">
                                <p>대화방 알림 설정</p>
                                <button id="alarmOn"><img src="image/bell.svg"/>모든 메시지 알림받기</button>
                                <button id="alarmOff"><img src="image/bellOff.png"/>모든 알람 끄기</button>
                            </div>
						    <div class="inviteChattingRoom">
						    	<button class="closeInviteBox">
                    				<img src="image/x.svg"/>
                				</button>
						    	<h2><b>대화방 초대</b></h2>
						    	<p>대화상대를 선택하여 초대하세요.</p>
						    	<div>
							    	<input id="inviteSearchPartner" type="text" placeholder="이름, 이메일주소 입력"/>
							    	<input id="inviteBtn" type="button" value="초대하기"/>						    	
						    		<div id="invitePartnerList">
						    			<div>
						    				<img src="image/comment.svg"/> 강태안 <span>rkdxodks@naver.com</span>
						    			</div>
						    		</div>
						    	</div>
						    	<div id="chattingParticipantsInformation2">
							    	<div class="participantBox">
							    		<img src="image/comment.svg"/> 강태안
							    	</div>
						    	</div>
						    </div>
                        </div>
                </div>
                <div style="float:right; margin-top: 1px;">
                	<button id="documentwrite"><span>문서 작성</span></button>
                    <div style="float: right; margin-top: 6px; margin-left: 3px; margin-right: 3px;">
                    	<button id="chattingFileBtn"><img src="image/file.svg" class="file_link_img"/></button>
                        <div style="display: none"></div>
                        <button id="chattingLinkBtn"><img src="image/link.svg" class="file_link_img"/></button>
                        <div style="display: none"></div>
                    </div>
                </div>
                <div class="documentWriteClickAfterBanner">
                	<span>대화를 선택하여 문서로 작성해 보세요.</span>
                	<button class="xbutton">
                    	<img src="image/x.svg"/>
                	</button>
                </div>
            </div>
            <div style="width: 400px; height: 40px;"></div>
            <div id="chatting_middle">
                <div class="message">
                    <div>
                        <img class="messageProfile" src="image/bell.svg"/>
                    </div>
                    <div>
                        <div><span>이름</span><span> 시간</span></div>
                        <div>내용</div>
                    </div>
                </div>
                <div class="message">
                    <div>
                        <img class="messageProfile" src="image/bell.svg"/>
                    </div>
                    <div>
                        <div><span>이름</span><span> 시간</span></div>
                        <div class="messageFile">
                			<img src="image/file.svg"/>
                			<span>파일 이름dddd dddddddddddddd ddddddddddddddddddddddddd</span>
                		</div>
                		<div style="clear:both;"></div>
                    </div>
                </div>
               	<div class="message">
                    <div>
                        <img class="messageProfile" src="image/bell.svg"/>
                    </div>
                    <div>
                        <div><span>이름</span><span> 시간</span></div>
                        <a>링크</a>
                        <div class="messageLink">
                        	<div class="linkImgBox" style="background-image:url(image/bell.svg);"></div>
                        	<div class="linkContent">
	                			<p>링크제목ddddddddddddddddddddd</p>
								<p>부가설명</p>									                        	
                        	</div>
                		</div>
                		<div style="clear:both;"></div>
                    </div>
                </div>
                <div class="chattingDateTime">
                    <span><b>2022년 4월 29일</b></span>
                </div>
            </div>
            <div id="chatting_bottom">
            	<form id="fileUpload" action="UploadServlet" method="post" enctype="multipart/form-data">
	            	<label for="chattingFile">
	            		<img src="image/fileIcon.svg"/>
	            	</label>
	                <input type="file" id="chattingFile" name="chattingFile"/>
					<input type="hidden" id="loginIdInput" name="loginId" value=""/>
                	<input type="hidden" id="chattingRoomIdInput" name="chattingRoomId" value=""/>
            	</form>
                <input type="text" placeholder="여기에 입력해보세요." style="float:left;"/>
                <button id="documentWriteBtn">새 문서 작성</button>
 				<%
 					System.out.println(request.getAttribute("fileName"));
 				%>
            </div>
        </div>
    </div>
    <div id="messengerFiles">
        <div style="padding: 10px 0px 0px 20px;">파일 
        	<button class="xBtn">
        		<img src="image/x.svg"/>
        	</button>
        </div>
        <input id="chattingFileSearch" type="search" placeholder="파일명 검색"/>
        <div id="chattingFiles">
            <div class="chattingFile">
                <div style="float:left;">
                    <img src="image/file.svg" style="width:30px"/>
                </div>
                <div style="float:left;">
                    <p class="fileInformation"><b>201202 DBMS</b></p>
                    <p class="fileInformation"><span>5월 31일 오전 11:51</span><span> 강태안</span></p>
                </div>
                <div style="float:right">
                    <img src="image/file.svg" style="width:20px; margin-top:3px; margin-right: 5px; border-radius: 35px; filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;"/>
                </div>
            </div>
        </div>
    </div>
    <div id="messengerLinks">
        <div style="padding: 10px 0px 0px 20px;">링크 <button class="xBtn" style="width:20px; height:20px; padding: 0px; float: right; margin-right:15px; margin-top: 2px; border:none; background-color: white;"><img src="image/x.svg" style="filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;"/></button></div>
        <input id="chattingLinkSearch" type="search" placeholder="링크 검색" style="margin-left:20px; margin-top: 10px; width: 250px;"/>
        <div id="chattingLinks">
            <div class="chattingLink">
                <div style="float:left;">
                    <img src="image/file.svg" style="width:30px"/>
                </div>
                <div style="float:left;">
                    <p class="fileInformation"><b>201202 DBMS</b></p>
                    <p class="fileInformation">asdssssssssssssssssssssss ssssssssssssssssss</p>
                    <a class="fileInformation" style="text-decoration: none; display: block;" href="www.naver.com" >www.naver.com</a>
                    <p class="fileInformation"><span>5월 31일 오전 11:51</span><span> 강태안</span></p>
                </div>
                <div style="float:right">
                    <img src="image/file.svg" style="width:20px; margin-top:3px; margin-right: 5px; border-radius: 35px; filter: brightness(0) saturate(100%) invert(0%) sepia(0%) saturate(7500%) hue-rotate(288deg) brightness(94%) contrast(108%); width:20px;"/>
                </div>
            </div>
        </div>
    </div>
    <button id="btn_send">보내기 테스트</button>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.one.dto.*" %>
<%@ page import="com.one.dao.*" %>
<%@ page import="com.one.mvc.*" %>
<%@ page import="com.one.ajax.*" %>
<%
/* String loginJH = "2";
session.setAttribute("whoAreYou", loginJH); */
//session.getAttribute("whoAreYou");

Object getId = session.getAttribute("whoAreYou");
int loginId = 4;//Integer.parseInt((String)getId);


%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>문서작성</title>
  <!-- <script src="https://cdn.jsdelivr.net/npm/@editorjs/editorjs@latest"></script> -->
  <!-- <script src="editor.js"></script> -->
  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <!-- <link href="assets/demo.css" rel="stylesheet">
  <script src="assets/json-preview.js"></script> -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<style> /*임시저장*/

body, *{
    font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
    box-sizing: border-box;
    margin:0;
    padding:0;
    outline: none;
}
a{
	text-decoration:none;
}
input, button{
    border:none;
}
/* #drafts{
    height:100%;
} */
#drafts header{
    display:flex; 
    flex-direction:row; 
    justify-content:space-between;
    border-bottom:1px solid rgb(225,225,225);
    position:fixed;
    top:0;
    left:0;
    right:0;
    background-color: rgb(255,255,255);
    z-index: 101;
}

.icon_color{
    fill:rgb(136,136,136);
    cursor:pointer;
}
.drafts_tab1{
    display:flex;
    color:rgb(136,136,136);
    font-size:12px;
    align-items:center;
    padding:20px;
}
.drafts_tab1 button + label{
    margin-left:20px;
}
.drafts_tab2{
    display:flex;
    align-items:center;
    margin-right:20px
}
#drafts_more{
    cursor:pointer;
    background-color:transparent;
}
#drafts_del{
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
#drafts_del:hover{
  background-color:#f2f2f2;
}
#drafts_ws{
    background-color: rgb(255, 255, 255);
    border: 1px solid rgb(51, 132, 108);
    border-radius:4px;
    width: 180px;
    color:rgb(51, 132, 108);
    padding: 6px 10px 6px 15px;
    overflow:hidden;
    display:flex;
    justify-content:space-between;
    cursor:pointer;
}
.icon_color2{
    fill:rgb(51, 132, 108);
}
#saveButton{
    background-color:rgb(51, 132, 108);
    color:rgb(255, 255, 255);
    border-radius:4px;
    border:1px solid rgb(51, 132, 108);
    padding:7px 28px;
    font-size:12px;
    font-weight:500;
    cursor:pointer;
    margin-left:15px;
    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
}
#saveButton:hover{
    background-color: rgb(42, 98, 81);
    border-color: rgb(42, 98, 81);
}
.drafts_sec{
    width: 1px;
    height: 32px;
    background-color: rgb(225, 225, 225);
    margin: 0px 24px;
}

#drafts_list{
    flex-direction:column;
    font-size:13px;
    width: 240px;
    background-color: rgb(255, 255, 255);
    border-right: 1px solid rgb(225, 225, 225);
    padding-top:66px;
    overflow:scroll;
    height:100%;
    position:fixed;
    z-index:100;
}
#drafts_cnt{
    font-weight:bold;
    font-size:12px;
    color:rgb(136,136,136);
    background-color:rgb(250, 250, 250);
    height: 32px;
    padding:8px 0px 8px 18px;
}
.drafts_post{
    padding:15px 20px;
    border-bottom:1px solid rgb(225, 225, 225);
    cursor:pointer;
    line-height:1.5;
}
.drafts_title{
    display:flex;
    flex-direction:row;
    align-items:center;
    font-size:14px;
    /* font-weight:bold; */
}
.drafts_title img{
    width: 18px;
    height: 18px;
    cursor: pointer;
}
.drafts_info{
    color:rgb(136,136,136);
    display:flex;
    align-items:center;
    font-size:12px;
}
.drafts_ws2{
    color:rgb(51, 132, 108);
    margin-left:7px;
}






.drafts_scrollbar{
    background: #e1e1e1;
}
.drafts_scrollbar::-webkit-scrollbar{
    width:4px;
}
.drafts_scrollbar::-webkit-scrollbar-thumb{
    border-radius:2px;
    height:40%;
    background-color: #e1e1e1;
}
::-webkit-scrollbar{
  width:4px;
}
::-webkit-scrollbar-thumb{
  border-radius:2px;
  height:40%;
  background-color: #e1e1e1;
}
#postDocument .hidden{
  visibility:hidden;
  opacity:0;
}
#postDocument .none{
  display:none;
  opacity:0;
}

</style>  

<style>
#postDocument .workspace_list{/* 누르면 열리는 공간 목록*/
    display:flex;
    justify-content: right;
    margin-right:90px;
}
#postDocument .workspace_list ul{ /* 누르면 열리는 공간 목록*/
    position: fixed;
    list-style: none;
    background-color: rgb(255, 255, 255);
    border-radius: 4px;
    width: 160px;
    height:270px;
    border:1px solid #e1e1e1;
    font-size: 14px;
    font-weight: 500;
    color:rgb(34, 34, 34);
    padding:5px 12px;
    line-height: 2.5;
    z-index:102;
    margin-right:110px; 
    margin-top:35px;
    overflow: auto;
}
.#postDocument workspace_list ul li:nth-child(1){
    color:rgb(136, 136, 136); 
    font-size: 10.5px; 
    pointer-events: none;
}
#postDocument .workspace_list li{
    display:flex;
    flex-direction: row;
    align-items: center;
}
#postDocument .workspace_list li span{
    margin-left:7px;
}
.alert{
    background-color:rgb(66,64,63);
    color:rgb(255,255,255);
    font-size:14px;
    width:320px;
    height:auto;
    border-radius:4px;
    position:absolute;
    bottom:0;
    margin:20px;
    padding:16px;
    overflow:auto;
    line-height:1.5;
    display:none;
    z-index:200;
    box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
}
.closed{
    margin-left:20px;
    float:right;
    cursor:pointer;
}

</style>

<script> /*임시저장*/
	var workspaceId = <%=request.getParameter("workspaceId")%>;
	if(workspaceId == null) {
		workspaceId = 4;
	}
	var workspaceName = $(".document_ws").text();<%-- "<%=request.getParameter("workspaceName")%>"; --%>
    var documentId = <%=request.getParameter("documentId")%>  
  	$(function() {
    	var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
    	
   /*  //문서작성 누르기
    $(document).on("click","#document_bnt", function(){ //json 형식으로 저장함. */
		$("#postDocument").removeClass("none");
		$("textarea.document_title").attr("documentId", documentId);
		
    	//임시저장 리스트 목록 채우기
        $.ajax({
			type:"post", 
			url:"DraftsPostsServlet",
			data:{
				"memberId":<%=loginId%>
			},
			datatype:"json",
			success:function(data){ 
				$.each(data, function(index, item){
					$("img").css("background-image", item.kanban_icon_p);
					var box = "<div class='drafts_post' documentId='"+item.document_id+"' workspaceId='"+item.workspace_id+"'>"
			            +"<div class='drafts_title'>"
		                +"<img src='https://down.collabee.co/postStatus/1603707'>"
		                +"<div>"+item.title+"</div>"
		            	+"</div>"
		            	+"<div class='drafts_info'>"
		                +"<span>"+item.date+"</span>"
		                +"<span class='drafts_ws2'>"+item.workspace_name+"</span>"
		            	+"</div>"
		       			+"</div>";
		       			
					$("#drafts_list").append(box);
				});					
			}//success end.
        });
    	//나의 협업공간 목록 채우기
    	$.ajax({
			type:"post", 
			url:"Controller?command=ModalWorkspaceListjh",
			data:{
				"loginId":<%=loginId%>
			},
			datatype:"json",
			success:function(data){
				$.each(data, function(index, item) {
					var wsList = "<li WorkspaceId='"+item.workspace_id+"'>"
		    			+"<svg viewBox='0 0 24 24' width='16px' height='16px'><path d='M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z'></path>"
				    	+"</svg><span>"+item.workspace_name+"</span>"
				    	+"</li>"; 
					if(item.workspace_id==workspaceId) {
						if(item.workspace_name=="프라이빗 공간"){
							$("#drafts_ws").html(item.workspace_name + "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#d9ad2b' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
							.css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
							$("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
							$(".document_ws").css({'background-color':"rgb(250, 243, 223)", color:"rgb(204, 153, 0)"});
						} else {
							$("#drafts_ws").html(item.workspace_name + "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#33846c' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
							.css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
				            $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
							$(".document_ws").css({'background-color':"rgb(234, 242, 240)", color:"rgb(51, 132, 108)"});
						}
						$(".document_ws").html(item.workspace_name);
					}				    	
				    $(".workspace_list ul").append(wsList);  	
				});
			
			} 
    	});
   /*  });  *///done.
	
    //임시저장 문서 누르면 문서 바뀜
    $(document).on("click",".drafts_post", function(){ 
    	var documentId = $(this).attr("documentId");
      	$("#drafts_list").css("display","none");
      	$("textarea.document_title").val($(this).find(".drafts_title").text()).attr("documentId", documentId);
      	$(".document_ws").val($(this).find(".drafts_ws2").text()).attr("workspaceId", $(this).attr("workspaceId"));
      	/* $.ajax({
			type:"post",
			url:"../Controller?command=getDraftsDocument",
			data:{
				"documentId":documentId
			},
			datatype:"json",
			success:function(){
				
			},
			error:function(){
				alert("error!");
			}
      	}); */
      	//내용 읽어오기(해야됨)
    });
    
    //임시저장함 문서 효과
    $(document).on("hover", ".drafts_post", function(){ 
        $(this).css("background-color", "rgb(239, 239, 239)");
    }, function() {
        $(this).css("background-color", "transparent");
    });
    $(".drafts_post").on("click",(function(){
        $(this).css("background-color", "rgb(239, 239, 239)");
	}));
    
    //임시저장함 열고 닫기
    $(".drafts_bnt").click(function(){
    	$("#drafts_list").toggle();
    });
   
     //닫기버튼 누를때
     $("#drafts_close").click(function(){
    	 $("#postDocument").addClass("none");
    	 //history.back();
     });
    
    //삭제 열고닫기
    $(document).on("click",function(e){
        if($(e.target).is("#drafts_more svg")) {
          $("#drafts_del").css({visibility:"visible", opacity:1});
        } else {
          $("#drafts_del").css({visibility:"hidden", opacity:0});
        } 
    });

    //선택한 문서 삭제 클릭           sql에 document_id fk 제약조건 확인
    $("#drafts_del").click(function(){
        if(confirm("임시저장된 문서를 삭제하시겠습니까?")==true){
           	var document_id = $(".document_title").attr("documentid");
        	$.ajax({
            	type:"post",
            	url:"DocumentDelServlet",
            	data:{
            		"memberId":<%=loginId%>,
            		"drafts":1,
            		"documentId":document_id
            	},
            	datatype:"json",
            	success:function(data){
            		if(data.IsDel) {
			        	var alert_message = $(".alert").html(x+"임시저장한 문서가 삭제되었습니다.");
			            alert_message.fadeIn(function(){
			              setTimeout(function(){
			                alert_message.fadeOut();
			              }, 3000);
			            });
			            
			            //글자수에 따라 높이 정하기
			            var height = alert_message.prop("scrollHeight");
			            alert_message.css("height", height);
			            $("#drafts_del").css({visibility:"hidden", opacity:0});
            		}
            		//리스트에서 삭제해주기
            		$(".drafts_post").each(data, function(index, item) {
	            		if($(item).attr("documentid")==document_id){
	            			$(item).detach();
	            		}
            		});
            	}
            });
        } else {
          return;
        }
    });//done.
    
     //리스트 열고 닫음
     $(document).on("click", function(e){
      var ws = $(".document_ws").text();
      if($(e.target).is("#drafts_ws")){
          $(".workspace_list > ul").removeClass("hidden");
          $("#drafts_ws").html("공간 검색").css("color", "rgb(136, 136, 136)");
          $("#drafts_ws svg").css({visibility:"hidden", opacity:0});
      
      } else{
    	  
          $(".workspace_list ul").addClass("hidden");
	      var svg = "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#d9ad2b' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>";
          if(ws=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜.
        	  $("#drafts_ws svg path").css("fill","rgb(217, 173, 43)");
              $("#drafts_ws").html(ws+svg).css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
              $("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
              $(".document_ws").html(ws).css({color:"rgb(204, 153, 0)", 'background-color':"rgb(250, 243, 223)"})
          
          } else{ //다른 공간 선택했을때
        	  
		      var svg = "<svg viewBox='0 0 24 24' width='16px' height='16px'><path fill='#33846c' d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>";
        	  $("#drafts_ws svg path").css("fill","rgb(51, 132, 108)");
        	  $("#drafts_ws").html(ws+svg).css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
              $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
              $(".document_ws").html(ws).css({color:"rgb(51, 132, 108)", 'background-color':"rgb(234, 242, 240)"});
          }
      }
    });
    
    //리스트 선택하면 그 값으로 바뀌고 리스트 닫힘
    $(".workspace_list ul").on("click", "li", function(){ 
      var workspace = $(this).text();
      var workspaceId = $(this).attr("workspaceId");
      
      if(workspace=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜.
    	  $("#drafts_ws svg path").css("fill","rgb(217, 173, 43)");
          $("#drafts_ws").html("프라이빗 공간<svg viewBox='0 0 24 24' width='16px' height='16px'><path d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
          .css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
          $("#saveButton").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
          $(".document_ws").html(workspace).css({color:"rgb(204, 153, 0)", 'background-color':"rgb(250, 243, 223)"})
      } else{ //다른 공간 선택했을때
    	  $("#drafts_ws svg path").css("fill","rgb(51, 132, 108)");
          $("#drafts_ws").html(workspace+"<svg viewBox='0 0 24 24' width='16px' height='16px' class='icon_color2'><path d='M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z'></path></svg>")
          .css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
          $("#saveButton").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
          $(".document_ws").html(workspace).css({color:"rgb(51, 132, 108)", 'background-color':"rgb(234, 242, 240)"});
      }
      $("#drafts_ws").attr("workspaceId", workspaceId);
      $(".workspace_list > ul").addClass("hidden");
      $("#drafts_ws svg").css({visibility:"visible", opacity:1});
    });//done.

    $(".workspace_list li").hover(function (){
        $(this).css("background-color", "rgb(242,242,242)");
    }, function(){
        $(this).css("background-color", "rgb(255, 255, 255)");
    });
    
    //저장버튼 누를때(미루기)
    /* $("#saveButton").click(function(){ */
    	<%-- $.ajax({
        	type:"post",
        	url:"../Controller?command=saveDocument",
        	data:{
        		"loginId":<%=loginId%>,
        		"workspace_id":8//workspace_id
        		"title":,
        		"content":
        			
        		//블럭데이터 넣기
        	},
        	datatype:"json",
        	success:function(data){
        		if(data.IsDel) { --%>
			       /*  var alert_message = $(".alert").html(x+"저장 됐습니다.");
		            alert_message.fadeIn(function(){
		              	setTimeout(function(){
		                alert_message.fadeOut();
		              }, 3000);
		            });
		            //글자수에 따라 높이 정하기
		            var height = alert_message.prop("scrollHeight");
		            alert_message.css("height", height); */
		            
		            //발행된 문서 보여주기(해야됨)
		           // location.href="PostedDocument.jsp";
        		/* } */ 
        	/* } */
       /*  }); */
    /* }); */
	
    //제목 칸에 맞춰 늘어나기
    $(".document_title").on('keydown', function() {
        var title = $(this).val();
        var height1 = $(this).prop("scrollHeight");
        $(this).css("height", height1);
    
        if(title.length > 150) {
            $(this).val(title.substring(0, 150));
              
            //안내메세지 뜨기
            var alert_message = $(".alert").html("제목은 150자까지 입력할 수 있습니다.");
            alert_message.fadeIn(function(){
                setTimeout(function() {
                  alert_message.fadeOut() //3초후에 자동으로 닫힘
                }, 3000);
            });
            //안내메세지 높이
            var height2 = alert_message.prop("scrollHeight");
            alert_message.css("height", height2);
        } 
    });
	
      //다시 줄어들기
      	$(".document_title").on("keyup", function(){
	        $(this).css("height", "auto"); //다시 오토로 만들고
	        var height = $(this).prop("scrollHeight"); //스크롤 길이 측정
	        $(this).css("height", height); //스타일에 대입
		});
	});
</script>
<script>
	$(function() {
		// 칸반 문서상태변경 모달띄우기 / 닫기
		$(".kanban_select_button").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 25;
        	$("#kanban_selector").css('left',px+'px');
        	$("#kanban_selector").css('top',py+'px');
			
			$("#kanban_selector").css('display', 'block');
			$("#div_background").css('display', 'block');

			$.ajax({
				type: 'post',
				url: 'Controller', 
				data: {'command' : 'KanbanSelector', 'workspace_id' : workspaceId},
				datatype: "json",	
				success: function(d){
					$(".kanban_selector_menu").empty();
					for(i=0; i<d.length; i++){
						var kanban_id = d[i].kanban_id;
						var kanban_icon_p = d[i].kanban_icon_p;
						var kanban_name = d[i].kanban_name;
						var str = "<button class='kanban_selector_menu_button'>" +
										"<div class='kanban_id' style='display:none'> "+kanban_id+" </div>" +
										" <img src=' "+ kanban_icon_p +" ' size='20' class='kanban_img'>" +
										" <span class='kanban_selector_name'>"+ kanban_name +"</span>" +
										" </button>";
						$(".kanban_selector_menu").append(str);
					}
					
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
			
		});
	  	$("#div_background").click(function() {
	    	$("#div_background").css('display', 'none');
	  		$("#kanban_selector").css('display', 'none');
	  	});
	  	$(".kanban_selector_menu_button").click(function(){
	  		var text = $(this).find(".kanban_selector_name").text();
	  		var img = $(this).find(".kanban_img").attr("src");
	  		
	  		$(".document_kanban").find("img").attr("src", img);
	  		$(".document_kanban").find("span").html(text);
			$("#kanban_selector").css("display","none");
	  	});
	}); 
</script>

</head>
<body>
  <div class="alert"><svg viewBox="0 0 24 24" width="24px" height="24px" class="closed"><path fill="rgb(255,255,255)" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>

  <button id="document_bnt">문서작성</button>
<div id="postDocument"> <!--문서 전체-->
  <div id="drafts"> <!--임시저장-->
    <header>
        <div class="drafts_tab1">
            <button class="drafts_bnt"></button>
            <label>임시저장 중..</label>
        </div>
       	<input type="hidden" name="input_hidden_data"/>
        <div class="drafts_tab2">
            <button id="drafts_more"><svg viewBox="0 0 24 24" width="24px" height="24px" class='icon_color'><path d="M6 10c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm12 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2zm-6 0c-1.1 0-2 .9-2 2s.9 2 2 2 2-.9 2-2-.9-2-2-2z"></path></svg></button>
            <div id="drafts_del" class="hidden">삭제</div>
            <div class="drafts_sec"></div>
            <!--  style="position:absolute; right:200px;" -->
            <button id="drafts_ws">코드공유 공간<svg viewBox="0 0 24 24" width="16px" height="16px" class='icon_color2'><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg></button>
            <button id="saveButton">저장</button> 
            <div class="drafts_sec"></div>
            <div id="drafts_close"><svg viewBox="0 0 24 24" width="22px" height="22px" class="icon_color"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>
        </div>
    </header>

    <div class="workspace_list">
      <ul class="icon_color hidden">
          <li>공간 검색</li>
          <!-- <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>프로젝트</span></li>
          <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>코드공유 공간</span></li>
          <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg><span>프라이빗 공간</span></li>
          <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"></path></svg><span>모두의 공간</span></li>
          <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>Test</span></li> -->
      </ul>
  </div>

    <div id="drafts_list" class="drafts_scrollbar" style="display:none;">
        <div id="drafts_cnt">임시저장함</div>
       
      <!--  <div class="drafts_post">
            <div class="drafts_title">
                <img src="	https://down.collabee.co/postStatus/1603707">
                <div>untitled</div>
            </div>
            <div class="drafts_info">
                <span>5월 8일</span>
                <span class="drafts_ws2">Test22 공간</span>
            </div>
        </div> -->
    </div>
</div>


<style>
	.row{
		display:flex;
		flex-direction:row;
	}
	.column{
		display:flex;
		flex-direction:column;
	}
	.document_header{
		max-width: 650px;
		margin: 0 auto;
		margin-bottom:30px;
	}
	.document_kanban{
		padding: 1px 5px;
		border: 1px solid rgb(224, 221, 217);
		border-radius: 6px;
		background-color: transparent;
		cursor: pointer;
		display: flex;
		flex-direction: row;
		-webkit-box-align: center;
		align-items: center;
		transition: fill 0.2s ease 0s;
		color: #75726f;
		font-size: 14px;
	}
	.document_kanban:hover{
	  background-color: rgb(247, 246, 245);
	}
	.document_ws{
		overflow: hidden;
		display: inline-block;
		margin-left: 6px;
		padding: 2px 8px;
		border-radius: 6px;
		background-color: rgb(234, 242, 240);
		color: rgb(51, 132, 108);
		font-size: 14px;
		line-height: 24px;
		white-space: nowrap;
		text-overflow: ellipsis;
		transition: color 0.2s ease 0s;
  	}
	.document_title{
	    border:none;
	    font-size:36px;
	    line-height:46px;
	    font-weight:bold;
	    padding-top:5px;
	    width: 100%;
	    resize:none;
	    height:auto;
	    overflow: hidden;
	}
	.document_title::placeholder{
	   color:rgb(196,196,196);
	}
  	.drafts_bnt{
	  	width:22px;
	  	height:22px;
  		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 22 22'%3E%3Cg fill='grey' fill-rule='evenodd'%3E%3Cpath d='M14.823 2.083c.773 0 1.454.51 1.676 1.254l2.251 8.33v4.166c0 1.15-.933 2.084-2.083 2.084H3.333a2.083 2.083 0 0 1-2.083-2.084v-4.166l2.25-8.33a1.751 1.751 0 0 1 1.677-1.254h9.646zm0 1.167H5.177a.585.585 0 0 0-.522.32l-.028.071-2.169 8.026h5.459a2.083 2.083 0 0 0 4.166 0h5.458L15.38 3.67a.586.586 0 0 0-.474-.415l-.084-.006zm-.678 5.25c.334 0 .605.261.605.583 0 .322-.27.584-.605.584h-8.29a.594.594 0 0 1-.605-.584c0-.322.27-.583.605-.583h8.29zm-.908-3.333a.59.59 0 0 1 .596.583.59.59 0 0 1-.596.583H6.763a.59.59 0 0 1-.596-.583.59.59 0 0 1 .596-.583h6.474z'%3E%3C/path%3E%3C/g%3E%3C/svg%3E");
  		cursor:pointer;
  		background-color:rgb(255,255,255);
  	}
	#kanban_selector{
		display: none;
		z-index: 101;
		position: absolute;
	    top: 0px;
	    left: 0px; 
	}
	#postDocument #div_background {
		display: none;
		z-index: 100;
		position: absolute;
		top: 0;
		left: 0;
		right: 0;
		bottom : 0;
		width: 100%;
		height: 100%;
		/* background-color: rgba(0,0,0,0.5); */
		background-color: transparent;
	}
	.kanban_selector_center{
		max-width: 332px;
	    min-width: 180px;
	    display: flex;
	    flex-direction: column;
	    border-radius: 6px;
	    box-shadow: rgb(0 0 0 / 5%) 0px 0px 0px 1px, rgb(0 0 0 / 10%) 0px 2px 4px, rgb(0 0 0 / 15%) 0px 8px 16px;
	    background-color: rgb(255, 255, 255);
	    padding-top: 12px;
	    padding-bottom: 12px;
	    width: 184px;
	}
	.kanban_selector_title{
		display: block;
	    font-weight: normal;
	    font-size: 12px;
	    color: rgb(136, 136, 136);
	    line-height: 1.5;
	    padding: 0px 10px 4px 15px;
	}
	.kanban_selector_menu{
		max-height: 286px;
	    overflow: hidden auto;
	    display: flex;
	    flex-direction: column;
	}
	.kanban_selector_menu_button{
		cursor: pointer;
	    border: none;
	    display: flex;
	    flex-direction: row;
	    align-items: center;
	    color: rgb(34, 34, 34);
	    background-color: rgb(255, 255, 255);
	    padding: 5px 8px 5px 13px;
	    transition: background-color 0.2s ease 0s;
	    text-align: left;
	}
	.kanban_selector_menu_button:hover{
		background-color: rgb(242, 242, 242);
	}
	.kanban_img{
		margin-right: 2px;
	    flex-shrink: 0;
        width: 20px;
	    height: 20px;
	}
	.kanban_selector_name{
		white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    margin-right: 2px;
	    color: rgb(34, 34, 34);
	    font-size: 13px;
	    max-width: 250px;
	    flex: 1 1 0%;
	    line-height: 24px;
	}
</style>

	

<div style="margin-top:100px;"> <!--제목과 문서 에디터-->
  
  	<div class="document_header column"> 
	    <div class="row">
	      <button type="button" class="document_kanban kanban_select_button"><img src="https://down.collabee.co/postStatus/1603707" style="width:18px; height:18px;"/><span>발의됨</span><svg width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#888888" fill-rule="evenodd"></path></svg></button>
	      <div class="document_ws">코드공유 공간</div>
	    </div>
	    <textarea placeholder="제목을 입력해 주세요." class="document_title" maxlength="150" rows="1"></textarea>
  	</div>
  
	<div id="kanban_selector" role="tooptip" >
		<div class="kanban_selector_center">
		<h6 class="kanban_selector_title">문서상태변경</h6>
		<!-- <a>칸반으로 이동 (톱니바퀴모양 이미지)</a> -->
		<div class="kanban_selector_menu">

		</div>
		</div>
	</div>
	
	<div id="div_background"></div>


<!-- 문서 에디터-->
<div class="row" style="justify-content:center;">
	<%@ include file="../WEB-INF/include/include_editor.jspf"%>
	
	<div style="position: absolute; right:0;">
		<%@ include file="../WEB-INF/include/include_rightBar.jspf"%><!-- 정리하기 -->
	</div>
	<%@ include file="../WEB-INF/include/include_postedSchedule.jsp" %>
</div>            
  </div>    
</div>  
</body>
</html>

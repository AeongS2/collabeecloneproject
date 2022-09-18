<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.yr.dto.*" %>
<%@ page import="com.yr.dao.*" %>
<%
	/* int login_id = (int)(session.getAttribute("login_id")); */
	DmDao dDao2 = new DmDao();
	ArrayList<DmWidgetDto> widget = dDao2.getWidget(4);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<style>
	a{
		text-decoration: none;
		color: black;
	}
    .dmw{
    	padding-bottom: 8px;
	    display: flex;
	    flex-direction: row;
	    padding-top: 8px;
    }
    .dmw2{
	    color: rgb(34, 34, 34);
	    font-size: 12px;
	    line-height: 1.5;
	    transition: color 0.2s ease 0s;
	    min-width: 0px;
    }
    .aside_title{
    	text-overflow: ellipsis;
	    white-space: nowrap;
	    overflow: hidden;
	    overflow-wrap: break-word;
    }
    .aside_writer{
    	word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    color: rgb(136, 136, 136);
    }
    .dmw_icon{
		padding-right: 5px;
		fill: rgb(193, 193, 193);
	}
	.dmw_icon:hover{
		fill: rgb(153, 153, 153);
	}
	*{
		box-sizing: border-box;
	}
	body, div {
		font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
	input, button{
		border:none;
		outline:none;
		box-shadow:none;
	}
	#right_bar{
		background-color: transparent;
		flex: 0 0 auto;
		width: 250px;
		overflow-y: auto;
		height: calc((100vh - 126px) - 38px);
		padding: 42px 0px 20px 14px;
		/* position: absolute;  */
	  	right: 0;
	  	/* top: 155px; */
	}
	.schedule_icon{
		width:17px;
		height:17px;
		padding:8px;
		margin-top:5px;
	}
	.icon_sche1{
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' style='fill: rgb(225,225,225);' viewBox='0 0 24 24'%3E%3Cpath d='M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z' color='%23E1E1E1'%3E%3C/path%3E%3C/svg%3E");
	}
	.icon_sche2{
		background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' style='fill: rgb(196,196,196);' viewBox='0 0 24 24'%3E%3Cpath d='M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z' color='%23E1E1E1'%3E%3C/path%3E%3C/svg%3E");
	}
	.post_schedule{
		padding-bottom: 4px;
		color: rgb(136, 136, 136);
		font-size: 14px;
		line-height: 1.57;
		transition: color 0.2s ease 0s;
	}
	#right_bar ::placeholder{
		border: none;
		border-radius: 0px;
		width: 168px;
		background-color: rgb(255, 255, 255);
		font-size: 12px;
		color:rgb(196,196,196);
		line-height: 1.5;
		margin-bottom: 2px;
	}
	#startD, #endD, input[title="오늘 날짜"], [title="일정제목"]{
		margin-left:7px;
		color: rgb(34, 34, 34);
		font-size: 12px;
		line-height: 1.5;
		transition: color 0.2s ease 0s;
		min-width: 0px;
		cursor:pointer;
	}
	#startD, #endD {
		width:60px;
	}
	input[title="오늘 날짜"]:hover, [title="일정제목"]:hover{
		color:rgba(34, 34, 34, 0.7);
	}   
	.row{
		display:flex;
		flex-direction: row;
	}
	.column{
		display:flex;
		flex-direction:column;
	}
	.scheduleW{
		padding-bottom: 42px;
	}
	.todo_aside_container{
		/* flex: 0 0 250px;
	    height: 100%; */
	    padding-bottom: 42px;
	}
	.todo_aside_filtertitle{
		display: block;
	    font-size: 14px;
	    font-weight: normal;
	    color: rgb(136, 136, 136);
	    margin-top: 0px;
	    margin-bottom: 4px;
	}
	.todo_aside_item{
		display: flex;
	    flex-direction: row;
	    margin-bottom: 8px;
	 }   
	.todo_aside_item_link {
		display: inline-flex;
	    flex-flow: row wrap;
	    -webkit-box-align: center;
	    align-items: center;
	    color: rgb(34, 34, 34);
	    font-size: 12px;
	    line-height: 1.5;
	    transition: color 0.2s ease 0s;
	    min-width: 0px;
	    align-items: flex-end;
	}
	.todo_aside_iten_btn{
		background-color: transparent;
   		transform: translateY(2px);
	}
	.todo_aside_item_title{
		display: inline-block;
	    padding-right: 5px;
	    word-break: break-word;
	}
	.todo_aside_item_name{
		display: inline-block;
	    word-break: break-all;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    color: rgb(136, 136, 136);
	}
	.todo_ul{
		padding: 0px;
    	margin: 0px;
	}
	</style>
	<script>
	var workspaceId = <%=request.getParameter("workspaceId")%>;
	var workspaceName = "<%=request.getParameter("workspaceName")%>";
	var loginId = 4;
	var global_d;
	$(function(){
		
		$("#rightBar_schedule").empty();//아래 추가되면 
		$.ajax({
			type:"post", 
			url:"Controller?command=showTwoSchedule",
			data:{
				"workspaceId":8,
			},
			datatype:"json",
			success:function(data){
				$.each(data, function(index, item) {
					var schedule = "<div class='row' style='margin-top:10px;'>"
						+"<div class='schedule_icon icon_sche2'></div>"
						+"<div class='column' style='width: 226px;'>"
						+"<input title='오늘 날짜' type='text' placeholder='오늘 날짜' value='"+item.start_date+" ~ "+item.finish_date+"' readonly/>"<!--datepicker-->
						+"<input title='일정제목' type='text' placeholder='새 일정 제목 입력' scheduleId='"+item.scheduleId+"' value='"+item.title+"' readonly/>"
						+"</div>"
						+"</div>";	
					
						$("#rightBar_schedule").append(schedule);
				
				$.ajax({
					type:"post",
					url:"Controller?command=scheduleGetter",
					data:{
						"scheduleId":item.scheduleId,
					},
					datatype:"json",
					success:function(data){
						//$.each(data, function(index, item){
							$(".edit_title_container textarea").val(data.title);					
							$("#schedule_start").val(data.startDate); //날짜 나오는 형식 다름
							$("#schedule_end").val(data.finishDate);
							$("#schedule_location > textarea").val(data.locations);
							$("#schedule_summary > textarea").val(data.content);//여기까지는 성공
							
							$(".attendee_list ul li").each(function(index, item) {
								var memberId = $(item).attr("scheduleattendee_id");
								if(data.writerId==memberId){
								$(".assign_list_span").text($(item).attr("name"));							
									//참석자 배열만 풀어서 넣으면 됨.....!!!
								}
								var atd = data.attendee;
								for(var i in atd){
									if(atd[i]==memberId){
										var setPickedMember = "<div class='selected_attendee' email='"+$(item).attr("email")+"' scheduleattendee_id='"+memberId+"'><span>"+$(item).text()+"</span></div>";
										$("#schedule_modal .picked_attendee").append(setPickedMember);
									}
								}
							});
					},
					error:function(r,s,e){
						alert("error!");	
					}
				});
				});
			
			},
			error:function(r,s,e){
				alert("error!");
			}
		});
		
	});	
	</script>
	
	
</head>
<body>
	<div id="right_bar" class="left-bar column">
		<div style="padding-bottom: 42px;">
			<a href="" class="post_schedule">공유된 일정</a>
			<div class="row" style="margin-top:10px;">
				<div class="schedule_icon icon_sche1"></div>
				<div class="column">
					<div class="row">
						<input id="startD" title="시작 날짜" type="datepicker" placeholder="오늘 날짜" />
						<span>~</span>
						<input id="endD" title="종료 날짜" type="datepicker" /> 
					</div>
					<input id="scheT" title="일정" type="text" placeholder="새 일정 제목 입력"/>
				</div>
			</div>
			<div id="rightBar_schedule" class="scheduleW">
	
			</div>
		</div>
		<!-- 여기까지 일정 -->
		<aside class="todo_aside_container">
			<h6 class="todo_aside_filtertitle">마감이 임박한 내 할 일</h6>
				<ul class="todo_ul">
					<%-- <%
					ArrayList<TodoListDto> todoListW = (ArrayList<TodoListDto>)request.getAttribute("todoListW");
					for(int i = 0; i<todoListW.size(); i++){
					%> --%>
						<li class="todo_aside_item"" >	<!-- 마감임박할일 시작 -->
							<div style="display: none;"><%-- <%= todoListW.get(i).getTodo_id() %> --%></div>
							<div>
								<button class="todo_aside_iten_btn" style="background-color:transparent">
									<svg viewBox="0 0 24 24" width="18px" height="18px" class="svg1"><path fill="#888888" d="M12 1.5C6.204 1.5 1.5 6.204 1.5 12S6.204 22.5 12 22.5 22.5 17.796 22.5 12 17.796 1.5 12 1.5zM9.9 17.25L4.65 12l1.48-1.48 3.77 3.758 7.97-7.969L19.35 7.8 9.9 17.25z"></path></svg>								
								</button>
							</div>
							<div class="todo_aside_item_link">
								<span class="todo_aside_item_title"><%-- <%= todoListW.get(i).getContent() %> --%>2시까지 발표자료 준비</span>
								<span class="todo_aside_item_name"><%-- <%= todoListW.get(i).getWriter_p() %> --%>정민</span>
							</div>
						</li> <!-- 마감임박할일 끝 -->
					<%-- <%
						}
					%> --%>
					</ul>
				</aside>
		<!-- 여기까지 할일 -->
		
		
		<div style="padding-bottom: 42px;">
			<div class="post_schedule">받은 의사결정</div>
			<div>
<%
	for(DmWidgetDto dto : widget){
%>
		<a class="dmw" href="" dmID="<%= dto.getDocument_id()%>">
			<div>
			<svg viewBox="0 0 24 24" width="17px" height="17px" class="dmw_icon"><path d="M2.833 4h13.75c.633 0 1.128.32 1.458.807L23 12.25l-4.96 7.434c-.33.486-.888.816-1.52.816H2.832A1.839 1.839 0 0 1 1 18.667V5.833C1 4.825 1.825 4 2.833 4zm11.917 9.625c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375zm-4.583 0c.76 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375s-1.375.614-1.375 1.375c0 .76.614 1.375 1.375 1.375zm-4.584 0c.761 0 1.375-.614 1.375-1.375 0-.76-.614-1.375-1.375-1.375-.76 0-1.375.614-1.375 1.375 0 .76.614 1.375 1.375 1.375z" color="#c1c1c1" class="Beecon__Path-sc-3x6pq4-1 ehFssD"></path></svg>
			</div>
			<div class="dmw2">
				<div class="aside_title"><%= dto.getDecision_making_title()%></div>
				<div class="aside_writer"><%= dto.getName()%></div>
			</div>
		</a>
<%
	}
%>
				
		</div>
		</div>
	</div><!--위젯 끝-->
	
	
	
				
<script>
	$(function(){
		//datepicker 안됨
		$("#startD, #endD").datepicker({//datepicker호출
			dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
			,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
			,dayNamesMin:["일", "월","화","수","목","금","토"]
			, showButtonPanel:true, currentText:"오늘", closeText:"닫기"
			,onSelect:function(dataText, inst) {
				var d = dataText;
			
				var arr=d.split(".");
				var year=arr[0]; //연도
				var month=arr[1]; //월
				var day=arr[2]; //일
			}//뭐가 start인지 end인지 구분 해야됨
		});
		
		//현재날짜 가져오기
		$("#startD, #endD").datepicker("setDate", new Date()); 
		
		//finish가 start보다 전이면 start가 선택한 finish 날짜로 변함
		$('#startD').datepicker("option", "onClose", function (selectedDate) {
			$("#endD").datepicker("option", "minDate", selectedDate);
		});
		
		
	});
</script>
</body>
</html>
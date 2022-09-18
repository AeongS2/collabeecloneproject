<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		body, *{
            font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
            box-sizing: border-box;
            margin:0;
            padding:0;
            outline: none;
        }
        a{
            text-decoration:none;
            color: rgb(34, 34, 34);
        }
        input, button{
            border:none;
        }
        
        .overlay{
        	position:fixed;
            width:100%;
            height:100%;
            background-color:rgba(0, 0, 0, 0.5);
            display:flex;
            align-items: center;
            justify-content: center;
            transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
        }
        .new_chatting_room_container{
        	width: 600px;
		    padding: 20px 32px 32px;
		    display: flex;
		    flex-direction: column;
		    min-height: 440px;
		    height: 680px;
		    
		    background-color: #fff;
		    flex: 0 1 auto;
		    max-height: calc(100% - 96px);
		    margin: 48px;
		    display: flex;
		    position: relative;
		    /* overflow-y: auto; */
		    border-radius: 4px;
		    box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        }
        .new_cr_header{
        	display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    align-items: flex-start;
		    margin-bottom: 20px;
		    flex: 0 0 64px;
        }
        .header_for_resetPW{
        	margin-bottom: 40px;
		    color: rgb(136, 136, 136);
		    flex: 0 1 auto;
        }
        .h2_for_resetPW{
        	font-size: 22px;
		    line-height: 1.36;
		    color: rgb(34, 34, 34);
		    font-weight: bold;
		    margin-bottom: 8px;
        }
        .span_for_resetPW{
        	font-size: 15px;
		    line-height: 1.47;
		    color: rgb(136, 136, 136);
        }
        .button_x_ncr{
        	position: absolute;
		    top: 12px;
		    right: 12px;
		    padding-left: 0px;
		    padding-right: 0px;
		    transition: fill 0.2s ease 0s;
		    cursor: pointer;
		    pointer-events: auto;
		    width: auto;
		    background-color: transparent;
		    text-decoration: none;
        }
        .button_x{
        	transition: fill 0.2s ease 0s;
    		fill: rgb(136, 136, 136);
        }
        .button_x_ncr:hover{
    		background-color: rgba(0, 0, 0, 0.05);
    		border-radius: 6px;
		}
		.ncr_input{
			width: 430px;
    		height: 42px;
			border: 1px solid rgb(189, 189, 189);
			border-radius: 4px; 
			padding-left: 10px;
		} 
		.ncr_input:focus{
         	box-shadow: rgb(217 173 43) 0px 0px 0px 1px inset, rgb(217 173 43 / 20%) 0px 0px 0px 4px;
         	border-color: #fcba03;
         }
         .ncr_input:placeholder{
         	color: rgb(189, 189, 189);
         }

		.ncr_btn{
			border-width: 1px;
		    border-style: solid;
		    border-color: rgb(217, 173, 43);
		    background-color: rgb(217, 173, 43);
		    opacity: 0.6;
		    box-shadow: none;
		    height: 42px;
		    font-weight: bold;
		    font-size: 14px;
		    border-radius: 6px;
		    position: relative;
		    min-height: inherit;
		    color: rgb(255, 255, 255);
		    text-align: center;
		    padding: 5px 18px;
		    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
		
			margin-left: 6px;
		}
		.ncr_btn:hover{
			background-color: rgb(179, 142, 34);
    		border-color: rgb(179, 142, 34);
		}
		.ncr_search{
			display: none;
			width: 430px;
			
			border: 1px solid rgb(189, 189, 189);
			border-radius: 4px; 
			padding: 10px;
			box-shadow: rgb(0 0 0 / 10%) 0px 4px 10px 2px;
			margin-top: 5px;
			font-size: 15px;
			color: rgb(136, 136, 136);
			
			position: absolute;
			top: 189px;
    		background-color: white;
		}
		.nc_people{
			border-radius: 4px; 
			border: 1px solid rgb(189, 189, 189);
			padding: 10px;
			background-color: 1px solid rgb(189, 189, 189);
			margin-top: 10px;
			height: 450px;
		}
		
		.picture_nc_modal{
            width: 20px;
            height:20px;
            border-radius:50%;
            background-color:rgb(255, 255, 255);
            content:"";
            background-size:cover;
            position:absolute;
            margin-top:5px;
		}
        .ncr_search ul{
            list-style: none;
            padding-top: 12px;
            padding-left: 16px;
        }
        .ncr_search li{
        	margin-left: 30px;
        	cursor: pointer;
        }
        .selected_nc{
            display: flex;
            height: 32px;
            margin: 8px 4px 0px 0px;
            padding: 5px 10px 5px 13px;
            border: 1px solid rgb(224, 221, 217);
            border-radius: 18px;
            background-color: rgb(255, 255, 255);
            font-size: 15px;
            -webkit-box-align: center;
            align-items: center;
            box-sizing: border-box;
            cursor:pointer;
            width: fit-content;
        }
        
	</style>
	
	<script src="js/jquery-3.6.0.min.js"></script>
	<script>
		$(function () {
			$("#nc").click(function () {
				$(".ncr_search").css('display', 'block');	
			});

	        //멤버선택
 	        $(document).on("click",".ncr_search>ul>div>li", function(){ 
	            var name = $(this).find(".nc_select_name").text();
	            var email = $(this).find(".nc_select_email").text();  
	            var select_member_id = $(this).parent().find(".member_id_nc_modal").text();
				var img = $(this).parent().find(".picture_nc_modal").css("background-image");
	            
				
	            $(".ncr_search").css('display', 'none');
	            $(this).parent().detach();
	                
	            var setPickedMember = "<div class='selected_nc' email='"+email+"'><div class='picture_nc_modal' style='"+img+"' ></div><span style='margin-left: 35px;'>"+name+"</span><div class='member_id_picked_nc' style='display: none;' value='"+select_member_id+"'></div></div>";
	            $(".nc_people").append(setPickedMember);
	            

	        }); 
	        
	        //멤버해제
	        $(document).on("click",".selected_nc", function(){
	        	var name = $(this).find("span").text();
	            var email = $(this).attr("email");  
	            var member_id = $(this).find(".member_id_picked_nc").attr("value");
	            var img = $(this).find(".picture_nc_modal").css('background-image');
	            
	            $(this).detach();
	            
	            var setPickedMember = "<div><div class='picture_nc_modal' style='background-image:"+img+"'></div><div class='member_id_nc_modal' style='display: none'>"+member_id+"</div><li><span style='color: black;'class='nc_select_name'>"+name+"</span><span class='nc_select_email'>"+email+"</span></li></div>";
	            $(".ncr_search ul").append(setPickedMember);

	        });	
	        
	        $(".ncr_btn").click(function() {
	        	var nc_list_str = "";
	        	var chattingRoom_id;
	        	$(".selected_nc > .member_id_picked_nc").each(function(index, item) {
		        	
		        	var member_id = $(item).attr('value');

		        	nc_list_str += member_id + "_";
	        	});

	        	$.ajax({
	        		type: 'post',
	        		url: 'Controller',
	        		data: {'command' : 'NewChattingRoomInsert', 'list' : nc_list_str},
	        		datatype: 'json',
	        		success: function(d){
	        			alert(d.nc_id);
	        		},
	        		error: function(r,s,e){
	        			alert("에러");
	        		}
	        	});
	        });
	        
            $(".ncr_input").keyup(function(key){
                $(this).attr("value",$(this).val());
                var search = $(this).val();
                $(".nc_select_name").each(function(index, item){
                	if($(item).text().includes(search)){
						$(item).parent().parent().css("display","block");                		
                	} else {
						$(item).parent().parent().css("display","none");
                	}
                });
            });
			
		});
	</script>
</head>
<body>
	<div id="new_chatting_room" class="overlay">
		<div>
			<form action="Controller?command=TodoInsert"  method="post">
				<div class="new_chatting_room_container">
					<button class="button_x_ncr" type="button">
						<svg viewBox="0 0 24 24" width="24px" height="24px" style="vertical-align: middle;">
							<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x"></path>
						</svg>
					</button>
				
					<header class="header_for_resetPW">
						<h2 class="h2_for_resetPW">채팅방 만들기</h2>
						<span class="span_for_resetPW">대화상대를 선택하여 그룹대화를 만들어보세요. 그룹대화는 '나'를 포함하여 최대 8명까지 선택할 수 있습니다.</span>
					</header>
					
					<div>
						<input type="text" id="nc" class="ncr_input" placeholder="이름을 입력하여 검색" />
						<button class="ncr_btn" type="button">대화하기</button>
					</div>
					<div class="ncr_search">
						<ul>
							<%
								ArrayList<PartnerListDto> pL = (ArrayList<PartnerListDto>)request.getAttribute("pL");
								for(int i = 0; i<pL.size(); i++){
							%>
						
								<div>
										<div class="picture_nc_modal" style="background-image:<%=pL.get(i).getPicture() %>"></div>
										<div class="member_id_nc_modal" style="display: none"><%=pL.get(i).getMember_id() %></div>
										<li>
											<span style="color: black;"class="nc_select_name"><%=pL.get(i).getName() %></span>
											<span class="nc_select_email"><%=pL.get(i).getEmail() %></span>
								         </li>
								</div>
							<%
								}
							%>
						</ul>
					</div>
					<div>
						<div class="nc_people">	
							<input type="hidden" class=""/>
							
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
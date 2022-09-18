<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일정</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    
<style>
       body, *{
            font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
            margin:0;
            padding:0;
            outline: none;
            box-sizing: border-box;
        }
        input, button{
            border:none;
        }
        .modal_sch{
            position:fixed;
            width:100%;
            height:100%;
            background-color:rgba(0, 0, 0, 0.5);
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
        }
        .modal_content_sch{
            background-color: #fff;
            margin:15% auto;
            width:80%;
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        }
        .closing_bnt{
            display:inline-block;
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            transition: fill 0.2s ease 0s;
            background-color: transparent;
            fill: rgb(136, 136, 136);
            border:none;
            min-width: inherit;
        }
        .closing_bnt:hover{
            fill:rgb(86, 86, 86);
        }
        .icon_color{
            fill:rgb(136, 136, 136);
        }
        #schedule{
            height: 100%;
            outline: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        #new_schedule{
            display: flex;
            flex-direction: column;
            -webkit-box-pack: justify;
            overflow: hidden;
            background-color: rgb(255, 255, 255);
            width: 580px;
            min-height: 397px;
            max-height: 680px;
            padding: 18px 4px 20px 22px;
            border-radius: 4px;
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        }
        #container1_sch{
            overflow: hidden;
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 23px;
            padding-right: 16px;
        }
        #container1_sch span{
            all: unset;
            font-size: 12px;
            font-weight: bold;
            line-height: 1.5;
            color: rgb(136, 136, 136);
        }
        #title_sch{
            overflow-wrap: break-word;
            flex: 0 0 auto;
            /* white-space: break-spaces !important; */
            height: auto;
            width: 505px;
            margin-left: 40px;
            font-size: 22px;
            color: rgb(34, 34, 34);
            line-height: 1.45;
            border: none;
            resize: none;
            align-items: center;
        }
        #title_sch::placeholder{
            color:rgb(197, 197, 197);
        }
        #date_sel_sch{
            display: flex;
            flex-flow: nowrap;
            -webkit-box-align: center;
            align-items: center;
            flex: 1 1 0%;
        }
        .date_sch{
            /* align-items: center; */
            margin-top: 2px;
            font-size: 16px;
            height: 24px;
            max-width:80px;
            padding: 0px 1px;
            line-height: 24px;
            background-color: transparent;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            color: rgb(34, 34, 34);
        }
        #start_date_sch{
            margin-left: 44px;
        }
        #container2_sch{
            border-bottom: 1px solid rgb(225, 225, 225);
            padding-bottom: 24px;
            padding-right:18px;
            margin-bottom: 28px;
            margin-right:30px;
        }
        .icon_sch{
            margin: 4px 10px 0px 8px;
            /* padding-top: 4px; */
        }
        .icon2_sch{
            width: 100%;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            font-size: 14px;
            border-radius: 4px;
            background-color: transparent;
            color:rgb(136, 136, 136);
            margin-right:30px;
        }
        #attendee_sch{
            display: flex;
            flex-direction: row;
            position: relative;
            min-height: 28px;
        }
        .picked_attendee{
        	flex-wrap:wrap;
        	display:flex;
        	padding-left: 40px;
        } 
        .selected_attendee{
            display: flex;
            height: 32px;
            margin: 8px 4px 0px 0px;
            padding: 5px 10px 5px 5px;
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
        #attendee_sel_sch{ /*참석자 추가*/
            height: 28px;
            padding-left: 4px;
            font-weight: normal;
            text-align: left;
            line-height: 28px;
        }
        .attendee_list{ /*누르면 열리는 협업공간 멤버 목록*/
            height:180px;
            width:240px;
            line-height: 2.3;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            position:absolute;
            font-size:14px;
            color:rgb(34, 34, 34);
            border:1px solid rgb(247,239,213);
            border-radius:4px;
            padding:1px;
            background-color:#fff;
            margin-left: 36px;
            margin-top:28px;
        }
        .attendee_list ul{
            list-style: none;
            padding-top: 12px;
            padding-left: 16px;
        }
        .attendee_list li{
            margin-left:27px;
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
        #location_sch{
            display: flex;
            flex-direction: row;
            margin-top: 14px;
            align-items: center;
        }
        #location_sch > textarea{
            border-radius: 4px;
            text-align: left;
            height: auto;
            padding-left: 4px;
            line-height: 1.5;
            resize:none;
            border:none;
            overflow:hidden;
        }
        #summary_sch{
            display: flex;
            flex-direction: row;
            margin-top: 14px;
            padding: 3px 3px 0px 0px;
            font-size: 14px;
        }
        #summary_sch > textarea{
            min-height: 50px;
            padding: 2px 4px;
            padding-left:2px;
            overflow-wrap: break-word;
            border:none;
            resize: none;
        }
        /* 위치 맞추기 */
        footer{
            display: flex;
            flex-direction: row;
            -webkit-box-pack: justify;
            justify-content: right;
            margin-top: 37px;
            padding-right: 20px;
        }
        .workspace_sel{
            box-sizing: border-box;
            width: 160px;
            border: 1px solid rgb(217, 173, 43);
            border-radius: 4px;
            background-color: rgb(255, 255, 255);
            color:rgb(217, 173, 43);
            padding:6px 0px 6px 15px;
            margin-right:12px;
            text-align: left;
        }
        .workspace_list{/* 누르면 열리는 공간 목록*/
            display:flex;
            justify-content: right;
            margin-right:90px;
        }
        .workspace_list ul{ /* 누르면 열리는 공간 목록*/
            position: absolute;
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
        }
        .workspace_list ul li:nth-child(1){
            color:rgb(136, 136, 136); 
            font-size: 10.5px; 
            pointer-events: none;
        }
        .workspace_list li{
            display:flex;
            flex-direction: row;
            align-items: center;
            cursor:pointer;
        }
        .workspace_list li span{
            margin-left:7px;
        }
        footer label{
            position:absolute;
            color: rgb(255, 255, 255);
            font-size: 12px;
            font-weight: 500;
            cursor: pointer;
            margin-right: 18px;
            margin-top: 9px;
        }
        .save_Bnt + label:hover, .save_Bnt:hover{
            background-color: rgb(179, 142, 34);
            border-color: rgb(179, 142, 34);
        }
        .save_Bnt{
            line-height: 1.5;
            border-radius: 4px;
            padding: 5px 30px;
            transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
            background-color: rgb(217, 173, 43);
            cursor: pointer;
        }
        .icon3_sch{
            display:inline-block;
            position:absolute;
            margin-right:83px;
            margin-top:5px;
            fill:rgb(217, 173, 43);
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
        .none{
            display:none;
            opacity:0;
        }
        .hidden{
            visibility:hidden;
            opacity:0;
        }

        .column{
            display:flex; 
            flex-direction:column;
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
            padding:10px;
            overflow:auto;
            line-height:2.5;
            display:none;
            z-index:200;
        }
        .closed{
            float:right;
            cursor:pointer;
        }




      
</style>

<script>
    $(document).ready(function () { 
        var x = "<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"

        //리스트에 멤버 뿌리기


        //참석자
        $("#attendee_sel_sch").on("focus", function (){
            $(this).attr("placeholder","참석자 이름, 이메일 주소 입력").css({color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow': "0 0 4px rgb(247,239,213)", 'padding-right':"200px", cursor:"text"});
            $(".attendee_list").removeClass("hidden"); //리스트 열기
            $(".attendee_list ul div").hover(function() {
                $(this).css("background-color", "rgb(242,242,242)");
            },  function() {
                $(this).css("background-color", "rgb(255, 255, 255)");
            });
        });
        
        //참석자 리스트 밖 영역 누르면 닫기
        $(document).click(function(e){
        	if(e.target.id != 'attendee_sel_sch') {   // 클릭한 곳의 id가 attendee_sel_sch가 아니면 아래 실행
		       	if($(".attendee_list").has(e.target).length==0) {//클릭한 곳이 attendee_list의 일부가 아니면??
		       			$("#attendee_sel_sch").attr("placeholder","참석자 추가").css({border:"none","box-shadow":"none", cursor:"pointer"});
		            $(".attendee_list").addClass("hidden");
		       	}
        	}
        });
        
        //클릭하면 아래에 추가
        $(document).on("click",".attendee_list ul div", function(){
            var name = $(this).find("li").text();//선택한 멤버 이름
            var _url = $(this).find(".picture_sch").css("background-image");
            var url = _url.substring(_url.indexOf('"')+1, _url.lastIndexOf('"')); //프로필사진주소
            var email = $(this).find('li').attr("email");  // 선택한 멤버 이메일
            $(".attendee_list").addClass("hidden");
            $(this).detach();//고른 멤버 리스트에서 삭제.
                
            var setPickedMember = "<div class='selected_attendee' email="+email+"><div class='picture_sch picture2_sch' style='background-image:url("+url+");'></div><span>"+name+"</span></div>";
            $(".picked_attendee").append(setPickedMember);
        });
    	
        //클릭하면 사라짐
        $(document).on("click",".selected_attendee", function(){
        	var name = $(this).find("span").text();//선택한 멤버 이름
            var _url = $(this).find(".picture_sch").css("background-image");
            var url = _url.substring(_url.indexOf('"')+1, _url.lastIndexOf('"')); //프로필사진주소
            var email = $(this).attr("email");  // 선택한 멤버 이메일
            $(this).detach();
            
            var setPickedMember = "<div><div class='picture_sch' style='background-image:url("+url+")'></div><li email='"+email+"'>"+name+"</li></div>";
            $(".attendee_list ul").append(setPickedMember); //다시 만들어진거 정렬 sort() (해야됨)
        });
        

        //장소
        $("#location_sch > textarea").focus(function() {
            $(this).attr("placeholder","회의 장소 / 모일 장소명 입력").css({color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow':"0 0 4px rgb(247,239,213)",'box-shadow':"0 0 0 4px rgb(247,239,213)", cursor:"text"});
        });

        //높이 자동 조절
        $("#location_sch > textarea").keydown(function(){
            var height1 = $(this).prop("scrollHeight");
            $(this).css("height", height1);
            
            var length = $(this).val().length;
            if(length >= 100){
                var alert_message = $(".alert").html(x+"장소는 최대 100자까지 입력할 수 있습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut() //3초후에 자동으로 닫힘
                    }, 3000);
            	//안내메세지 높이
	            var height2 = alert_message.prop("scrollHeight");
	            alert_message.css("height", height2);
                });
            }
        });

        //다시 줄어들기
        $("#location_sch > textarea").on("keyup", function(){
            $(this).css("height", "auto"); //다시 오토로 만들고
            var height = $(this).prop("scrollHeight"); //스크롤 길이 측정
            $(this).css("height", height); //스타일에 대입
        });

        $("#location_sch > textarea").blur(function () {
            $(this).attr("placeholder","장소 입력").css("border", "none").css("box-shadow","none");
        });

        //일정 설명
        $("#summary_sch > textarea").focus(function(){
            $(this).css("border", "1px solid rgb(217, 173, 43)").css("box-shadow", "0 0 4px rgb(247,239,213)").css("box-shadow", "0 0 0 4px rgb(247,239,213)");
        });
        $("#summary_sch > textarea").blur(function() {
            $(this).css("border", "none").css("box-shadow","none");
        });

        $(document).on("click", function(e){
            var ws = $(".workspace_sel").html();//클릭한곳의 ws이름 어케얻음?(안됨) 그냥 현재공간이 어딘지 서버같은데서 받아와야하나
            //alert(ws);

        	if($(e.target).is('.workspace_sel')) {   // 클릭한 곳의 class가 workspace_sel이면 리스트를 visible
                $(".workspace_list ul").removeClass("hidden");
                $(".workspace_sel").html("공간 검색").css("color", "rgb(136, 136, 136)");
                $(".icon3_sch svg").addClass("hidden");
            
            } else {//workspace_sel이 아닌 곳이면 리스트를 닫음
                    //if(현재공간==프라이빗) -> 노란색으로 else -> 초록색으로
                    if(ws=="프라이빗 공간") {
                        $(".workspace_sel").html(ws).css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
                        $(".save_Bnt").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
                        $(".icon3_sch svg").css("fill","rgb(217, 173, 43)");
                    } else {
                        $(".workspace_sel").html(ws).css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
                        $(".save_Bnt").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
                        $(".icon3_sch svg").css("fill","rgb(51, 132, 108)");
                    }
                    $(".icon3_sch svg").removeClass("hidden");
                    $(".workspace_list ul").addClass("hidden");
            }
        });

        //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
        $(".workspace_list > ul > li ").click(function(){ 
            var workspace = $(this).text();
            if(workspace=="프라이빗 공간"){ //프라이빗 선택하면 색 바뀜. 
               $(".workspace_sel").html("프라이빗 공간").css({color:"rgb(217, 173, 43)", border:"1px solid rgb(217, 173, 43)"});
               $(".save_Bnt").css({border:"1px solid rgb(217, 173, 43)", 'background-color':"rgb(217, 173, 43)"});
               $(".icon3_sch svg").css("fill","rgb(217, 173, 43)");
            } else{
                $(".workspace_sel").html(workspace).css({color:"rgb(51, 132, 108)", border:"1px solid rgb(51, 132, 108)"}); 
                $(".save_Bnt").css({border:"1px solid rgb(51, 132, 108)", 'background-color':"rgb(51, 132, 108)"});
                $(".icon3_sch svg").css("fill","rgb(51, 132, 108)");
            }
            $(".workspace_list ul").addClass("hidden");
            $(".icon3_sch svg").removeClass("hidden");
        });
        
        $(".workspace_list li").hover(function (){
            $(this).css("background-color", "rgb(242,242,242)");
        }, function(){
            $(this).css("background-color", "rgb(255, 255, 255)");
        });

        //모달 띄우기
        $("#schedule_bnt").click(function(){//일정버튼 누르면 뜨기
            $(".workspace_sel").html("프라이빗 공간").css("color","");
            $("#schedule").css({visibility:"visible", opacity:1});
            $(".icon3_sch svg").css({visibility:"visible", opacity:1});
        });

        //모달 닫기
        //저장버튼 누르면 닫힘
        $(".save_Bnt, label[for='save_Bnt']").click(function(){
            $("#schedule").css({visibility:"hidden", opacity:0});
            $(".icon3_sch svg").css({visibility:"hidden", opacity:0});

            //초기화
            $("#title_sch, #summary_sch textarea, #location_sch textarea").val("");
            $(".workspace_sel").html("현재공간이름");
            $("#start_date_sch, #finish_date_sch").datepicker("setDate", new Date());
        });

        //바깥부분 누르면 모달 닫히기
        $(document).on("click", function(e){ 
            if($("#schedule").is(e.target)) {
                $("#schedule").css({visibility:"hidden", opcity:0});
                $(".workspace_list ul").css({visibility:"hidden", opacity:0});
                $(".icon3_sch svg").css({visibility:"hidden", opacity:0});
                
                //초기화
                $("#title_sch, #summary_sch textarea, #location_sch textarea").val("");
                $(".workspace_sel").html("현재공간이름");
                $("#start_date_sch, #finish_date_sch").datepicker("setDate", new Date());
            }
        });

        //x누르면 종료
        $("#del_bnt_sch").click(function(){ 
            $("#schedule").css({visibility:"hidden", opacity:0});
            
            //초기화
            $("#title_sch, #summary_sch textarea, #location_sch textarea").val("");
            $(".workspace_sel").html("현재공간이름");
            $("#start_date_sch, #finish_date_sch").datepicker("setDate", new Date());
        });


    });

    

</script>

</head>
<body> 
<div class="alert"><svg viewBox="0 0 24 24" width="24px" height="24px" class="closed"><path fill="rgb(255,255,255)" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>
    <button id="schedule_bnt">일정</button>
    <div class="modal_sch" id="schedule">
        <section class="modal_content_sch" id="new_schedule">
            <header style="margin-left:2px;">
                <div id="container1_sch">
                    <span>새 일정</span>
                    <button id="del_bnt_sch" class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></button>
                </div>
                <div id="container2_sch">
                    <svg width="30px" height="30px" viewBox="0 0 24 24" style="margin-top: 1px; position:absolute;"><path fill="#e1e1e1" fill-rule="evenodd" d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg>
                    <textarea name="schedule_title" id="title_sch" maxlenght="100" rows="1" placeholder="오후 2시 팀 미팅 @김지원"></textarea>
                    
                    <!-- 캘린더 디자인 바꾸기 -->
                    <div id="date_sel_sch">
                        <input type="datepicker" id="startSche" class="date_sch"/><span style="margin-right:12px;">~</span>
                        <input type="datepicker" id="endSche" class="date_sch"/>
                    </div>
        <script>
        $(document).ready(function() {
            //제목 100자까지 입력 & 글자수 세기
            
            $('#title_sch').on('keydown', function() {
                var title_text = $(this).val()
                var height1 = $(this).prop("scrollHeight");
                $(this).css("height", height1);
                
                if(title_text.length > 100) {
                    $(this).val(title_text.substring(0, 100));
                    
                    //안내메세지 뜨기
                    var alert_message = $(".alert").html("일정 제목은 100자까지 입력할 수 있습니다.");
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
            $("#title_sch").on("keyup", function(){
                $(this).css("height", "auto"); //다시 오토로 만들고
                var height = $(this).prop("scrollHeight"); //스크롤 길이 측정
                $(this).css("height", height); //스타일에 대입
            });
            
            //안내창 x누르면 닫기
            $(".alert svg").on("click",function(){
                var alert_message = $(".alert")
                alert_message.fadeOut();
            });

            //datepicker
            $("#startSche, #endSche").datepicker({//datepicker호출
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
            $("#startSche, #endSche").datepicker("setDate", new Date()); 
            
            //finish가 start보다 전이면 start가 선택한 finish 날짜로 변함
            $('#startSche').datepicker("option", "onClose", function ( selectedDate ) {
                $("#endSche").datepicker( "option", "minDate", selectedDate );
            });
                            
        });
                 
        </script>
                </div>
            </header>

            <div>
                <div id="attendee_sch">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M8,13 C8.44380952,13 8.97251701,13.042449 9.53767844,13.1272778 L9.96762769,13.1988446 L10.1863094,13.2405857 L10.1863094,13.2405857 L10.6282484,13.335979 C12.6995674,13.8181974 14.8465478,14.8190402 14.9921524,16.3355444 L15,16.5 L15,19 L1,19 L1,16.5 C1,14.8911905 3.22645692,13.8354195 5.37175157,13.335979 L5.81369061,13.2405857 L6.03237231,13.1988446 L6.03237231,13.1988446 L6.46232156,13.1272778 C6.95683781,13.0530526 7.42344401,13.0112744 7.82968645,13.0019897 L8,13 Z M16,13 C16.4438095,13 16.972517,13.042449 17.5376784,13.1272778 L17.9676277,13.1988446 C18.0401728,13.2120964 18.1130982,13.2260102 18.1863094,13.2405857 L18.6282484,13.335979 C20.6995674,13.8181974 22.8465478,14.8190402 22.9921524,16.3355444 L23,16.5 L23,19 L17,19 L17,16.5 C17,15.02 16.19,13.89 15.03,13.05 C15.38,13.02 15.71,13 16,13 Z M8,15 C6.97965547,15 5.491506,15.2840212 4.36930568,15.7330936 C3.80433548,15.9591785 3.3721832,16.2096374 3.12198987,16.4403759 L3.02415633,16.5274912 C3.00685247,16.5397253 3.00191646,16.5362153 3.00052995,16.5201426 L3,17 L13,17 L12.99947,16.5201426 C12.9980835,16.5362153 12.9931475,16.5397253 12.9758437,16.5274912 L12.8780101,16.4403759 C12.6278168,16.2096374 12.1956645,15.9591785 11.6306943,15.7330936 C10.508494,15.2840212 9.02034453,15 8,15 Z M8.00584307,4.5 C9.9457429,4.5 11.5,6.06333333 11.5,8 C11.5,9.93666667 9.9457429,11.5 8.00584307,11.5 C6.06594324,11.5 4.5,9.93666667 4.5,8 C4.5,6.06333333 6.06594324,4.5 8.00584307,4.5 Z M16,5 C17.66,5 18.99,6.34 18.99,8 C18.99,9.66 17.66,11 16,11 C14.34,11 13,9.66 13,8 C13,6.34 14.34,5 16,5 Z M8.00584307,6.5 C7.16976661,6.5 6.5,7.16865034 6.5,8 C6.5,8.83134966 7.16976661,9.5 8.00584307,9.5 C8.83761519,9.5 9.5,8.83565768 9.5,8 C9.5,7.16434232 8.83761519,6.5 8.00584307,6.5 Z" color="#75726f"></path></svg></div>
                    
                    <input type="text" id="attendee_sel_sch" class="icon2_sch" placeholder="참석자 추가"/>
                    
                    <div class="attendee_list hidden"><!-- 참석자 목록 -->
                        <ul>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강지현</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">이정민</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">김유라</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강태안</li></div>
                        </ul>
                    </div>
                </div>
                
                <!-- 선택된 멤버들 div -->
                <div class="row picked_attendee"></div>

                <div id="location_sch">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M12,1.5 C16.1464286,1.5 19.5,4.7865 19.5,8.85 C19.5,10.8625 18.5003779,13.2248677 17.2310166,15.4134123 L16.8942399,15.9800496 L16.548105,16.5367347 L16.1954912,17.0814017 L15.8392782,17.6119845 L15.4823453,18.1264172 L15.127572,18.6226337 L14.7778378,19.0985681 L14.436022,19.5521542 L14.1050043,19.9813261 L13.6350226,20.5747879 L13.0730483,21.2613379 L12.6060961,21.8130427 L12,22.5 L11.5845481,22.0331633 L11.1737453,21.5550789 L10.6564026,20.9338855 L10.2123361,20.3840178 L9.89499574,19.9813261 L9.56397797,19.5521542 L9.04810496,18.8632653 L8.60666295,18.2522598 L8.60666295,18.2522598 L8.16072178,17.6119845 L7.80450875,17.0814017 L7.45189504,16.5367347 L7.10576012,15.9800496 L6.76898343,15.4134123 C5.49962207,13.2248677 4.5,10.8625 4.5,8.85 C4.5,4.7865 7.85357143,1.5 12,1.5 Z M12,3.5 C8.94919823,3.5 6.5,5.90021427 6.5,8.85 C6.5,9.7886792 6.82202538,10.9901559 7.44497146,12.3757437 C8.03843625,13.6957578 8.87719392,15.1262865 9.89733893,16.6080471 C10.5245873,17.5191253 11.1899804,18.4062371 11.8628789,19.2460749 L11.999,19.414 L12.1371211,19.2460749 C12.641795,18.6161965 13.1422471,17.9597266 13.6255514,17.2864979 L14.1026611,16.6080471 C15.1228061,15.1262865 15.9615637,13.6957578 16.5550285,12.3757437 C17.1779746,10.9901559 17.5,9.7886792 17.5,8.85 C17.5,5.90021427 15.0508018,3.5 12,3.5 Z M12,6.5 C13.38,6.5 14.5,7.62 14.5,9 C14.5,10.38 13.38,11.5 12,11.5 C10.62,11.5 9.5,10.38 9.5,9 C9.5,7.62 10.62,6.5 12,6.5 Z" color="#75726f"></path></svg></div>
                    <textarea rows="1" class="icon2_sch" placeholder="장소 입력"></textarea>
                </div>

                <div id="summary_sch">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M18.5,1.5 C19.6045695,1.5 20.5,2.3954305 20.5,3.5 L20.5,20.5 C20.5,21.6045695 19.6045695,22.5 18.5,22.5 L5.5,22.5 C4.3954305,22.5 3.5,21.6045695 3.5,20.5 L3.5,3.5 C3.5,2.3954305 4.3954305,1.5 5.5,1.5 L18.5,1.5 Z M18.5,3.5 L5.5,3.5 L5.5,20.5 L18.5,20.5 L18.5,3.5 Z M7.5,12.5 L7.5,10.5 L16.5,10.5 L16.5,12.5 L7.5,12.5 Z M7.5,8.5 L7.5,6.5 L16.5,6.5 L16.5,8.5 L7.5,8.5 Z" color="#75726f"></path></svg></div>
                    <textarea class="icon2_sch" placeholder="일정에 대한 설명"></textarea>
                </div>
            </div>
            
            <footer>
                <button class="workspace_sel">프라이빗 공간</button>
                <!-- 클릭하면 뜸 -->
                <label for="save_Bnt">저장</label>
                <button class="save_Bnt"></button>
                <div class="icon3_sch"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg></div>
            </footer>
            <div class="workspace_list">
                <ul class="left-bar icon_color hidden">
                    <li>공간 검색</li>
                    <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>프로젝트</span></li>
                    <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>코드공유 공간</span></li>
                    <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg><span>프라이빗 공간</span></li>
                    <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"></path></svg><span>모두의 공간</span></li>
                    <li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>Test</span></li>
                </ul>
            </div>



        </section>   
    </div>


</body>
</html>
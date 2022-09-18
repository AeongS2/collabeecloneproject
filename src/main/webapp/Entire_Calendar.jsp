<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
   <!--  <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script> -->
    <script src="js/jquery-3.6.0.min.js"></script>
    <link href='main.css' rel='stylesheet'/>
    <script src='main.js'></script>
    
    <script>
    $(function() {
    	//calendar element 취득
        var calendarEl = document.getElementById('calendar');
    	//calendar 생성하기
        var calendar = new FullCalendar.Calendar(calendarEl, {
	        initialView:'dayGridMonth', //초기 로드될때 보이는 캘린더 
	        //initialDate: "2022-02-02" 초기날짜 설정 (설정 안하묜 오늘날짜)
        	expandRows : true, //화면에 맞게 높이 재설정
        	slotMinTime:"8:00", //day 캘린더에서 시작 시간
        	slotmaxTime:"20:00", //종료시간 
            headerToolbar: {
                left: 'prev title next today dayGridMonth listMonth',
                center:"",
                right: ""
            },
            //height:"700px", 안되는디;
			editable:true,//수정가능
			dayMaxEvents:true,//일정 오버되면 높이 제한
			locale:"ko",
			eventAdd:function(obj){
				//일정 추가되면 할거
			},
			eventChange:function(obj) {
				//일정 수정되면 할거
			},
			eventRempve:function(obj) {
				//일정 삭제되면 할거
			},
			select : function(arg) {
				//드래그로 일정 만들기??
				var title = prompt("입력할 일정:");
				// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가
				if(title) {
					calendar.addEvent({
						title:title,
						start:arg.start,
						end:arg.end,
						allDay:arg.allDay,
						color: "rgb(217, 173, 43)"
					})
				}
				calendar.unselect()	
			},
			eventClick:function(arg){
				//있는 일정 클릭시
				location.href="schedule.jsp";
				calendar.getEventSources();
			},
            //eventlimit: true,
            //eventlimit: true  allow more when too many events
            buttonText:{
                today:"오늘"
            },
            
            events: [ 
            	/*
            	JSON feed
            	{
					url: '/myfeed.php',
					color: 'yellow',   // an option!
					textColor: 'black' // an option!
					
				}
            	
            	*/
                {            
                    title: 'All Day Event',     //이벤트에 표시될 제목       
                    start: '2022-07-01',        //시작일  
                    end: '2022-07-10',
                    color:"rgb(136,136,136)"
                    //종료일
                    // allDay:t/f 일정이 하루전체인지 여부
                    // 또 종일여부를 결정짓는 변수인 allDay라는 변수가 있는데 이게 아주 가관이었다.
                    // 2021.09.29~2021.09.30로 구간이벤트로 잡혀있으면 종료일자는 당연히 2021.09.30인데
                    // 종일이벤트로 변경하면 2021.10.01로 수정해줘야 정상적으로 화면에 출력됐다
                },          
                {            
                    title: 'Long Event',            
                    start: '2022-07-07',            
                    end: '2022-07-11',
                    color:"rgb(217, 173, 43)"
                }
            ]

        });
    	//calendar 렌더링
        calendar.render();
    	
        $(".fc .fc-daygrid-day-frame").click(function (){ //날짜 누르면 일정창 켜짐
            $("#schedule").css("display","flex");
        });
    	
        $("#posting_bnt").click(function(){
        	location.href="Document.jsp";
        });
    
    
    });
</script>

    <title>전체 캘린더</title>
<!-- 일정 모달 -->
<style>
    *{
        box-sizing: border-box;
        font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
        margin:0;
        padding:0;
        outline: none;

    }
    input, button{
            border:none;
    }
    .modal_c{
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 1300;
        position: fixed;
        transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
        background-color: transparent;
        background-color: cadetblue;
    }
    .modal_content_c{
        top: 348.802px;
        left: 183.319px;
        transform: scale(1, 1) translateZ(0px);
        transition: opacity 331ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, transform 220ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
        background-color: rgb(255, 255, 255);
        padding: 16px 4px 16px 20px;
        width: 428px;
        border-radius: 4px;
        min-height: 380px;
        display: flex;
        flex-direction: column;
        -webkit-box-pack: justify;
        justify-content: space-between;
        box-shadow:0px 5px 5px -3px rgb(0 0 0 / 20%), 0px 8px 10px 1px rgb(0 0 0 / 14%), 0px 3px 14px 2px rgb(0 0 0 / 12%)
    }
    #schedule_c{
    }
    #schedule_bnt_c{
        min-width: 80px;
        height: 23px;
        padding: 0px 5px;
        padding: 5px 18px;
        margin-right: 8px;
        line-height: 23px;
        position: relative;
        min-height: inherit;
        color: rgb(255, 255, 255);
        font-size: 12px;
        font-weight: 500;
        line-height: 1.3;
        border-radius: 4px;
        text-align: center;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
        border-width: 1px solid rgb(217, 173, 43);
        background-color: rgb(217, 173, 43);
        cursor: pointer;
        width: auto;
        box-shadow: none;
    }
    #todo_bnt_c{
        min-width: 80px;
        height: 23px;
        padding: 0px 5px;
        padding: 5px 18px;
        line-height: 23px;
        position: relative;
        min-height: inherit;
        font-size: 12px;
        font-weight: 500;
        line-height: 1.5;
        border-radius: 4px;
        text-align: center;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
        cursor: pointer;
        opacity: 1;
        width: auto;
        box-shadow: none;
        color: rgb(136, 136, 136);
        background-color: rgb(247, 246, 245);
    }
    .none{
        display:none;
    }
        

</style>
    


<!-- 페이지 구성요소 -->
<style>
    header{
        display:flex;
        justify-content: space-between;
        text-align:center;
        align-items: center;
    }
    #calendar_bnt{
        font-size: 22px;
        font-weight: bold;
        color: rgb(34, 34, 34);
        background-color: transparent;
        cursor: pointer;
        border:none;
        margin:20px 20px 20px 50px;
    }
    a{
        text-decoration: none;
        color: rgb(34, 34, 34);
    }
    #bnt1_cal{
        display:flex;
    }
    #searchbar::placeholder{
        color: rgb(193, 193, 193);
    }
    #searchbar { /*상단 검색창   클릭하면 길어지면서 문서작성 버튼 없어짐 */
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
        width:269px;
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
        margin-right:250px;
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
    .bnt_base{/*아이콘 기본스타일*/
        height: 28px;
        min-width: 28px;
        border: 1px solid rgb(224, 221, 217);
        border-radius: 6px;
        background-color: transparent;
    }
    .bnt_base:not(#today_bnt):hover {
        background-color:rgb(247, 246, 245) !important;
    }
    /* #menubar_cal{
        display: flex;
        align-items: center;
    } */
    .month_bnt{/*달 넘어가는 버튼 스타일*/
        transition: fill 0.2s ease 0s;
        cursor: pointer;
        pointer-events: auto;
        width: auto;
        text-decoration: none;
        border-color: rgb(224, 221, 217) !important;
        display:flex;
    }
    .icon_color{
        fill: rgb(136, 136, 136);
    }
    #yyyymm_cal{/*연도 월*/
        display:inline-block;
        width:100px;
        margin: 0px 6px;
        color:rgb(34, 34, 34);
        font-size:15px;
        font-weight:bold;
        text-align:center;
        display:flex;
    }
    #today_bnt{ /*오늘로 이동 버튼*/
        color: rgb(193, 193, 193);
        font-size: 13px;
        padding: 0px 8px !important;
        margin-left: 8px;
    }
    #cal_view{
        position: relative;
        z-index: 1;
        width: 40px;
        border-radius: 6px 0px 0px 6px;
        padding-left:9px;
        margin-left:8px;
    }
    #list_view{ /*리스트로 보기*/
        position: relative;
        z-index: 1;
        width: 40px;
        border-radius: 0px 6px 6px 0px;
        padding-left: 6px;
    }
    #in_cal_view{/*달력, 리스트 버튼 보고있을때 노란색되는거 제이쿼리*/
        min-width: inherit;
        min-height: inherit;
        padding-left: 0px;
        padding-right: 0px;
        transition: fill 0.2s ease 0s;
        cursor: pointer;
        pointer-events: auto;
        width: auto;
        background-color: rgba(217, 173, 43, 0.1);
        text-decoration: none;
        border-color: rgba(217, 173, 43, 0.5) !important;
        z-index: 2 !important;
    }
    #myschedule{ /* 체크박스 */ 
        display:none;
        background-color: #fff;
        cursor: pointer;
        align-items: center;
    }
    #my_sche_view{ /*내 일정 보기*/
        color: rgb(34, 34, 34);
        font-size: 13px;
        cursor:pointer;
    }
    #bnt2_cal > label{
        padding-bottom:4px;
        display:inline-block;
    }
    #my_sche_view::after{
        display:inline-block;
        width: 1px;
        height: 20px;
        margin: 0px 0px 0px 12px;
        background: rgb(225, 225, 225);
        content: "";
    }
    .calendar_checkbox{
        margin-top:3px;
        cursor:pointer;
        width:26px;
    }
    .calendar_dateFilter{ /*시작~종료일 필터*/
        display:flex;
        justify-content:space-between;
        align-items: center;
        width: 168px;
        margin-left: 12px;
        padding: 3px 6px 3px 8px;
        border-radius: 6px;
        border: 1px solid rgb(224, 221, 217);
        background-color: rgb(255, 255, 255);
        color: rgb(34, 34, 34);
        cursor: pointer;
        font-size: 13px;
    }
    .picked_date{
        position:absolute;
        display:flex;
        flex-direction:row;
        align-items:center;
        font-size:13px;
        background-color:rgb(255,255,255);
        margin:3px 0px 3px 20px; 
        cursor:pointer;
    }
    .picked_date svg{
        margin-left: 45px;
    }
    .menubar_cal{
        display:flex;
        justify-content:right;
        flex-direction: row;
        -webkit-box-align: center;
        align-items: center;
        margin-top:10px;
        margin-left:50px;
        margin-right:20px;
    }
  
    .row{
        display:flex;
        flex-direction:row;
    }
    .column{
        display:flex;
        flex-direction:column;
    }


</style>



<!-- 캘린더 -->
<style>
    #fc-dom-1{
        font-size:18px;
    }
    #calendar{
        display: inline-block;
        width:80%;
        /* height:calc(100vh - 68px); */
    }
    h2{
        display:inline-block;
    }
 
    /* 내 일정 보기랑 타이틀 일렬로 맞추기 */
	.fc .fc-toolbar.fc-header-toolbar{
		background-color:transparent;
	}

    

</style>
<script>
    $(function(){
        $("#my_sche_view, .calendar_checkbox").click(function(){
            var color = $(".calendar_checkbox path").css("fill");
            if(color=="rgb(189, 186, 183)"){
                $(".calendar_checkbox").html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='#D9AD2B' fill-rule='evenodd' d='M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M16.59,7.58 L10,14.17 L7.41,11.59 L6,13 L10,17 L18,9 L16.59,7.58 Z'></path></svg>");
            } else if(color=="rgb(217, 173, 43)"){
               $(".calendar_checkbox").html("<svg width='20px' height='20px' viewBox='0 0 24 24'><path fill='#bdbab7' fill-rule='evenodd' d='M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M17,5 L7,5 C5.9456382,5 5.08183488,5.81587779 5.00548574,6.85073766 L5,7 L5,17 C5,18.0543618 5.81587779,18.9181651 6.85073766,18.9945143 L7,19 L17,19 C18.0543618,19 18.9181651,18.1841222 18.9945143,17.1492623 L19,17 L19,7 C19,5.9456382 18.1841222,5.08183488 17.1492623,5.00548574 L17,5 Z'></path></svg>");
            }

        });
    });
    
</script>
</head>
<body>
 

<!-- 페이지 구성요소 -->
<!-- <div style="background-color:silver; width:234px; height:1500px; float:left; display:fixed;">사이드메뉴바</div> -->
<div class="row">
<%@ include file="../WEB-INF/include/include_HomeSidebar.jspf"%>
<div>
<header>
    <div id="title_cal">
        <button id="calendar_bnt"><a href="">전체 캘린더</a></button>
    </div>
    <!--검색창과 문서작성 버튼-->
    <div id="bnt1_cal">
        <div id="search_icon" class="bnt_base"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
        <input type ="text" id=searchbar placeholder="검색"/>
        <button id="posting_bnt">
            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
            <span>문서 작성</span>
        </button>
    </div>
</header>

	<div class="menubar_cal">
    <div id="bnt2_cal" class="menubar_cal">
        <div class="calendar_checkbox"><svg width="20px" height="20px" viewBox="0 0 24 24"><path fill="#bdbab7" fill-rule="evenodd" d="M17,3 C19.209139,3 21,4.790861 21,7 L21,17 C21,19.209139 19.209139,21 17,21 L7,21 C4.790861,21 3,19.209139 3,17 L3,7 C3,4.790861 4.790861,3 7,3 L17,3 Z M17,5 L7,5 C5.9456382,5 5.08183488,5.81587779 5.00548574,6.85073766 L5,7 L5,17 C5,18.0543618 5.81587779,18.9181651 6.85073766,18.9945143 L7,19 L17,19 C18.0543618,19 18.9181651,18.1841222 18.9945143,17.1492623 L19,17 L19,7 C19,5.9456382 18.1841222,5.08183488 17.1492623,5.00548574 L17,5 Z"></path></svg></div>
        <label for="myschedule">
            <input type="checkbox" id="myschedule" readonly/>
            <span id="my_sche_view">내 일정만 보기</span>
            
        </label>
        <div id="date_filter">
            <label><div class="picked_date">시작일 ~ 종료일<svg width="8" height="4" viewBox="0 0 8 4"><path d="M0 0l4 4 4-4z" fill="#222222" fill-rule="evenodd"></path></svg></div></label>
            <input type="datepicker" id="start_date" class="calendar_dateFilter"/>
            <input type="datepicker" id="finish_date" class="calendar_dateFilter"/>
          <!--   <script>
                $(function(){ //2개 받아야함.(해야됨)
                    //datepicker
                    $(".calendar_dateFilter").datepicker({
                        dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
                        ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                        ,dayNamesMin:["일","월","화","수","목","금","토"]
                        , showButtonPanel:true, currentText:"초기화", closeText:"적용"
                        ,numberOfMonths:2, showButtonPanel:true
                        ,onClose:function(selectedDate){
                            $("#finish").datepicker("option","minDate",selectedDate);
                        }
                    });
                    $("#start_date, #finish_date").datepicker("setDate", new Date());
                    
                    var dateFormat = "yy.m.d"
                    ,from = $("#start_date").datepicker({
                        changeMonth:true, numberOfMonths:2 }).on("change", function(){
                        to.datepicker("option", "minDate", getDate(this));
                    })
                    ,to = $("#finish_date").datepicker({
                        changeMonth:true, numberOfMonth:2 }).on("change", function(){
                        from.datepicker("option", "maxDate", getDate(this));
                    });
                    
                    function getDate(element) {
                        var date;
                        try{
                            date = $.datepicker.parseDate(dateFormat, element.value);
                        } catch(error){
                            date = null;
                        }
                        return date;
                    }
                    https://nowonbun.tistory.com/368
                    

                    $("#start_date")

                });

            </script> -->
            <div></div>
        </div>    
    </div>    
	</div>

	<!-- 캘린더 -->
    <section class="row" style="justify-content: space-between;">
        <div id="calendar"></div>
    	<%@ include file="../WEB-INF/include/include_rightBar.jspf"%>
    </section>
</div>
</div>    
</body>
</html>
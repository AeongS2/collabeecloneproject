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
        $(function(){
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
                location.href="document_api.html";
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

<div id="setting_price">

    <div class="left-bar">
		<div class="left-top">
			<div class="sidebar_top">
				<svg width="112" height="27" viewBox="0 0 800 188" version="1.1"><title>Collabee</title><g id="collabee" stroke="none" stroke-width="1" fill="#d9ad2b" fill-rule="evenodd"><g id="collabee_logo" transform="translate(-2199.000000, -306.000000)" fill="#d9ad2b"><g id="Group-2" transform="translate(1900.000000, 0.000000)"><path d="M394.31736,411.192678 L417.772183,434.563735 C431.409272,448.147302 431.409272,470.20286 417.772183,483.79636 C404.271464,497.265165 382.447985,497.399853 368.790516,484.200424 L368.37917,483.79636 L330.119875,445.663888 C335.495266,451.009544 355.591986,449.437092 369.215732,436.194694 L369.62657,435.789832 L394.31736,411.192678 Z M958.789528,358 C972.762337,358 983.522145,361.558521 990.919865,368.785622 C998.141831,375.841021 1001.80953,385.861327 1001.99287,398.676013 L1002,400.068742 L1001.96144,404.945938 L1001.93,407.761854 C1000.22947,407.918136 997.711771,408.003156 994.376916,408.016913 C994.020503,408.018384 993.490522,408.019787 992.809816,408.021116 L992.333934,408.021991 C991.919175,408.022711 991.459464,408.023407 990.958717,408.024078 L990.338374,408.024872 C990.018605,408.025262 989.684627,408.025644 989.337286,408.026016 L988.625039,408.026747 C988.503445,408.026867 988.380429,408.026986 988.256022,408.027103 L987.287029,408.027973 C986.789723,408.028398 986.273584,408.028807 985.740315,408.029199 L984.651445,408.029961 C984.096097,408.03033 983.524756,408.030683 982.939128,408.031019 L981.141092,408.031971 L980.833804,408.032119 L980.833804,408.032119 L979.267568,408.032815 C979.055584,408.032903 978.842391,408.032988 978.628053,408.033071 L976.005067,408.03397 L975.670671,408.034068 L975.670671,408.034068 L971.917492,408.034921 C971.686564,408.03496 971.455123,408.034997 971.223231,408.035031 L961.392174,408.035042 L961.044317,408.034987 L961.044317,408.034987 L957.274365,408.034114 C957.049716,408.034046 956.825879,408.033976 956.602919,408.033902 L954.621625,408.033164 C954.404488,408.033073 954.188416,408.032979 953.973472,408.032883 L952.697858,408.03227 C952.487681,408.032162 952.278758,408.032051 952.071154,408.031937 L950.841848,408.031218 C950.639768,408.031093 950.439133,408.030964 950.240004,408.030832 L949.063829,408.030005 C948.225368,408.029379 947.417791,408.028694 946.646288,408.027951 L945.738132,408.027029 C943.364331,408.024495 941.381196,408.021342 939.958826,408.01751 C940.022181,411.542318 941.702566,415.234262 945.378473,417.846532 C949.05438,420.458802 955.681971,423.549841 963.527798,423.549841 C971.79489,423.549841 978.541852,422.700011 983.495419,421.057128 C987.517595,419.723146 991.333122,417.875032 994.604438,415.78136 L994.604859,434.581126 C992.937836,435.593133 990.896711,436.632681 988.415131,437.615306 C982.727235,439.867528 973.650163,442 964.823689,442 C955.997215,442 946.949276,440.787809 939.956585,437.934714 C932.805324,435.019982 924.735595,430.268372 920.456361,424.131336 C916.13993,417.937166 914,410.275826 914,401.224578 C914,387.29112 917.91971,376.500379 925.832175,369.054325 C933.690649,361.656092 944.723719,358 958.789528,358 Z M1055.78953,358 C1069.76234,358 1080.52214,361.558521 1087.91987,368.785622 C1095.14183,375.841021 1098.80953,385.861327 1098.99287,398.676013 L1099,400.068742 L1098.96144,404.945938 L1098.93,407.761854 C1097.22947,407.918136 1094.71177,408.003156 1091.37692,408.016913 C1091.0205,408.018384 1090.49052,408.019787 1089.80982,408.021116 L1089.33393,408.021991 C1088.91918,408.022711 1088.45946,408.023407 1087.95872,408.024078 L1087.33837,408.024872 C1087.0186,408.025262 1086.68463,408.025644 1086.33729,408.026016 L1085.62504,408.026747 C1085.50344,408.026867 1085.38043,408.026986 1085.25602,408.027103 L1084.28703,408.027973 C1083.78972,408.028398 1083.27358,408.028807 1082.74032,408.029199 L1081.65145,408.029961 C1081.0961,408.03033 1080.52476,408.030683 1079.93913,408.031019 L1078.14109,408.031971 L1077.8338,408.032119 L1077.8338,408.032119 L1076.26757,408.032815 C1076.05558,408.032903 1075.84239,408.032988 1075.62805,408.033071 L1073.00507,408.03397 L1072.67067,408.034068 L1072.67067,408.034068 L1068.91749,408.034921 C1068.68656,408.03496 1068.45512,408.034997 1068.22323,408.035031 L1058.39217,408.035042 L1058.04432,408.034987 L1058.04432,408.034987 L1054.27436,408.034114 C1054.04972,408.034046 1053.82588,408.033976 1053.60292,408.033902 L1051.62163,408.033164 C1051.40449,408.033073 1051.18842,408.032979 1050.97347,408.032883 L1049.69786,408.03227 C1049.48768,408.032162 1049.27876,408.032051 1049.07115,408.031937 L1047.84185,408.031218 C1047.63977,408.031093 1047.43913,408.030964 1047.24,408.030832 L1046.06383,408.030005 C1045.22537,408.029379 1044.41779,408.028694 1043.64629,408.027951 L1042.73813,408.027029 C1040.36433,408.024495 1038.3812,408.021342 1036.95883,408.01751 C1037.02218,411.542318 1038.70257,415.234262 1042.37847,417.846532 C1046.05438,420.458802 1052.68197,423.549841 1060.5278,423.549841 C1068.79489,423.549841 1075.54185,422.700011 1080.49542,421.057128 C1084.5176,419.723146 1088.33312,417.875032 1091.60444,415.78136 L1091.60486,434.581126 C1089.93784,435.593133 1087.89671,436.632681 1085.41513,437.615306 C1079.72724,439.867528 1070.65016,442 1061.82369,442 C1052.99721,442 1043.94928,440.787809 1036.95658,437.934714 C1029.80532,435.019982 1021.7356,430.268372 1017.45636,424.131336 C1013.13993,417.937166 1011,410.275826 1011,401.224578 C1011,387.29112 1014.91971,376.500379 1022.83217,369.054325 C1030.69065,361.656092 1041.72372,358 1055.78953,358 Z M838.290203,339 L838.288276,364.559952 L838.874395,364.200045 C840.805068,363.047969 842.879018,362.056406 845.094001,361.225292 L846.213235,360.823106 L847.211798,360.493128 C852.484469,358.819822 858.1,357.986006 864.051579,357.986006 C872.040986,357.986006 879.237636,359.764568 885.596484,363.331581 C891.978042,366.911333 896.994379,371.918 900.601213,378.309028 C904.20455,384.691148 906,391.986392 906,400.145571 C906,408.407933 904.204349,415.730693 900.596169,422.066232 C896.982907,428.414924 891.956395,433.348879 885.56268,436.824953 C879.210543,440.278422 872.026156,442 864.051579,442 C857.452369,442 851.716345,441.105452 846.845706,439.291702 C844.125935,438.278902 841.469434,436.907542 838.876688,435.181457 L837.907397,434.517556 L837.67136,434.348687 L837.673112,440 L813,440 L813,339 L838.290203,339 Z M762.228768,358 C768.80678,358 774.46643,358.553722 779.221413,359.675087 C784.113902,360.828069 788.200743,362.628219 791.455785,365.098567 C794.807784,367.640016 797.267738,370.936354 798.799986,374.933093 C800.176231,378.524376 800.899942,382.674684 800.99032,387.379044 L801,388.3956 L801,440 L777.861413,440 L777.860877,435.320792 L777.635758,435.452876 C775.666824,436.569192 773.38088,437.646087 770.700931,438.769555 L768.811734,439.543783 C764.46089,441.287981 759.601097,442 753.495282,442 L752.592885,441.997228 L750.886471,441.974001 C746.775313,441.88472 743.780251,441.552583 740.878265,440.781092 C736.936723,439.730138 733.491796,438.155705 730.557742,436.047153 C727.54528,433.882252 725.189409,431.176574 723.520106,427.955626 C721.832818,424.706444 721,420.961464 721,416.758128 C721,412.16806 722.068588,408.100907 724.221479,404.624065 C726.358833,401.169663 729.512016,398.350325 733.622011,396.16964 C737.587969,394.063845 742.441623,392.530495 748.185852,391.546555 C753.438778,390.646303 759.448905,390.168984 766.222007,390.109343 L767.685066,390.102953 L777.860877,390.101587 C777.846597,388.254385 777.766522,386.926757 777.62065,386.118702 C777.401843,384.906619 776.724942,383.398904 775.734159,382.604347 C774.743376,381.80979 773.569277,380.944377 770.72613,380.108291 C767.882982,379.272205 764.183274,378.804101 760.581054,378.804101 C756.978833,378.804101 753.975156,379.163396 750.67578,379.828022 C747.376403,380.492649 741.086683,382.580122 737.826344,384.157673 C735.652785,385.209373 733.210043,386.483274 730.498119,387.979376 L730.671609,364.934662 L733.286091,363.818251 L734.956755,363.130281 C737.445056,362.127557 739.825941,361.270624 741.724334,360.751904 C744.696726,359.939318 747.920628,359.279204 751.392657,358.771412 C754.89907,358.256896 758.511398,358 762.228768,358 Z M588.5,358 C597.610493,358 605.669636,359.69868 612.647815,363.118631 C619.702382,366.574517 625.214658,371.493118 629.130086,377.844946 C633.047866,384.199054 635,391.605065 635,399.99929 C635,408.593202 633.050102,416.100867 629.130423,422.459592 C625.208498,428.823499 619.683812,433.697719 612.614904,437.049071 C605.643787,440.357006 597.596467,442 588.5,442 C579.402293,442 571.354932,440.357074 564.384361,437.049399 C557.314972,433.69709 551.789438,428.822464 547.86832,422.459866 C543.949029,416.10177 542,408.594492 542,399.99929 C542,391.610492 543.92197,384.211023 547.781185,377.861805 C551.645398,371.500283 557.166612,366.574052 564.280213,363.114792 C571.308748,359.697636 579.390814,358 588.5,358 Z M500.553774,358 C512.585353,358 522.324314,360.376937 529.730212,365.206167 L529.730212,365.206167 L531.074122,366.082503 L531.074122,388.82923 L526.480214,385.601196 C520.326242,381.276942 512.374029,379.088557 502.558661,379.088557 C495.284852,379.088557 489.649129,380.847617 485.539475,384.300802 C481.59592,387.613225 479.585103,392.81295 479.585103,400.152543 C479.585103,407.383052 481.589492,412.501074 485.524958,415.76371 C489.640828,419.175906 495.178592,420.910024 502.249563,420.910024 C512.088664,420.910024 520.479358,418.611616 527.488589,414.034986 L527.488589,414.034986 L532,411.089291 L532,433.444216 L530.673368,434.322722 C526.690844,436.95998 522.199726,438.902023 517.211096,440.152056 C512.289594,441.38751 506.634353,442 500.246093,442 C491.206971,442 483.209197,440.38481 476.278951,437.133978 C469.244953,433.835194 463.745563,429.012495 459.842262,422.699464 C455.939479,416.387864 454,408.849911 454,400.152543 C454,391.450095 455.966396,383.885836 459.92296,377.522331 C463.874769,371.168944 469.39152,366.30028 476.4148,362.950823 C483.351217,359.642002 491.404005,358 500.553774,358 Z M711,340 L711,440 L686,440 L686,340 L711,340 Z M670,340 L670,440 L645,440 L645,340 L670,340 Z M358.420773,375.75774 L358.833922,376.161635 L383.624733,400.750275 L358.82392,425.368716 C345.146822,438.957959 322.947972,438.957959 309.270875,425.368716 C308.413555,424.534289 307.604818,423.641679 306.856092,422.720687 C295.633785,409.051975 296.431092,388.898003 309.270875,376.161635 C322.811201,362.69845 344.703697,362.563818 358.420773,375.75774 Z M778.333972,408.349946 C768.823424,408.38309 763.359884,408.415179 761.943351,408.44621 C759.818553,408.492758 757.893421,408.587913 754.811182,408.865258 C751.728944,409.142603 749.677839,410.020133 748.343937,410.775791 C747.124181,411.467238 746.304537,412.234192 745.820058,413.074348 C745.325469,413.930449 745.073302,414.932391 745.073302,416.135196 C745.073302,417.685936 746.1287,419.532685 748.288273,420.757862 C750.447845,421.983038 755.803965,422.516663 758.786797,422.516663 C761.769629,422.516663 766.469926,421.989625 769.204071,421.257959 C773.020038,420.236794 776.583297,418.794412 778.333972,416.466924 C778.332917,415.876062 778.332143,415.250361 778.331651,414.589821 L778.331651,410.801898 C778.332143,410.01942 778.332917,409.202103 778.333972,408.349946 Z M588.5,379.088557 C582.009111,379.088557 577.054758,380.925901 573.455067,384.568556 C569.857391,388.209193 568.036369,393.293225 568.036369,399.99929 C568.036369,406.299164 569.880852,411.296503 573.569425,415.160536 C577.225727,418.991988 582.136817,420.910024 588.5,420.910024 C594.861917,420.910024 599.772936,418.991895 603.429819,415.159835 C607.118291,411.297208 608.962205,406.300568 608.962205,399.99929 C608.962205,393.293225 607.141184,388.209193 603.543513,384.568562 C599.943901,380.925988 594.989625,379.088557 588.5,379.088557 Z M859.268059,379.078076 C854.295377,379.078076 849.909008,380.409416 846.030089,383.082175 C842.402497,385.581389 839.874744,388.818682 838.39086,392.862086 L838.288276,393.152711 L838.288276,406.957272 L838.388732,407.22812 C839.865266,411.048981 842.215777,414.133058 845.479572,416.534212 L846.102246,416.976439 C849.928629,419.59891 854.290038,420.90651 859.268059,420.90651 C865.528284,420.90651 870.558258,418.990059 874.519234,415.147837 C878.448305,411.336527 880.400542,406.401972 880.400542,400.145571 C880.400542,393.879473 878.440983,388.881828 874.49504,384.966287 C870.534613,381.035141 865.514934,379.078076 859.268059,379.078076 Z M958.86933,377.259139 C952.409234,377.259139 948.172734,378.737559 944.69436,381.979409 C942.101016,384.397342 940.616183,386.901255 940.027711,390.130031 L939.925487,390.754586 L977.510593,390.754586 L977.495877,390.609769 C977.050768,387.132523 975.780586,384.530721 973.513413,382.163422 L973.12629,381.770933 C970.114377,378.802492 965.413394,377.259139 958.86933,377.259139 Z M1055.86933,377.259139 C1049.40923,377.259139 1045.17273,378.737559 1041.69436,381.979409 C1039.10102,384.397342 1037.61618,386.901255 1037.02771,390.130031 L1036.92549,390.754586 L1074.51059,390.754586 L1074.49588,390.609769 C1074.05077,387.132523 1072.78059,384.530721 1070.51341,382.163422 L1070.12629,381.770933 C1067.11438,378.802492 1062.41339,377.259139 1055.86933,377.259139 Z M417.775041,316.198674 C431.402128,329.803527 431.41213,351.839217 417.775041,365.434137 L394.310216,388.806613 L369.627998,364.198106 C355.999482,350.593253 335.549563,348.914464 330.119875,354.343918 L368.380599,316.187321 C382.017689,302.602335 404.127949,302.602335 417.775041,316.198674 Z" id="Combined-Shape"></path></g></g></g></svg>
				<svg viewBox="0 0 24 24" width="22px" height="22px"><path d="M11.65 21c.99 0 1.8-.81 1.8-1.8h-3.6c0 .99.81 1.8 1.8 1.8zm5.85-5.4v-4.95A5.848 5.848 0 0 0 13 4.962V4.35C13 3.603 12.397 3 11.65 3c-.747 0-1.35.603-1.35 1.35v.612a5.848 5.848 0 0 0-4.5 5.688v4.95L4 17.4v.9h15.3v-.9l-1.8-1.8z" color="#888888"></path></svg>
			</div>
		</div>

		<div>
		    <p class="exp">전체 정보</p>
			<nav>
			<ul> 	
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 3l9 7.412V21h-6.75v-7.412h-4.5V21H3V10.412L12 3z"></path></svg></span>
						<span>홈</span>
					</a>
				</li>
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M1 18v3h3c0-1.66-1.34-3-3-3zm0-4v2c2.76 0 5 2.24 5 5h2c0-3.87-3.13-7-7-7zm18-7H5v1.63c3.96 1.28 7.09 4.41 8.37 8.37H19V7zM1 10v2a9 9 0 0 1 9 9h2c0-6.08-4.93-11-11-11zm20-7H3c-1.1 0-2 .9-2 2v3h2V5h18v14h-7v2h7c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2z"></path></svg></span>
						<span>업데이트</span>
					</a>
			   </li>	
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M17 3H7c-1.1 0-1.99.9-1.99 2L5 21l7-3 7 3V5c0-1.1-.9-2-2-2z"></path></svg></span>
						<span>북마크</span>
					</a>
				</li>
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M2 12c0 5.52 4.47 10 9.99 10C17.52 22 22 17.52 22 12S17.52 2 11.99 2C6.47 2 2 6.48 2 12zm10 8.2c-4.53 0-8.2-3.67-8.2-8.2 0-4.53 3.67-8.2 8.2-8.2 4.53 0 8.2 3.67 8.2 8.2 0 4.53-3.67 8.2-8.2 8.2zm-2.588-7c.616 1.122 1.287 1.676 2.588 1.676 1.3 0 1.972-.554 2.588-1.676H16.5c-.703 1.933-2.452 3.3-4.5 3.3s-3.797-1.367-4.5-3.3zM8.65 8.4a1.35 1.35 0 110 2.7 1.35 1.35 0 010-2.7zm6.7 0a1.35 1.35 0 110 2.7 1.35 1.35 0 010-2.7z"></path></svg></span>
						<span>내가 작성한 문서</span>
					</a>
				</li>
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M22,16 L22,20 L14,20 C12.8954305,20 12,19.1045695 12,18 C12,16.8954305 12.8954305,16 14,16 L22,16 Z M17,10 C18.1045695,10 19,10.8954305 19,12 C19,13.1045695 18.1045695,14 17,14 L7,14 C5.8954305,14 5,13.1045695 5,12 C5,10.8954305 5.8954305,10 7,10 L17,10 Z M10,4 C11.1045695,4 12,4.8954305 12,6 C12,7.1045695 11.1045695,8 10,8 L2,8 L2,4 L10,4 Z"></path></svg></span>
						<span>간트차트</span><span>Beta</span>
					</a>
				</li>
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg></span>
						<span>전체 캘린터</span>
					</a>
				</li>
				<li>
					<a href="#" class="sidebar">
						<span><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M2,11.0015412 C2,13.1876518 2.97777778,15.2766019 4.75555556,16.8311695 C4.91111111,16.9769102 5.06666667,17.0983608 5.22222222,17.2198114 L5.05263158,21.5 L9.26666667,19.1387307 C10.1555556,19.3573417 11.0666667,19.4545022 12,19.4545022 C17.5111111,19.4545022 22,15.6652438 22,10.9772511 C22,6.31354849 17.5111111,2.5 12,2.5 C6.48888889,2.5 2,6.31354849 2,11.0015412 Z"></path></svg></span>
						<span>메신저</span>
					</a>
				</li>
			</ul>
		    </nav>
		</div>

        <div>
            <p class="exp">개인 공간</p>	
            <ul>
                <li>
                    <a href="#" class="sidebar">
                        <span><svg viewBox="0 0 24 24" width="16px" height="16px" class="Beecon__Svg-sc-3x6pq4-0 ePKcza beecon"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg></span>
                        <span>프라이빗 공간</span>
                    </a>
                </li>
            </ul>
        </div>
	</div>    
    
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
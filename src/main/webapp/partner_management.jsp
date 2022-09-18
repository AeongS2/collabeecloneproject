<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script>
        $(function(){
            $("#btn3").click(function(){
                $("#hidePartnerManagementOn").css("display","block");
            });
            $(".partnerBlockBtn").click(function(){
                $(this).parent().remove();
            })
        });
    </script>
    <style>
        #partnerManagementCategory {
            width: 1640px;
            height: 40px;
            background-color: #fafafa;
        }
        .btn {
            font-size: 12px;
            background-color: #fafafa;
            margin-top: 10px;
            border: none;
        }
        #hidePartnerManagement {
            width:820px;
            height:80px;
            border-bottom: 1px solid #e1e1e1;
            margin-left: 30px;
            margin-top: 30px;
        }
        #hidePartnerList {
            width: 840px;
            height: 710px;
            overflow: auto;
            padding: 10px 0px 40px;
            margin-left: 20px;
        }
        #hidePartnerList::-webkit-scrollbar{
            width: 5px;
        }
        #hidePartnerList::-webkit-scrollbar-thumb{
            background-color: #e1e1e1;
            border-radius: 5px;
        }
        #hidePartnerList::-webkit-scrollbar-track{
            background-color: white;
            border-radius: 5px;
        }
        .hidePartnerBox {
            display: flex;
            width:390px;
            height:80px;
            border: 1px solid #e1e1e1;
            margin-left: 20px;
            margin-top: 10px;
            float: left;
            border-radius: 5px;
        }
        .partnerBlockBtn {
            margin-top: 0px;
            margin-right: 0px;
            margin-left: 100px;
            background-color: white;
            border: none;
            font-size: 15px;
            color: #d9ad2b;
            /*box-sizing: border-box;*/
        }
        #hidePartnerManagementOn {
            display: none;
        }
    </style>
	</head>
<body>
	<button>파트너 관리</button>
    <div id="partnerManagementCategory"> 
        <button class="btn" id="btn1" style="margin-left: 150px;">협업공간 일괄 초대</button>
        <button class="btn" id="btn2" style="border-left:1px solid #c1c1c1;">멤버 일괄 탈퇴</button>
        <button class="btn" id="btn3" style="border-left:1px solid #c1c1c1;"> 숨긴 파트너 관리</button>
    </div>
    <div id="hidePartnerManagementOn">
        <div id="hidePartnerManagement">
            <h3 style="margin: 0px;">숨긴 파트너 관리</h3>
            <p style="margin-top: 5px; font-size:12px;">파트너를 '숨김 해제' 하면, 프라이빗 공간 내 문서에서 해당 파트너를 공유자로 추가할 수 있습니다.</p>
        </div>
        <div id="hidePartnerList">
            <div class="hidePartnerBox">
                <div><img src="image/bell.svg" style="width: 60px; height:60px; border-radius: 35px; border: 1px solid black; margin: 10px 12px; float: left;"  /></div>
                <div style="float: left;">
                    <p style="margin-bottom: 0px; font-size: 14px; margin-top: 25px;">강지현</p>
                    <p style="margin:0px; font-size: 12px; color: gray;">twekyaak@gmail.com</p>
                </div>
                <button class="partnerBlockBtn">숨김 해제</button>
            </div>
            <div class="hidePartnerBox">
                <div><img src="image/bell.svg" style="width: 60px; height:60px; border-radius: 35px; border: 1px solid black; margin: 10px 12px; float: left;"  /></div>
                <div style="float: left;">
                    <p style="margin-bottom: 0px; font-size: 14px; margin-top: 25px;">강지현</p>
                    <p style="margin:0px; font-size: 12px; color: gray;">twekyaak@gmail.com</p>
                </div>
                <button class="partnerBlockBtn">숨김 해제</button>
            </div>
        </div>
    </div>
</body>
</html>
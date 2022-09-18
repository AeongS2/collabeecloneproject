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
            $("#bt1").on("click", function(){ // 알림 펼쳐보기 버튼
                    $("#alarm").slideToggle("fast");
            });
            $("#bt2").on("click", function(){ // 회사동료
                    $("#corporationP").slideToggle("fast");
            });
            $("#bt3").on("click", function(){ // 외부협업자
                    $("#partner").slideToggle("fast");
            });
            $(".inviteCancellationBtn").click(function(){
                $(this).parent().parent().remove();
            });
            $(".retryInvite").click(function(){
                alert($(this).parent().children('.mail').text());
                
            });
            $(".hideBtn").click(function(){
                $(this).parent().parent().parent().css("display","none")
            });
            $("#partnerBtn").click(function(){
                $("#partners").slideToggle("fast");
            });
            $("#invitePartner").click(function(){
                $("#partnerInviteBox").css("display","block")
            });
            $("#inviteXbtn").click(function(){
                $("#partnerInviteBox").css("display","none")
            });
            $("#invitePartnerBtn").click(function(){
                alert("친구초대");
            });
            $("#search").keyup(function(key){
                $(this).attr("value",$(this).val());
                if(key.keyCode==13){
                    alert($(this).val());
                }
            });
            // 자바메일 api
        });
    </script>
    <style>
        .parentsAlarm {
            display: block;
        }
        #partners {
            float: right;
            border-radius: 5px;
            width:200px;
            height: 890px;
            border: 1px solid #888888;
            display: none;
        }
        #partnerSc{
            width:190x;
            height:785px;
            margin-top: 15px;
            overflow: auto;
        }
        #partnerSc::-webkit-scrollbar{
            width:5px;
            
        }
         #partnerSc::-webkit-scrollbar-thumb{
            background-color: #e1e1e1;
            border-radius: 5px;
        }
        #partnerSc::-webkit-scrollbar-track{
            background-color: white;
            border-radius: 5px;
        }    
        #invitePartner {
            width: 180px;
            height: 30px;
            margin-left: 10px;
            margin-top: 10px;
            border-radius: 5px;
            background-color: #d9ad2b;
            color: white;
            border: none;
        }
        .gray {
            filter: brightness(0) saturate(100%) invert(57%) sepia(1%) saturate(0%) hue-rotate(282deg) brightness(94%) contrast(88%);
        }
        .hideBtn, #inviteXbtn {
            float: right;
            width: 20px;
            height: 20px;
            padding: 0px;
            border:none;
            background-color:white;
        }
        .buttonImg{
            width: 20px;
            filter: brightness(0) saturate(100%) invert(0%) sepia(86%) saturate(2941%) hue-rotate(215deg) brightness(85%) contrast(110%);
        }
        #partnerInviteBox {
            width: 900px;
            height: 530px;
            border: 1px solid black;
            border-radius: 5px;
            float: right;
            display: none;
            padding: 20px 30px 20px 30px;
        }
        .inviteCancellationBtn {
            background-color: white;
            margin-top: 15px; margin-left: -25px; clear:both; padding: 0px; width: 80px; height: 25px; border-radius: 5px; border: 1px solid gray; color:gray;
        }
        .retryInvite {
            background-color: white;
            width: 80px; height: 25px;  border: 1px solid #d9ad2b; border-radius: 5px; color:#d9ad2b;
        }
        .chattingMemberPicture {
            background-image: url('image/fileTop.png'); 
            width: 32px; 
            height: 32px;
            float: left; 
            border-radius: 35px; 
        }
        .onOffImg {        
            width:8px; 
            float: right;
            border-radius: 35px;
            border: 1px solid gray;
            filter: brightness(0) saturate(100%) invert(92%) sepia(82%) saturate(4726%) hue-rotate(30deg) brightness(112%) contrast(97%);
            background-color: #96fc1f;
            display: block;
        }
    </style>
	</head>
<body>
	 <button id="partnerBtn" style="float: right;">파트너</button>
    <div id="partners" >
        <button id="invitePartner">파트너 초대하기</button>
        <div style="width:178px; height: 25px;border:1px solid #c1c1c1; margin-top: 10px; margin-left: 10px; border-radius: 5px; padding: 0px;">
            <img id="partnerMag" src="image/magnifier.svg" style="width:20px; height:20px; margin-top: 2px; margin-left: 2px; margin-right: 0; filter: brightness(0) saturate(100%) invert(78%) sepia(3%) saturate(0%) hue-rotate(222deg) brightness(99%) contrast(85%);"/>
            <input id="search" type="search"  placeholder="이름 또는 이메일" style="width:150px; height:25px; border:none; vertical-align: top; border-radius: 5px; padding: 0px;"/>
        </div>
        <div id="partnerSc">
            <div style="margin-left: 10px;">
                <span style="font-size: 12px; color: gray;">알림 (5)</span><button style="width: 15px; height: 15px; padding: 0px; vertical-align: center; border:none; background-color: white;"><img class="gray" id="bt1" src="image/down.svg" style="width:14px; height:14px; vertical-align: bottom; margin: 0px; padding: 0px;"/></button>
            </div>
            <div id="alarm" style="display: block;">
                <div class="partnerAlarm" style="margin-left: 10px; margin-top:5px;">
                    <h6 style="padding:0px; margin-top: 0px; margin-bottom: 5px;">파트너 수락 대기중</h6>
                    <div style="width: 178px; height:70px; border-bottom:1px solid #c1c1c1;">
                        <img src="image/partnerMail.svg" style="width:25px; float: left; margin-left: 5px;"/>
                        <span  class="mail"style="font-size: 13px; float:left; margin-top: 3px; margin-left: 8px; color:#888888;">yura2704@gmail.coom</span>
                        <button class="inviteCancellationBtn">초대 취소</button>
                        <button class="retryInvite">다시 초대</button>
                    </div>
                </div>
                <div class="partnerAlarm" style="margin-left: 10px; margin-top:5px;">
                    <h6 style="padding:0px; margin-top: 0px; margin-bottom: 5px;">파트너 수락 대기중</h6>
                    <div style="width: 178px; height:70px; border-bottom:1px solid #c1c1c1;">
                        <img src="image/partnerMail.svg" style="width:25px; float: left; margin-left: 5px;"/>
                        <span class="mail" style="font-size: 13px; float:left; margin-top: 3px; margin-left: 8px; color:#888888;">yura270sdl.coom</span>
                        <button class="inviteCancellationBtn">초대 취소</button>
                        <button class="retryInvite">다시 초대</button>
                    </div>
                </div>
                <div class="partnerAlarm" style="margin-left: 10px; margin-top:5px;">
                    <h6 style="padding:0px; margin-top: 0px; margin-bottom: 5px;">파트너 수락 대기중</h6>
                    <div style="width: 178px; height:70px; border-bottom:1px solid #c1c1c1;">
                        <img src="image/partnerMail.svg" style="width:25px; float: left; margin-left: 5px;"/>
                        <span class="mail" style="font-size: 13px; float:left; margin-top: 3px; margin-left: 8px; color:#888888;">yura2704@gmail.coom</span>
                        <button class="inviteCancellationBtn">초대 취소</button>
                        <button class="retryInvite">다시 초대</button>
                    </div>
                </div>
                <div class="partnerAlarm" style="margin-left: 10px; margin-top:5px;">
                    <h6 style="padding:0px; margin-top: 0px; margin-bottom: 5px;">파트너 수락 대기중</h6>
                    <div style="width: 178px; height:70px; border-bottom:1px solid #c1c1c1;">
                        <img src="image/partnerMail.svg" style="width:25px; float: left; margin-left: 5px;"/>
                        <span class="mail" style="font-size: 13px; float:left; margin-top: 3px; margin-left: 8px; color:#888888;">yura2704@gmail.coom</span>
                        <button class="inviteCancellationBtn">초대 취소</button>
                        <button class="retryInvite">다시 초대</button>
                    </div>
                </div>
                <div class="partnerAlarm" style="margin-left: 10px; margin-top:5px;">
                    <h6 style="padding:0px; margin-top: 0px; margin-bottom: 5px;">파트너 수락 대기중</h6>
                    <div style="width: 178px; height:70px; border-bottom:1px solid #c1c1c1;">
                        <img src="image/partnerMail.svg" style="width:25px; float: left; margin-left: 5px;"/>
                        <span class="mail" style="font-size: 13px; float:left; margin-top: 3px; margin-left: 8px; color:#888888;">yura2704@gmail.coom</span>
                        <button class="inviteCancellationBtn">초대 취소</button>
                        <button class="retryInvite">다시 초대</button>
                    </div>
                </div>
            </div>
            <div style="margin-left: 10px; margin-top: 15px;">
                <span style="font-size: 12px; color: gray;">회사 동료 (3)</span><button style="width: 15px; height: 15px; padding: 0px; vertical-align: center; border:none; background-color: white;"><img class="gray" id="bt2" src="image/down.svg" style="width:14px; height:14px; vertical-align: bottom; margin: 0px; padding: 0px;"/></button>
            </div>
            <div id="corporationP" style="display: block;">
                <div style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
                <div style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
                <div style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
            </div>
            <div style="margin-left: 10px; margin-top: 15px; clear:both;">
                <span style="font-size: 12px; color: gray;">외부 협업자 (5)</span><button style="width: 15px; height: 15px; padding: 0px; vertical-align: center; border:none; background-color: white;"><img class="gray" id="bt3" src="image/down.svg" style="width:14px; height:14px; vertical-align: bottom; margin: 0px; padding: 0px;"/></button>
            </div>
            <div id="partner" style="display: block;">
                <div style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
                <div style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
                <div class="partnerInformation" style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px; ">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
                <div class="partnerInformation" style="margin-top: 5px; clear: both; margin-left: 5px; height:40px;">
                    <div style="float: left; margin-left: 5px; margin-top: 3px;">
                        <div class="chattingMemberPicture"><img class="onOffImg" src="image/bell.svg"/></div>
                    </div>
                    <div style="float:left; margin-left: 2px;">
                        <div style="font-size: 12px; float: left; width:128px ;">강태안</div>
                        <div style="float: right;"><button class="hideBtn"><img class="buttonImg" src="image/x.svg"/></button></div>
                        <div style="font-size: 12px; color:#888888;">jm</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="partnerInviteBox">
        <h4 style="margin-top: 0px; color:#dab547; margin-bottom: 10px; float: left;">파트너 초대</h4>
        <button id="inviteXbtn"><img class="buttonImg" src="image/x.svg"/></button>
        <p style="font-size: 12px; margin: 0px; clear: both;">더 많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요.</p>
        <p style="margin-top: 0px; font-size: 12px;">회사 동료뿐만 아니라 외부 협업자도 파트너로 초대할 수 있습니다.</p>
        <div style="float:left; border-right: 1px solid gray; width:410px; height:350px;">
            <p style="font-size: 12px;"><b>파트너 초대</b></p>
            <input type="search" placeholder="이메일 주소를 입력하고 Enter키를 눌러주세요" style="width:380px; height:35px; border:1px solid #d9ad2b; border-radius: 5px;"/>
            <p style="margin: 10px 0px 0px 0px; font-size:12px;">이메일 주소를 입력하고 Enter키를 눌러 동료들을 초대해 보세요.</p>
        </div>
        <div style="float:left; margin-left: 20px;">
            <p style="font-size: 12px;"><b>초대 리스트</b></p>
            <div style="border: 1px solid black; border-radius:5px; height:300px;">
                <p style="font-size: 12px;">초대 메일을 보낼 이메일 주소를 여기에서 확인할 수 있습니다.</p>
            </div>
            <button id="invitePartnerBtn" style="margin-top: 40px; height:30px; width:385px; border:none; border-radius:5px; color:white; background-color:#dab547">파트너 초대하기</button>
        </div>
    </div>
</body>
</html>
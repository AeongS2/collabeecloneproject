<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>멤버 초대하기</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    
    <!-- list 스크롤 모달창 숨기기 -->
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
        .modal_im{
            position:fixed;
            width:100%;
            height:100%;
            background-color:rgba(0, 0, 0, 0.5);
            display:flex;
            align-items: center;
            justify-content: center;
            transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
        }
        .modal_content_im{
            background-color: #fff;
            flex: 0 1 auto;
            max-height: calc(100% - 96px);
            margin: 48px;
            display: flex;
            position: relative;
            /* overflow-y: auto; */
            border-radius: 4px;
            box-shadow:0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%)
        }
        #title_im{
            all: unset;
            font-size: 16px;
            font-weight: bold;
            color: rgb(51, 132, 108);
            line-height: 1.5;
        }
        #summary_im{
            display: block;
            margin-top: 8px;
            font-size: 12px;
            line-height: 1.5;
            color: rgb(136, 136, 136);
        }
        #container1_im{
            width: 900px;
            padding: 20px 32px 32px;
            display: flex;
            flex-direction: column;
            min-height: 440px;
            height: 680px;
        }
        header{
            display: flex;
            flex-direction: row;
            -webkit-box-pack: justify;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
            flex: 0 0 64px;
        }
        #section1_im{
            display:flex;
            flex-direction:row;
            width: 100%;
            height: calc(100% - 90px);
        }
        #container2_im{
            position: relative;
            flex-basis: 50%;
            border-right: 1px solid rgb(225, 225, 225);
            padding-top: 5px;
            padding-right: 33px;
            padding-bottom: 5px;
            display:flex;
            flex-direction:column;
        }
        .sec_im{
            color: rgb(136, 136, 136);
            padding-left: 24px;
            font-size: 12px;
            font-weight: normal;
            margin-top:10px;
        }
        #container2_im:nth-child(1){
            display: block;
            margin-bottom: 8px;
            font-size: 12px;
            font-weight: bold;
            color: rgb(34, 34, 34);
            line-height: 18px;
        }
        #search_im{
            outline:none;
            border-radius:4px;
            border: 1px solid rgb(225, 225, 225);
            height: 36px;
            font-size: 14px;
            padding-left: 10px;
            color: rgb(34, 34, 34);
            transition: border-color 0.2s ease 0s;
            margin: 16px 16px 4px;
            width: 352px;
            padding-right: 25px;
        }
        #search_im:focus{
            box-shadow:rgb(51 132 108) 0px 0px 0px 1px inset rgb(51 132 108 / 15%) 0px 0px 0px 4px;
        }
        #search_im::placeholder{
            color:rgb(189, 186, 183);
        }
        .picture_im{
            flex-shrink: 0;
            position: relative;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            padding: 1px;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0.1);
            content: "";
        }
        .picture_im_before{
            position: absolute;
            border-radius:50%;
            background-color: rgb(255, 255, 255);
            background-size: cover;
            background-position: center center;
            cursor: pointer;
            width: 30px;
            height: 30px;
            content:"";
            top:0px;
            left:0px;
            transform: translate(1px, 1px);
        }
        .picture_im_before::after{
            position:absolute;
            display:block;
            height:32px;
            width:32px;
            border:2px solid rgba(0,0,0,0);
            border-radius:50%;
            transition: border-color 0.3s ease 0s;
            content:"";
            top:0px;
            left:0px;
        }
        .info_im{
            display:flex;
            flex-direction:column;
            flex:1 1 0%;
            min-width:0px;
            padding-right:14px;
            padding-left:8px;
        }
        .info_name_im{
            color:rgb(34,34,34);
            font-size:13px;
            line-height:16px;
            white-space:nowrap;
            font-weight:normal;
        }
        .info_email_im{
            margin-top:2px;
            color:rgb(117,114,111);
            white-space:nowrap;
            line-height:14px;
            font-size:12px;
            font-weight:normal;
        }
        #container2_1_im{
            border:1px solid rgb(225, 225, 225);
            background-color: rgb(255, 255, 255);
            flex: 1 1 0%;
            height: calc(100% - 125px);
            position: relative;
            width: 384px;
            margin-bottom: 30px;
            border-radius: 4px;
            margin-top:10px;
        }
        .container2_3_im{
            display:flex;
            flex-direction:row;
            padding:8px 18px 8px 24px;
            align-items:center;
        }
        .check_im{
            display:inline-block;
            fill: rgb(225, 225, 225);
            padding: 13px 20px 0px 0px;
        }
        .invite_pt_im{
            display:flex;
            flex-direction:row;
            justify-content:space-between;
            cursor:pointer;
            position: relative;
        }
        .invite_pt_im:hover{
            background-color: rgba(242, 242, 242, 0.4);
        }
        .add_list_im{
            overflow: hidden;
            color: rgb(34, 33, 32);
            font-size: 13px;
            font-weight:normal;
            line-height: 20px;
            white-space: nowrap;
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
            max-width: 345px;
            padding: 4px 6px;
            background-color: rgb(250, 250, 250);
            border: 1px solid rgb(224, 221, 217);
            border-radius: 14px;
            cursor: pointer;
        }
        .add_list_im svg{
            cursor: pointer;
            transition: fill 0.2s ease 0s;
        }
        #invite_link_im{
            color: rgb(51, 132, 108);
            border:1px solid rgba(51, 132, 108, 0.3);
            border-radius:4px;
            margin-top: 10px;
            padding: 0px 30px 0px 10px;
            background-color: rgba(51, 132, 108, 0.05);
            width:384px;
            height:36px;
            font-size: 14px;
            cursor: pointer;
        }
        #invite_link_im:hover{
            border:1px solid rgb(51, 132, 108);
        }
        #container4_im{
            font-size:12px;
            color: rgb(34, 34, 34);
            font-weight:bold;
            padding-left:33px;
            padding-top:5px;
            display:flex;
            flex-direction:column;
        }
        #container4_1_im{
            flex-direction: column;
            border:1px solid rgb(225, 225, 225);
            border-radius:4px;
            background-color:rgb(255, 255, 255);
            height: calc(100% - 125px);
            width:384px;
            display:flex;
            align-items:center;
            justify-content: center;   
            margin-top:10px;
            padding:16px;
        }
        #invite_bnt_im{
            height: 36px;
            position: relative;
            color: rgb(255, 255, 255);
            font-size: 12px;
            font-weight: 500;
            border-radius: 4px;
            text-align: center;
            padding: 5px 18px;
            transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
            border-width: 1px solid rgb(51, 132, 108);
            background-color: rgb(51, 132, 108);
            cursor: not-allowed;
            opacity: 0.6;
            box-shadow: none;
            margin-top:45px;
        }
        #invite_bnt_im:hover{
            background-color: rgb(42, 98, 81);
            border-color: rgb(42, 98, 81);
        }
        .none{
            display:none;
        }
        .hidden{
        	visibility:hidden;
        	opacity:0;
        }
        .scr{
            overflow:auto;
            height: calc(100% - 56px);
        }
        .scr::-webkit-scrollbar{
            width:4px;
            height:4px;
        }
        .scr::-webkit-scrollbar-thumb{
            border-radius:2px;
            height:40%;
            background-color: #e1e1e1;
        }
    </style>
    <script>
        $(function(){
			// 모달 x버튼 누르면 닫히고 초기화
			$(".closing_bnt").click(function(){ 
				$("#invite_member").css({visibility:"hidden", opacity:0});
                $("#search_im").val("");
                    
                $(".invite_pt_im").find(".check_im path").css("fill", "rgb(225, 225, 225)");//체크표시
                $(".picked_member").css("display","none");
                $(".picked_empty").removeClass("none");
                $("#container4_1_im").css({'align-items':"center", 'justify-content':"center"});
			});
			
			//모달 다른 부분 누르면 
			$(document).click(function(e){
			 if($("#invite_member").is(e.target)) {
				$("#invite_member").css({visibility:"hidden", opacity:0});
				$("#search_im").val("");
				
				$("#invite_pt_im").find(".check_im path").css("fill", "rgb(225,225,225)");
				$(".picked_member").css("display", "none");
				$(".picked_empty").removeClass("none");
				$("#container4_1_im").css({'align-itens': "center", 'justify-content':"center"});
			 }
			});
			
			//멤버초대 누르면
			$("#invite_bnt_im").click(function(){
				$("#invite_member").css({visibility:"hidden", opacity:0});
				$("#search_im").val("");
				
				$("#invite_pt_im").find(".check_im path").css("fill", "rgb(225,225,225)");
				$(".picked_member").css("display", "none");
				$(".picked_empty").removeClass("none");
				$("#container4_1_im").css({'align-itens': "center", 'justify-content':"center"});
			}); //몇명 선택됐는지, 초대 버튼에 반영(해야됨)

        });



    </script>

</head>
<body>
<div id="invite_member" class="modal_im"> <!--전체 화면-->
<div>
    <div id="container1_im" class="modal_content_im"><!--모달창-->
        <header>
            <div>
                <span id="title_im">멤버 초대</span>
                <p id="summary_im">더 많은 사람을 초대하여 원활한 의사소통으로 업무를 효율적으로 처리해보세요.<br/>
                            회사 동료뿐만 아니라 외부 협업자도 파트너로 초대할 수 있습니다.</p>
            </div>
            <svg viewBox="0 0 24 24" width="24px" height="24px" class="closing_bnt"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg>
        </header>
        
        <section id="section1_im">
        <div id="container2_im"><!--왼쪽-->
            <div>파트너 또는 이메일주소로 초대</div>
            <div id="container2_1_im">
                <input type="text" id="search_im" placeholder="이름, 이메일 주소 검색"/>
                <div class="scr">
                <div class="sec_im">회사 동료</div>
                <div id="container2_2_im">
                    <div class="invite_pt_im">
                    <div class="container2_3_im">
                        <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                        <div class="info_im">
                            <span class="info_name_im">깡</span>
                            <span class="info_email_im">dsfsa@dfgd.com</span>
                        </div>    
                    </div>
                    <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">깡</span>
                                <span class="info_email_im">dsfsa_2@dfgd.com</span>
                            </div>    
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/-1');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">깡</span>
                                <span class="info_email_im">dsfsa_3@dfgd.com</span>
                            </div>    
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                </div>
                
                <div class="sec_im">외부협업자</div>
                <div id="container3_im">
                    <div class="invite_pt_im">
                    <div class="container2_3_im">
                        <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/2972576');"></div></div>
                        <div class="info_im">
                            <span class="info_name_im">정민</span>
                            <span class="info_email_im">jdsfhbsde@sdnfjk.com</span>
                        </div>
                    </div>
                    <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/2972576');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">정민</span>
                                <span class="info_email_im">jdsfhbsde_2@sdnfjk.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/2972576');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">정민</span>
                                <span class="info_email_im">jdsfhbsde_3@sdnfjk.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/2972576');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">정민</span>
                                <span class="info_email_im">jdsfhbsde_4@sdnfjk.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    <div class="invite_pt_im">
                        <div class="container2_3_im">
                            <div class="picture_im"><div class="picture_im_before" style="background-image:url('https://down.collabee.co/userProfile/2972576');"></div></div>
                            <div class="info_im">
                                <span class="info_name_im">정민</span>
                                <span class="info_email_im">jdsfhbsde_5@sdnfjk.com</span>
                            </div>
                        </div>
                        <div class="check_im"><svg viewBox="0 0 24 24" width="20px" height="20px"><path d="M9 16.2L4.8 12l-1.4 1.4L9 19 21 7l-1.4-1.4z" color="#e0ddd9"></path></svg></div>
                    </div>
                    
                
                </div>
                </div>
            </div>

            <div>
                <div>
                    <label for="invite_link_im">초대 링크 (가입 시 관리자 승인 필요)</label>
                    <input type="text" id="invite_link_im" value="https://www.collabee.co/invite/GZfjYyBhb0" readonly/><!-- 주소는 sql에서 불러옴 -->
                    
                </div>
            </div>

        </div>

        <div id="container4_im"><!--오른쪽-->
            <div>초대 리스트</div>
            <div id="container4_1_im" class="scr">
                    <div class="picked_empty">
                        <svg width="40px" height="40px" viewBox="0 0 24 24" style="margin-left:77px;"><path fill="#bdbab7" fill-rule="evenodd" d="M20 4c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2l.01-12c0-1.1.89-2 1.99-2h16zM4 6v12h16V6H4zm15 3l-7 4-7-4V7l7 4 7-4v2z"></path></svg>
                        <div class="sec_im">초대 메시지를 보낼 상대를<br/>여기에서 확인할 수 있습니다.</div>
                    </div>
                      
    <script>
        $(function(){
            
            //클릭하면 초대리스트에 추가
            $(".invite_pt_im").on("click", function(){ //중복 방지함. 
                var name = $(this).find(".info_name_im").text();//선택한 멤버 이름
                var url = $(this).find(".picture_im_before").css("background-image");//프로필사진주소
                var email = $(this).find('.info_email_im').text();  // 선택한 멤버 이메일
                
                $(this).find(".check_im path").css("fill","rgb(51, 132, 108)");//체크표시
                $(".picked_empty").addClass("none");
                $("#container4_1_im").css({'align-items':"flex-start", 'justify-content':"normal"});
                    
                var setPickedMember = 
                "<div email='" + email + "' class='picked_member'>" //email속성 추가
                +"<div class='picked_picture'><div class='picked_picture_before' style='background-image:"+url+"'></div></div>"
                +"<div class='info_name_im'>"+name+"</div>"
                +"<div class='closing_bnt'><svg viewBox='0 0 24 24' width='16px' height='16px' style='transform:translateY(1px); transition: fill 0.2s ease 0s;cursor: pointer;'><path d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg></div>"
                +"</div>";
            
                //한명씩 실행될때마다 cnt++ x누르면 cnt-- 멤버초대버튼에 반영?.
                $("#container4_1_im").append(setPickedMember);
                
                
            });//클릭한 멤버 왼쪽에서 빼기
            
            //x 누르면 초대리스트에서 삭제 
            $("#invite_member").on("click", ".picked_member .closing_bnt", function(){ //append 뒤에 클릭 이벤트 이 형식으로

                var del = $(this).parent(".picked_member");//선택한 멤버
                var delEmail = $(this).parent().attr("email");//선택한 멤버의 이메일속성 찾아옴.
                $(".invite_pt_im .info_email_im").each(function (index, item) { //제이쿼리의 for-each문. item을 주로 쓰고 index는 필요시에 씀.
                    //파트너 리스트의 각 이메일과 선택한 멤버의 이메일 비교. 동일하면 체크표시 색 바꿈.
                    // $(item).text() -> email
                    if($(item).text() == delEmail) { //$(item)이 이메일을 담고있는 span임. 
                        //체크표시 없애기
                        $(item).parent().parent().parent().find(".check_im path").css("fill", "rgb(225, 225, 225)");
                        }
                });	
                del.detach();//html 지우기

                //초대리스트에 아무도 없으면 invite_empty 뜨기
                var listCnt = $("#container4_1_im .picked_member").length;
                if(listCnt==0){
                    $(".picked_empty").removeClass("none");
                    $("#container4_1_im").css({'align-items':"center", 'justify-content':"center"});
                }
            });
                                
            
            
            
        });
        
        </script>
                      
                        
          </div> 
          <button id="invite_bnt_im">멤버 초대하기</button>
        	
        </div>
        <script>
            var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
       	$(function(){
       		//초대링크 누르면 복사하고 안내창 뜨기
       		$("#invite_link_im").on("click", function(){
       			var url=$("#invite_link_im").select();
       			document.execCommand("copy");
       		  	
       			//3초후에 닫기
       			var alert_message = $(".alert").html(x+"복사되었습니다.");
     			alert_message.fadeIn(function(){
         			setTimeout(function(){
         				alert_message.fadeOut();
         			}, 3000);
     			});
       			
       			//글자수에 따라 높이 정하기
	     		var height = alert_message.prop("scrollHeight");
    	 		alert_message.css("height", height);

    	 		//안내창 x누르면 닫기
	       		$(".closed").on("click",function(){
	       			alert_message.fadeOut();
	       		});
       		});
       		
       		
       	
       	
       	
       	
       	});
        	
      
        </script>
        <style>
        	
            .picked_member{
                display:flex;
                flex-direction: row;
                -webkit-box-align: center;
                align-items: center;
                -webkit-box-pack: start;
                justify-content: flex-start;
                flex-shrink: 0;
                max-width: 345px;
                padding: 4px 6px;
                margin-bottom: 5px;
                background-color: rgb(250, 250, 250);
                border: 1px solid rgb(224, 221, 217);
                border-radius: 14px;
                cursor: pointer;
            }
            .picked_member:hover{
                border-color: rgb(189, 186, 183);
                background-color: rgb(238, 236, 233);
            }
            .picked_picture{
                flex-shrink: 0;
                position:relative;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                padding:1px;
                cursor: pointer;
                background-color: rgba(0, 0, 0, 0.1);
                content: "";
                margin-right:3px;
            }
            .picked_picture_before{
                border-radius:50%;
                background-color: rgb(255, 255, 255);
                background-size: cover;
                background-position: center center;
                cursor: pointer;
                width: 18px;
                height: 18px;
                content:"";
                top:0px;
                left:0px;
                transform: translate(1px, 1px);
                position: absolute;
            }
            .picked_picture_before::after{
                position:absolute;
                display:block;
                height:20px;
                width:20px;
                border:2px solid rgba(0,0,0,0);
                border-radius:50%;
                transition: border-color 0.3s ease 0s;
                content:"";
                top:0px;
                left:0px;
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
        	}
        	.closed{
        		float:right;
        		cursor:pointer;
        	}
        </style>
        
        
        
    </div>
</div>
   
   
   
    </div>
    
        <div class="alert"></div>	




</body>
</html>
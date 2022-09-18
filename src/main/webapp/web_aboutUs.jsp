<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"/>
	<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <style>
        *{
            box-sizing: border-box;
        }
        body{
            font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
            margin:0;
            padding:0;
        }
        .flL {
            float:left;
        }
        .flR {
            float:right;
        }
        .clL{
            clear: left;
        }
        .clR{
            clear:right;
        }
        #section1_cm {
            content: "";
            width: 100%;
            height: 363px;
            box-sizing: border-box;
            background: url(https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/bg-top-aboutus.d26bfd9d.png) center center no-repeat rgb(25, 127, 153);
            z-index: -1;
        }
        #section2_cm{
            background: rgb(250, 249, 245);
            overflow: hidden;
            padding:100px 0px;
        }
        #section3_cm {
            overflow: hidden;
            display:flex;
            flex-direction:row;
            justify-content: center;
            align-items:center;
            padding:100px 0px;
        }
        #section4_cm {
            display:block;
            height:340px;
            background: url(https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/bg-freetrial.8e4e0488.png) center center no-repeat rgb(0, 89, 73);;
            text-align:center;
            display: flex;
            justify-content: center;
        }
        .collabee_mission {
            font-size: 52px;
            font-weight: bold;
            color: rgb(255, 255, 255) !important;
            text-align:center;
            padding-top:80px;
        }
        .collabee_mission_summary{
            font-size: 22px;
            line-height:50px;
            color:rgb(255, 255, 255);
            text-align:center;
        }
        .title_sec2{
            font-size: 28px;
            line-height: 1.43;
            font-weight: normal;
            
        }
        .summary_sec2{
            font-size: 18px;
            color: rgb(102, 102, 102);
            line-height:27px;
            
        }
        .title_sec3{
            font-size: 28px;
            line-height: 1.43;
            font-weight: normal;
        }  
        .summary_sec3{
            font-size: 18px;
            line-height: 1.56;
            color: rgb(102, 102, 102);
            line-height:27px;
            position: relative;
        }
        .title_sec4{
            font-size: 34px;
            font-weight: bold;
            line-height: 1.47;
            color: rgb(255, 255, 255);
            
        }
        .summary_sec4{
            font-size:15px;
            color: rgba(255, 255, 255, 0.8);
            padding-top:13px;
        }
        .emailVal {
	        width: 330px;
	        height:50px;
	        border: 1px solid rgb(204, 204, 204);
	        border-radius: 6px;
	        font-size: 18px !important;
	        margin-top:30px; 
	        padding-left:13px;
        }
        .emailVal::placeholder{
            color:rgb(204, 204, 204);
        }
        .free_start_bnt{
            width: 162px;
            height:55px;
            border-radius: 6px;
            margin-left: 8px;
            font-size: 18px;
            font-weight: bold;
            color: rgb(255, 255, 255);
            background-color: rgb(217, 173, 43);
            border:none;
            line-height: 1.5;
            cursor: pointer;
            transition: background-color 0.2s ease 0s;
        }
        .free_start_bnt:hover{
            background-color: rgb(189, 148, 26);
        }
        .start_login_bnt{
            text-decoration:underline;
            color:rgb(255, 255, 255);
            cursor:pointer;
            transition: color 0.2s ease 0s;
        }
        .start_login_bnt:hover{
            color: rgb(217, 173, 43);
        }
        #title_cm{
            padding-left:6px;
        }
        .login_bnt_sec1{
            height: 34px;
            padding: 0px 10px;
            border: 1px solid rgb(217, 173, 43);
            border-radius: 6px;
            background-color: transparent;
            color: rgb(237, 189, 47);
            font-weight: bold;
            font-size: 15px;
            margin: 18px 0px 0px 12px;
            cursor: pointer;
    	}
    	.login_bnt_sec1:hover{
    		background-color:rgb(217, 173, 43);
        	color:rgb(255,255,255);
    	}
        #side_right_sec2{
            width:500px;
            height:500px;
            margin-right:500px;
            padding-top:180px;
            padding-bottom:180px;
            float:right;
        }
        #section2_cm img{
           padding-left:500px;
           float:left;
           padding-top:150px;
        }
        #deco1_mp{
            position:absolute;
        }
        #side_left_sec3{
        	padding-right:100px;
            /* width:500px;
            height:500px;
            float:left;
            padding-left:515px;
            padding-top:150px; */
       }
        #section3_cm img{
            /* padding-top:130px;
            padding-left:95px;
            padding-bottom:160px; */
       }
        #deco2_mp{
           position:absolute;
       }     
        #side_bottom_cm{
            padding-top:83px;
            padding-left:4px;
        }
        /* 스크롤 */
        ::-webkit-scrollbar {
            width: 4px;
        } 
        ::-webkit-scrollbar-track{
            -webkit-box-shadow: none;
        }
        ::-webkit-scrollbar-thumb {
            border-radius: 2px;
            background-color: rgb(204, 204, 204);
        }
    </style> 


</head>
<body>
<section>
    <section id="section1_cm">
    <div>
	    <%@ include file="../WEB-INF/include/homepage_menu_aboutUs.jsp" %>
    </div>
    <div id="title_cm"><div class="collabee_mission clL">콜라비팀의 미션</div>
        <div class="collabee_mission_summary"><span>가장 가치있는 일에 집중할 수 있도록 시간을 돌려드리는 것입니다.</span></div>
    </div>
    </section>

    <section id="section2_cm">  
        <div style="position:relative; padding-left:590px;">
            <div id="deco1_mp"><img src="https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/img-3100-c-1-obj.e5c82457.png"/></div>
        </div>
        <div id="side_right_sec2"><span class="title_sec2" >딥 워크(Deep work)를 할 수 있는 환경<br/>을<br/>마련하고 싶었습니다.</span>
            <p><span class="summary_sec2">하루 8시간 중, 우리는 2시간 정도만 본업에 집중합니다. 나머<br/>지 6시간은 커뮤니케이션, 자료검색, 미팅 등에 사용됩니다. 끊<br/>임없이 울려대는 알림과 참여이유를 알 수 없는 회의, 틈틈이 <br/>진행상황을 물어보는 동료들이 늘어가면서 너무 많은 시간이 <br/>소요되곤 합니다. 집중할 시간이 길어져야 높은 퀄리티의 결과<br/>물을 낳는 '지식근로자'임에도 불구하고 말이죠.
                <br/><br/> 이제, 본연의 업무에 집중해 보세요. 동료들은 당신에게 굳이 <br/>물어보지 않아도, 콜라비를 통해서 이슈들의 진행상황이나, 중<br/>요한 결정내용, 토론했던 내용들을 직접 확인할 수 있을 거예<br/>요. 당신의 일에 충분히 집중하고 난 후, 콜라비로 돌아오면 그<br/>동안 동료들이 진행한 업데이트들을 한 눈에 파악할 수 있어<br/>요.</span>
            </p>
        </div>
        <img src="https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/img-3100-c-1.b7c3120e.png" id="img1_cm"/><br/>
    </section>

    <section id="section3_cm">
        <div>
        <!-- </div> style="position:absolute; padding-left: 396px; padding-bottom:10px;"> -->
            <div>
                <img id="deco2_mp" src ="https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/img-3100-c-2-obj.d3800fcd.png"/>
            </div>
            <div id="side_left_sec3"><span class="title_sec3">결국, 시간을 돌려주기 위해 콜라비를 <br/>만들었습니다.</span>
                <p><span class="summary_sec3">콜라비팀에 모인 멤버들은 "시간을 돌려준다."라는 비전 아래<br/>모였습니다. 우리가 할 수 있는 모든 일들 중에 가장 가치있는<br/>일은 시간을 돌려주는 것이라고 공감했기 때문이죠.<br/><br/>
                콜라비는 메신저로 쪼개진 시간을 이어주고, 집중하는 동안 동<br/>료들이 진행했던 일들의 새로운 소식들은 한눈에 파악할 수 <br/>있게 해주고, 몇 가지 검색어로는 찾을 수 없던 파일을 스크롤 <br/>한두 번에 찾을 수 있게 해줌으로써 본업에 충분히 집중할 수 <br/>있도록 만들어 줍니다. 콜라비로 불필요한 시간을 줄이고 협업<br/>의 효율성을 높여 당신과 동료들이 더 가치있는 곳에 시간을 <br/>사용하도록 만들어 보세요.</span>
                </p>
            </div>
        </div>
       <img src="https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/img-3100-c-2.9321bd58.png"id="img2_cm"/>
    </section>
    
    <section id="section4_cm">
        <div id="side_bottom_cm"><div class="title_sec4"><span>무료로 시작해 보세요.</span></div>
            <input type = "text" class="emailVal" placeholder="email@company.com"/>
            <input type="submit" class="free_start_bnt" value="무료로 시작하기"/><!--공란이면 안넘어감-->
            <br/>
            <div class="summary_sec4"><span >이미 가입하셨나요?</span>
                <span class="start_login_bnt">로그인하기</span>
            </div>
        </div>
    </section>
</section>
    









</body>
</html>

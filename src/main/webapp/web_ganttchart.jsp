<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>간트차트</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <style>
    body, *{
        font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
        margin:0;
        padding:0;
        box-sizing: border-box;
        outline:none;
    }
    body{
        height:100%;
        overflow: auto !important;
    }
    a{
        text-decoration:none;
        color:#666666;
    }
    /* 위 */
    .section1_web {
        content: "";
        z-index: -1;
    }
    .collabee_backimg_web{
        display: flex;
        flex-direction: column;
        text-align: center;
        align-items: center;
        justify-content: center;
        background: url(https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/bg-3001-top.f559b0a0.png) center center no-repeat;
        width: 100%;
        min-height:240px;
        margin-top:70px;
    }
    .menubar_web{
        height:70px;
        display:flex;
        justify-content:center;
        background: rgb(255, 255, 255);
        z-index: 1;
        position:fixed; 
        top:0; 
        width:100%; 
        background-color:rgb(255, 255, 255);
    }
    .menubar_web ul li{
        list-style: none;
        z-index: 100;
        font-size: 15px;
        color: rgb(34, 34, 34);
        line-height:70px;
        text-align:center;
        height:70px;
        cursor:pointer;
    }
    .menubar_web ul li:hover{
        color:rgb(217, 173, 43);
    }
    .menubar_web ul {
        margin:0 auto;
        display:flex;
        flex-direction:row;
    }
    .menu_tab li:nth-child(2){
        width:150px;
        color:rgb(34,34,34);
    }
    .menu_tab li:nth-child(2):hover{
        color:rgb(217, 173, 43);
    }
    .menu_tab li:nth-child(2)::after{ /*메신저형 협업툴 옆 점*/
        content: "";
        position: absolute;
        top: 20px;
        background-color: rgb(217, 173, 43);
        width: 8px;
        height: 8px;
        border-radius: 50%;
    }
    .menu_tab li:nth-child(5)::after{ /*로그인 옆에 선*/
        position: absolute;
        top: 25px;
        width: 1px;
        margin-left: 15px;
        height: 20px;
        background-color: rgb(216, 216, 216);
        content: "";
    }
    .menu_tab svg{
        display: inline-block;
        vertical-align: middle;
    }
    .collabee_title_web{
        font-size: 36px;
        font-weight: bold;
        line-height: 1.11;
        color: rgb(255, 255, 255);
    }
    .collabee_summary_web{
        margin-top: 16px;
        font-size: 18px;
        line-height: 1.33;
        color: rgb(255, 241, 201);
    }
    .login_bnt_sec1{
        height: 34px;
        padding: 0px 10px;
        border: 1px solid rgb(217, 173, 43);
        border-radius: 6px;
        background-color: transparent;
        color: rgb(217, 173, 43);
        font-weight: bold;
        font-size: 15px;
        margin: 18px 0px 0px 12px;
        cursor: pointer;
    }
    .login_bnt_sec1:hover{
        background-color:rgb(217, 173, 43);
        color:rgb(255,255,255);
    }
    /* 언제어디서나 */
    .row{
        display:flex;
        flex-direction: row;
    }
    .column{
        display:flex;
        flex-direction:column;
    }
    .txt_style1{
        font-size: 28px;
        line-height: 1.43;
        font-weight: normal;
    }
    .txt_style2{
        font-size: 18px;
        line-height: 1.56;
        color: rgb(102, 102, 102);
    }
    .content_style1{
        overflow-x: hidden;
        position: relative;
        padding: 75px 0px;
    }
    .div_style1{
        padding: 75px 0px;
    }
    /* .div_style2{
        padding-top: 70px;
        margin:0px 0px;
    } */
    .div_style3{
        background: rgb(250, 249, 245);
        padding: 144px 0px;
        text-align: center;
        margin-top: 100px;
        align-items:center;
    }
    .div_style4{
        background:rgb(255,255,255);
        text-align: center;
        align-items:center; 
    }

    /* 무료로그인 */
    .section3_web {
        display:block;
        height:340px;
        background: url(https://cdn.collabee.co/front/collabee.co/hornet/524/static/media/bg-freetrial.8e4e0488.png) center center no-repeat rgb(0, 89, 73);;
        text-align:center;
        display: flex;
        justify-content: center;
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
    <section class="section1_web row">
        <%@ include file="../WEB-INF/include/homepage_menu.jsp" %>
        <div class="collabee_backimg_web">
            <div class="collabee_title_web">간트차트 : 쉽고 빠른 일정 추적과 관리</div>
            <div class="collabee_summary_web"><span>프로젝트 일정을 한눈에 보고 꼼꼼하게 관리해 보세요.</span></div>
        </div>
    </section>
    
    <div class="content_style1 column div_style4">
        <div class="column">
            <span class="txt_style1">프로젝트 일정 추적을 한눈에</span>
            <span class="txt_style2" style="padding:15px;">일정이 등록된 모든 문서들을 간트차트에서 확인할 수 있습니다.<br/>
                간트차트에서 프로젝트를 계획하고 추적하여 꼼꼼하게 관리해 보세요.</span>
        </div>
        <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_3001_10_c1.27ff1e25.png" style="height:754px; margin:40px;"></div>
    </div>
    
    <div class="row div_style1" style="justify-content: center">
        <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_3001_10_c2.56df8b2e.png" style="width:670px;"/></div>
        <div class="column div_style2" style=" margin:35px 40px 35px 50px;">
            <span class="txt_style1">쉽고 간편한 프로젝트 일정 관리</span>
            <span class="txt_style2" style="margin:16px 0px 50px 0px;">일정이 시각화된 타임라인을 보면서 업무를 <br/>쉽게 관리해 보세요. 간단한 조작으로 날짜를 <br/>조정하거나 기간을 수정할 수 있습니다.</span>
        </div>
    </div>
    <div class="row div_style1" style="justify-content: center">
        <div class="column div_style2" style=" margin:35px 50px 35px 40px;">
            <span class="txt_style1" style="margin-bottom:16px;">문서 담당자를 설정해서 <br/>역할을 분담해 보세요.</span>
            <span class="txt_style2">협업공간 문서에 담당자를 설정할 수 <br/>있습니다. 업무 적임자를 찾아 프로젝트를 <br/>체계적으로 관리해 보세요.</span>
        </div>
        <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img_3001_10_c3.94409e12.png" style="width:700px;"/></div>
    </div>



    <div class="content_style1 column div_style3">
        <div class="column div_style2">
            <span class="txt_style1">언제 어디서나</span>
            <span class="txt_style2">근무하는 곳이 아니더라도 모바일로 문서의 진행상황을<br/>
            파악하여 업무를 진행할 수 있습니다.</span>
        </div>
        <div><img src="	https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/img_3001_everywhere.ac06583d.png" style="width:1112px"></div>
    </div>
    
      <section class="section3_web">
        <div style="padding:83px 0px 0px 4px;"><div class="title_sec4"><span>무료로 시작해 보세요.</span></div>
            <input type ="text" class="emailVal" placeholder="email@company.com"/>
            <input type="submit" class="free_start_bnt" value="무료로 시작하기"/><!--공란이면 안넘어감-->
            <br/>
            <div class="summary_sec4"><span >이미 가입하셨나요?</span>
                <span class="start_login_bnt">로그인하기</span>
            </div>
        </div>
      </section>
</body>
</html>
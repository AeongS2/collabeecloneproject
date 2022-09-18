<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>협업공간 생성 및 관리</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <style>
        *{
            box-sizing: border-box;
            outline:none;
        }
 		body, *{
           font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
           margin:0;
           padding:0;
           outline: none;
        }
        .modal_cws{
       	    transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
            display: flex;
            justify-content:center;
            position:fixed;
            margin:0;
            width:100%;
            height:100%;
            background-color:rgba(0, 0, 0, 0.5);
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
            align-items: center;
        }
        .modal_content{
            background-color: #fff;
            margin:15% auto;
            width:80%;
        }
        #create_workspace{
            width:580px;
            height:445px;
            max-width:600px;
            max-height:calc(100% - 96px);
            border-radius: 4px;
            margin: 48px;
            background-color: #fff;
            display: flex;
            position: relative;
            overflow-y: auto;
            flex-direction: column;
            flex: 0 1 auto;
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        }
        #container1_cws{
            height: 445px;
            border-radius: 4px;
            box-shadow: rgb(0 0 0 / 10%) 0px 0px 8px 2px;
            background-color: var(--white);
            padding: 28px;
            display: flex;
            flex-direction: column;
            -webkit-box-pack: justify;
            justify-content: space-between;
        }
        .header_cws{
            display:flex;
            justify-content:space-between;
            margin-top:3px;
        }
        .header_cws span{
            font-size: 16px;
            font-weight: bold;
        }
        .header_cws p{
            font-size: 12px;
            color: rgb(34, 34, 34);
            line-height: 1.55;
            color: rgb(136, 136, 136);
            margin-top:4px;
        }
        .header_summary{
        	font-size: 12px;
		    line-height: 1.5;
		    color: rgb(136, 136, 136);
        }
        #create_workspace .closing_bnt{
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            transition: fill 0.2s ease 0s;
            background-color: transparent;
            fill: rgb(136, 136, 136);
            border:none;
        }
        #create_workspace .closing_bnt:hover{
            fill:rgb(86, 86, 86);
        }
        #create_workspace label{
            display: block;
            font-size: 12px;
            font-weight: bold;
            color: rgb(136, 136, 136);
            padding-bottom: 10px;
        }
        #setname_cws{
            width: 100%;
            padding-bottom: 10px;
            font-size: 20px;
            line-height: 1.5;
            border-top: none;
            border-right: none;
            border-left: none;
            border-image: initial;
            border-bottom: 1px solid rgb(225, 225, 225);
            transition: border-bottom-color 0.2s ease 0s;
            background-color:#fff;
            color:rgb(34, 34, 34);
            overflow: visible;
            outline: 0;
        }
        #setsummary_cws{
            width:100%;
            border-radius: 4px;
            padding-bottom:40px;
            padding-top:15px; 
            padding-left:12px;
            font-size: 14px;
            border: 1px solid rgb(225, 225, 225);
            overflow: auto;
            resize: none;
            outline: 0;
        }
        #setname_cws::placeholder{
            color:rgb(193, 193, 193);
        }
        textarea::placeholder{
            font-size: 14px;
            color:rgb(193, 193, 193);
        }
        #cancel_bnt_cws{
            font-size: 14px;
            padding-right: 27px;
            padding-left: 27px;  
            margin-right: 5px;   
            background-color: transparent;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            color: rgb(136, 136, 136);
            line-height: 1.5;
            border:none;
        }
        #cancel_bnt_cws:hover{
        	color:rgba(136, 136, 136, 0.8);
        }
        #create_bnt_cws{
            font-size: 14px;
            padding: 5px 32px;
            position: relative;
            color: rgb(255, 255, 255);
            font-weight: 500;
            line-height: 1.5;
            border-radius: 4px;
            transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
            border: 1px solid rgb(51, 132, 108);
            background-color: rgb(51, 132, 108);
            cursor: pointer;
            text-align: center;
        }
        #create_bnt_cws:hover{
            background-color: rgb(42, 98, 81);
            border-color: rgb(42, 98, 81);
        }
        #cnt1, #cnt2, #cnt3, #cnt4{
            color: rgb(51, 132, 108);
        }
        .cnt_cws{
            color: rgb(136, 136, 136);
            line-height: 1.5;
            font-size: 12px;
            padding: 3px 0px 9px 4px;
            transition: opacity 0.2s ease 0s;
        }
        #footer_cws{
            display: flex;
            flex-direction: row;
            -webkit-box-pack: end;
            justify-content: flex-end;
            line-height: 1;
        }
        .hidden{
            visibility: hidden;
            opacity:0;
        }
        .none{
            display:none;
            opacity:0;
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
            padding:16px;
            overflow:auto;
            line-height:1.5;
            display:none;
            z-index:200;
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        }
        .closed{
            margin-left:20px;
            float:right;
            cursor:pointer;
        }
      
    </style>
   
   
<!-- 여기부터 mws -->
    <style>
        .modal_mws{
            position:fixed;
            margin:0;
            width:100%;
            height:100%;
            background-color:rgba(0, 0, 0, 0.8);
            box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
            align-items: center;
            box-sizing:border-box;
        }
        .modal_content_mws{
            background-color: rgb(255, 255, 255);
            width: 580px;
            height: 580px;
            inset: calc(50% - 260px) 40px 40px calc(50% - 265px);
        }
        #mws{
            padding:0;
            margin:0;
            overflow: hidden;
            font-size: 13px;
            color: #222;
            outline: none;
        }
        #mws button{
            border:none;
        }
        #manage_workspace{ /* section */ 
            border: 1px solid rgb(204, 204, 204);
            background: rgb(255, 255, 255);
            border-radius: 4px;
            overflow:auto;
        }
        #manage_workspace header{
            margin: 0px 28px;
            padding-top: 29px;
        }
        #manage_workspace .closing_bnt{
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            transition: fill 0.2s ease 0s;
            background-color: transparent;
            fill: rgb(136, 136, 136);
            border:none;
        }
        #manage_workspace .closing_bnt:hover{
            fill:rgb(86, 86, 86);
        }
        .tab_mws{
            margin:13px 28px;
            border-bottom: 1px solid rgb(225, 225, 225);
        }
        .ontab_mws{
            all: unset;
            cursor: pointer;
            font-size: 12px;
            margin-right: 20px;
            padding-bottom: 8px;
            padding-top: 6px;
            transition: color 0.2s ease 0s, border-color 0.2s ease 0s;
            font-weight: bold;
            color: rgb(51, 132, 108);
            border-bottom: 1px solid rgb(51, 132, 108);
        }
        .untab_mws:hover{
            color: rgb(51, 132, 108);
        }
        .untab_mws{ /*클릭 해제되면*/
            all: unset;
            cursor: pointer;
            font-size: 12px;
            margin-right: 24px;
            padding-bottom: 7px;
            padding-top: 6px;
            transition: color 0.2s ease 0s, border-color 0.2s ease 0s;

            color: rgb(136, 136, 136);
            border-bottom: 1px solid transparent;
        }
        #name_mws{
            width: 517px;
            height:42px;
        }
        #setname_mws{
            width:94%;
            font-size: 13px;
            border: none;
            transition: border-bottom-color 0.2s ease 0s;
            background-color:#fff;
            color:rgb(34, 34, 34);
            overflow: hidden;
            outline:none;
        }
        #summary_mws{
            width:517px;
            height:42px;
        }
        #setsummary_mws{
            width:94%;
            border:none;
            font-size: 13px;
            overflow: hidden;
            outline:none;
        }
        .save_mws{
            font-size: 14px;
            line-height: 1.5;
            background-color: transparent;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            color:rgb(51, 132, 108);
         
            pointer-events: auto;
        }
        .save_mws:hover{
            color: rgb(42, 98, 81);
        }
        .cancel_mws{
            font-size: 14px;
            line-height: 1.5;
            background-color: transparent;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            color: rgb(136, 136, 136);
            pointer-events: auto;
        }
        .input_label{
            font-size: 12px;
            color: rgb(136, 136, 136);
            margin-top: 6px;
            line-height: 1.5;
            font-weight: bold;
            margin-left:30px;
        }
        .input_sec{
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
            transition: border-color 0.2s ease 0s;
            border-bottom: 1px solid rgb(225, 225, 225);
            margin:8px 28px;
        }
        .cnt_mws{
            color: rgb(136, 136, 136);
            line-height: 1.5;
            font-size: 12px;
            padding: 3px 0px 9px 30px;
            transition: opacity 0.2s ease 0s;
        }
        #link_copy_mws svg{
            position:absolute;
            background-color:transparent;
            margin-right:65px;
            cursor:pointer;
        }
        #link_copy_mws svg path:hover{
            fill:rgb(42, 98, 81);
        }    
        #link_copy_mws button{
            position:absolute;
            background-color:transparent;
        }
        #link_copy_mws{
            width:93px;
            height:41px;
            position:absolute;
            margin-left: 440px;
            display: flex;
            flex-direction: row;
            justify-content:flex-end;
            margin-top: 20px;
        }
        #invite_link_mws{
            display:flex;
            border:1px solid rgb(225, 225, 225);
            border-radius:4px;
            flex-direction: row;
            transition: border-color 0.2s ease 0s;
            margin: 10px 0px 6px 30px;
            padding-left: 12px;
            background-color: rgb(250, 250, 250);
            cursor: copy;
            width:517px;
            height:43px;
            outline: none;
        }
        #invite_link_mws:hover{
            border:1px solid rgb(51, 132, 108);
        }
        /*input이 체크되먄 div bottom과 save/cancel버튼이 활성화*/
        /* input:checked{ 
    		border-bottom:1px solid rgb(51, 132, 108);
		} */
        .input_radio{
            font-size: 14px;
            color: rgb(34, 34, 34);
            margin-left:30px;
        }
        /* 선택되면 */
        .on_sel{
            position: relative;
            cursor: pointer;
            z-index: 2;
            flex: 0 0 50%;
            font-size: 14px;
            text-align: center;
            padding: 0px 3px;
            transition: color 0.2s ease-in 0s;
            color: rgb(255, 255, 255);
            background-color:transparent;
        }
        /* 선택 안됐을때 */
        .off_sel{
            position: relative;
            cursor: pointer;
            z-index: 2;
            flex: 0 0 50%;
            font-size: 14px;
            text-align: center;
            padding: 0px 3px;
            transition: color 0.2s ease-in 0s;
            color: rgb(193, 193, 193);
            background-color:transparent;
        }
       
        .select_bnt_mws{
            z-index:1;
            position: absolute;
            width: 100px;
            height: 38px;
            border-radius: 4px;
            box-shadow: rgb(0 0 0 / 30%) 1px 0px 5px 0px;
            border: 1px solid rgb(51, 132, 108);
            background-color: rgb(51, 132, 108);
            transition: transform 0.3s ease-out 0s;
            transform: translateX(0px);
        }
        .container2_mws{
            display: flex;
            flex-direction: row;
            padding-bottom: 30px;
            border-bottom: 1px solid rgb(225, 225, 225);
            margin-top: 30px;
            align-items:center;
        }
        .container3_mws{
            z-index:0;
            position: relative;
            display: flex;
            flex-direction: row;
            width: 200px;
            height: 38px;
            border-radius: 4px;
            border: 1px solid rgb(225, 225, 225);
            background-color: rgb(255, 255, 255);
            -webkit-box-align: center;
            align-items: center;
            margin-left:20px;
            cursor:pointer;
        }
        #del_mws{
            font-size: 14px;
            line-height: 1.5;
            background-color: transparent;
            cursor: pointer;
            transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
            color: rgb(237, 84, 84);
            pointer-events: auto;  
            margin:30px 0px 20px 30px;
        }



        .scroll_bar_mws{
            /* background: #f7f6f5; */
            position: fixed;
            overflow-y:auto;
        }
        .scroll_bar_mws::-webkit-scrollbar{
            width:4px;
        }
        .scroll_bar_mws::-webkit-scrollbar-thumb{
            border-radius: 2px;
            background-color: #e1e1e1;
            height:60%;
        }
        #workspace_del_mws{
            font-size:12px;
            color:rgb(34, 34, 34);
            margin:30px;
        }
        #insert_pw_mws{
            margin:30px 0px;
        }
        #pw_mws{
            border: 1px solid rgb(225, 225, 225);
            width: 100%;
            height: 42px;
            border-radius: 4px;
            transition: border-color 0.2s ease 0s;
            font-size: 12px;
            color: rgb(136, 136, 136);
            line-height: 1.5;
            margin-bottom:6px;
            padding:0px 20px;
        }
        #pw_mws::placeholder{
            font-weight:bold;
        }
        #pw_mws + label{
            color: rgb(136, 136, 136);
        }
        #pw_mws:focus{
        	    border-color: rgb(51, 132, 108);
        }
        #del_bnt_mws{
            margin-top:30px;
            display:flex;
            justify-content:flex-end;
            font-size: 14px;
            font-weight: normal;
        }
        #del_cancel_mws{
            color: rgb(136, 136, 136);
            border:none;
            outline:none;
            cursor: pointer;
            background-color:rgb(255, 255, 255);
            padding: 10px 2px 10px 8px
        }
        #del_cancel_mws:hover{
        	color: rgba(136, 136, 136, 0.8);
        }
        #del2_mws{
            color:rgb(255,255,255);
            border-radius: 4px;
            border:1px solid rgb(237, 84, 84);
            background-color:rgb(237, 84, 84);
            cursor: pointer;
            margin-left: 30px;
            padding: 10px 32px;
            transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
        }
        #del2_mws:hover{
        	background-color: rgb(189, 2, 25);
   			border-color: rgb(189, 2, 25);
        }
        .hidden{
            visibility: hidden;
            opacity:0;
        }
    </style>
    <script>
        

    </script>

<!-- 여기부터 mbws -->
    <style>
        #manage_member_workspace{
            border: 1px solid rgb(204, 204, 204);
            border-radius: 4px;
            margin-top: 157px;
            margin:0;
            position:relative;
        }
        #mbws header{
            margin:0px 28px;
            padding-top: 29px;
        }
        #manage_member_workspace .closing_bnt{
            padding-left: 0;
            padding-right: 0;
            cursor: pointer;
            transition: fill 0.2s ease 0s;
            background-color: transparent;
            fill: rgb(136, 136, 136);
            border:none;
        }
        #manage_member_workspace .closing_bnt:hover{
            fill:rgb(86, 86, 86);
        }
        #tab_mbws{
            margin:13px 28px;
            border-bottom: 1px solid rgb(225, 225, 225);
        }
        /* 검색창부터 끝까지 */
        #container1_mbws{ 
        	position: relative;
		    height: calc(462px);
            display: flex;
            flex-direction: column;
        }
        #container2_mbws{
            margin-top: 15px;
            padding-left: 14px;
            padding-right: 14px;
            height: 326px;
            position:relative;
        }
        #search_member_mbws{
            width: 99%;
            height: 41px;
            border-radius: 4px;
            border: 1px solid rgb(225, 225, 225);
            padding-left: 12px;
            padding-right: 42px;
            color: rgb(34, 34, 34);
            font-size: 14px;
        }
        ::placeholder{
            color:rgb(193, 193, 193);
        }
        #search_member_mbws:focus{
            border-color: rgb(136, 136, 136);
        }
        #box_mbws{
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding-left: 23px;
            padding-right: 31px;
        }
        #del_bnt_mbws{
            position: absolute;
            margin-right:8px;
        }
        #del_bnt_mbws svg{
            padding-left: 0px;
            padding-right: 0px;
            display:inline-block;
            transition: fill 0.2s ease 0s;
            background-color: transparent;
        }
        #member_list_mbws{
            display: flex;
            flex-flow: row wrap;
            margin-top: 5px;
        }
        .profile_mbws{
            flex: 0 0 50%;
            display: flex;
            flex-direction:row;
            -webkit-box-pack: justify;
            padding: 10px 10px;
        }
       .pf1_mbws{
            display: flex;
            flex-direction: row;
            -webkit-box-align: center;
            align-items: center;
            flex: 1 0 auto;
       }
       .pf1_mbws > div{
            display: flex;
            flex-direction: column;
            margin-left: 8px;
            font-size: 12px;
            width: 140px;
       }
       .pf2_mbws{
            flex: 0 0 60px;
            display: flex;
            flex-direction: row;
            -webkit-box-pack: end;
            justify-content: flex-end;
            padding-top: 3px;
            padding-right: 10px;
       }
       .pf2_mbws svg{
            margin-left: 3px;
            margin-right: 3px;
       }
       .picture_mbws{
            display: block;
            top: 0px;
            left: 0px;
            background-color: rgb(255, 255, 255);
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-size: cover;
            background-position: center center;
            content: "";
            border: 1px solid rgba(0, 0, 0, 0);
            transition: border-color 0.3s ease 0s;
       }
       .name_nbws {
            padding-top: 2px;
            color: rgb(34, 34, 34);
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
       }
       .email_mbws{
            padding-top: 5px;
            color: rgb(136, 136, 136);
            white-space: nowrap;
            text-overflow: ellipsis;
            overflow: hidden;
        }
        .footer_mbws{
            display: flex;
            flex-direction: row;
            align-items: center;
            justify-content: flex-end;
            padding-right:31px;
            margin-top: 14px;
        }
        .footer_mbws > label{
            display:flex;
            position:relative;
            z-index: 10;
            font-size: 14px;
            padding: 10px 32px;
            font-weight: normal;
            color:rgb(255, 255, 255);
            cursor: pointer;
        }
        #invite_bnt_mbws{
            width:155.5px;
            height:43.5px;
            position:absolute;
            border-radius: 4px;
            transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
            background-color: rgb(51, 132, 108);
            cursor: pointer;
            border:none;
        }
        #invite_bnt_mbws:hover{
            background-color: rgb(42, 98, 81);
            border-color: rgb(42, 98, 81);
        }
    </style>
    
    <style>
    .setting_mbws{
        width: 190px;
        border-radius: 4px;
        box-shadow: rgb(0 0 0 / 10%) 0px 0px 6px 2px;
        border: 1px solid rgb(225, 225, 225);
        top: 0px;
        left:0px;
        z-index: 3;
        position: absolute;
        background-color: rgb(255, 255, 255);
        padding: 12px 0px;
    }
    .setting_mbws li{
        list-style-type:none;
        cursor: pointer;
        box-sizing: border-box;
        width: 100%;
        background-color: rgb(255, 255, 255);
        font-size: 13px;
        color: rgb(34, 34, 34);
        padding: 8px 0px 8px 18px;
        transition: background-color 0.2s ease 0s;
    }
    .setting_mbws li:hover{
        background-color: rgb(242, 242, 242);
    }
	</style>
</head>

<body>
<button class="create_workspace_bnt">새협업공간 만들기</button> <!-- 이거땜에 멤버관리탭 위치 좀 바뀜 -->

    <!-- 모달창 학원에서 위치조정할것!!-->
<div class="modal_cws none" id="cws">
    <section id="create_workspace" class="modal_content">
    <div id="container1_cws">
        <header>
            <div class="header_cws">
	            <span>새 협업공간 만들기</span>
	            <button class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></button>
            </div>
            <p class="header_summary">협업공간은 함께 일하는 멤버들끼리만 자료를 공유하고 협업할 수 있는 공간입니다.<br/>
                협업공간을 만들고 함께 일할 멤버들을 초대해보세요.</p>
        </header>
        <div id="container2_cws">
            <div>
                <label for="setname_cws">협업공간 이름</label>
                <input type="text" id="setname_cws" maxlength="29" placeholder="콜라비 디자인 리뉴얼"/>
            </div>
            <div id="name_cnt_cws" class="cnt_cws hidden"><span id="cnt1">0</span><span> / 28</span></div>
            <!--  -->
            <div>
                <label for="setsummary_cws">협업공간 설명</label>
                <textarea id="setsummary_cws" maxlength="101" placeholder="콜라비 서비스 디자인 개선 협업공간"></textarea>
            </div>
            <div id="summary_cnt_cws" class="cnt_cws hidden"><span id="cnt2">0</span><span>/ 100</span></div>
            <!--  -->
            <footer id="footer_cws">
                <button id="cancel_bnt_cws">취소</button>
                <button id="create_bnt_cws">만들기</button>
            </footer>    
        </div>
    </div>
    </section>
    <script>
    var login_id = 4;
    var g_d;
     $(document).ready(function() {
    	 $(".create_workspace_bnt").click(function(){
         	$("#cws").removeClass("none");
         });
    	 
    	 
         var x = "<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
        //협업공간이름 글자수
        $("#setname_cws").on("keyup", function(){
        	$("#name_cnt_cws").removeClass("hidden"); //글자수 뜨기
            var length = $(this).val().length;
            $("#cnt1").html(length);
            
            if(length > 28) {
                var alert_message = $(".alert").html(x+"협업공간 이름은 28자까지 설정할 수 있습니다.");
                $("#cnt1").html(28);
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut() //3초후에 자동으로 닫힘
                    }, 3000);
		            //안내메세지 높이
		            var height = alert_message.prop("scrollHeight");
		            alert_message.css("height", height);
                });
            } else if(length==0){
            	$("#name_cnt_cws").addClass("hidden");
            }
            
        });
        
         //협업공간이름 안쓰고 만들기 누르면
		$("#create_bnt_cws").click(function(){
        	var length = $("#setname_cws").val().length;
            if(length == 0) {
                var alert_message = $(".alert").html(x+"협업공간 이름은 1글자 이상 입력해야 합니다.");
                alert_message.fadeIn(function(){
	                setTimeout(function() {
                    alert_message.fadeOut() //3초후에 자동으로 닫힘
                }, 3000);
	            //안내메세지 높이
	            var height = alert_message.prop("scrollHeight");
	            alert_message.css("height", height);
               });
	        } else {//잘 만들어졌으면
	            var title = $("#setname_cws").val();
	            var summary = $("#setsummary_cws").val();
				$("#cws").addClass("none");
	          	$("#name_cnt_cws, #summary_cnt_cws").addClass("hidden");
	            $("#invite_member").removeClass("none");
	            
	            $.ajax({
	            	type:"get",
	            	url:"NewWorkspaceServlet",
	            	data:{
	            		"title" : title,
	            		"summary" : summary,
	            		"loginId" : login_id
	            	},
	            	datatype:"json",
	            	success:function(data){
	            		if(data.result == 1){
				          	var alert_message = $(".alert").html(x+title +" 협업공간이 생성되었습니다.");
				            alert_message.fadeIn(function(){
					            setTimeout(function() {
									alert_message.fadeOut() //3초후에 자동으로 닫힘
					            }, 3000);
					            //안내메세지 높이
					            var height = alert_message.prop("scrollHeight");
					            alert_message.css("height", height);
				            		});
	            		}
	            		
	            	},
	            	error:function(r,s,e) {
	            		alert("다시 시도해 주세요.");
	            	}
	            });
	            
        	$("#setname_cws, #setsummary_cws, #cnt1, #cnt2").val("");
			}//멤버초대 모달이 이어서 뜸
        });   
		        
        //설명 글자수
        $('#setsummary_cws').on('keyup', function() {
       	$("#summary_cnt_cws").removeClass("hidden");
           var length=$(this).val().length;
           $('#cnt2').html(length);

           if(length > 100) {
               var alert_message = $(".alert").html(x+"협업공간 설명은 100자까지 입력할 수 있습니다.");
               $("#cnt2").html(100);
               alert_message.fadeIn(function(){
                   setTimeout(function() {
                       alert_message.fadeOut(); //3초후에 자동으로 닫힘
                   }, 3000);
            	//안내메세지 높이
	            var height = alert_message.prop("scrollHeight");
	            alert_message.css("height", height);
               });
           } else if(length==0){
           	 $("#summary_cnt_cws").addClass("hidden");
           }
       });
  
       $("#setname_cws").click(function() {
           $(this).css("border-bottom-color", "rgb(51, 132, 108)").css("outline", "none");
       });
       $("#setname_cws").blur(function() {
           $(this).css("border-bottom-color", "rgb(225, 225, 225)");
       });
       $("#setsummary_cws").click(function() {
           $(this).css("border-color", "rgb(51, 132, 108)").css("outline", "none");
       });
       $("#setsummary_cws").blur(function() {
           $(this).css("border-color", "rgb(225, 225, 225)");
       });

        //모달 닫기버튼
        $("#cancel_bnt_cws, #cws .closing_bnt").click(function(){
		$("#cws").addClass("none");     
        	$("#setname_cws, #setsummary_cws, #cnt1, #cnt2").val("");
        	$("#name_cnt_cws, #summary_cnt_cws").addClass("hidden");
        });
		       
        //다른데 누르면 닫힘
        $("#cws").on("click", function(e){
        	if($(this).is(e.target)){
				$(this).addClass("none");
				$("#setname_cws, #setsummary_cws, #cnt1, #cnt2").val("");
	         	$("#name_cnt_cws, #summary_cnt_cws").addClass("hidden");
        	}
        });
    });
    </script>
<!-- 협업공간 만들기 모달창 끝 -->
</div>



<!-- 협업공간 관리 페이지 시작-->

<!--협업공간 정보 -->
<button id="setting_ws">협업공간 관리</button>
<div class="alert"><svg viewBox="0 0 24 24" width="24px" height="24px" class="closed"><path fill="rgb(255,255,255)" d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></div>

<div class="modal_mws none" id="mws">
    <section class="modal_content_mws scroll_bar_mws" id="manage_workspace">
    <header>
        <div class="header_cws">
            <span>협업공간 관리</span>
            <button class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></button>
        </div>    
    </header>
    <div>
        <div class="tab_mws">
            <button id="tab1_mws" class="ontab_mws" style="border-bottom: 1px solid rgb(51, 132, 108);">협업공간 정보</button>
            <button id="tab2_mws" class="untab_mws">멤버 관리</button>
        </div>
        <div id="container1_mws">
            <label for="setname_mws" class="input_label">협업공간 이름</label>
            <div id="name_mws" class="input_sec">
                <input type="text" id="setname_mws" maxlength=28 placeholder="콜라비 디자인 리뉴얼"/>
                <button class="save_mws">수정</button>
            </div>
            
            <div id="name_cnt_mws" class="cnt_mws hidden"><span id="cnt3" class="text_cnt_cws">0</span> / 28</div>
            
            <label for="setsummary_mws" class="input_label">협업공간 설명</label>
            <div id="summary_mws" class="input_sec">
                <input type="text" id="setsummary_mws" maxlength=100 placeholder="콜라비 서비스 디자인 개선 협업공간">
                <button class="save_mws">수정</button>
            </div>
            
            <div id="summary_cnt_mws" class="cnt_mws hidden"><span id="cnt4" class="text_cnt_cws">0</span> / 100</div>
            <div>
                <label for="invite_link_mws" class="input_label">초대 설정</label>
                <div id="link_copy_mws">
                    <svg width="22px" height="22px" viewBox="0 0 24 24"><path fill="rgb(51, 132, 108)" fill-rule="evenodd" d="M17.65 6.35A7.958 7.958 0 0 0 12 4c-4.42 0-7.99 3.58-7.99 8s3.57 8 7.99 8c3.73 0 6.84-2.55 7.73-6h-2.08A5.99 5.99 0 0 1 12 18c-3.31 0-6-2.69-6-6s2.69-6 6-6c1.66 0 3.14.69 4.22 1.78L13 11h7V4l-2.35 2.35z"></path></svg>
                    <button class="save_mws">링크복사</button>
                </div>
                <input type="text" id="invite_link_mws" value="https://collabee.dsdof.com" readonly/>
                <span class="input_label">초대 링크를 통해 접근한 사용자는 관리자가 승인을 하면 협업공간에 접근을 할 수 있습니다.</span>
            </div>

            <div class="container2_mws">
                <div>
                    <div class="input_radio">보안 등급 대외비 설정</div>
                    <div class="input_label">대외비로 설정 시 문서를 다른 협업공간으로 복제할 수<br/>없습니다.</div>
                </div>
                <div class="container3_mws">
                    <div class="select_bnt_mws"></div>
                    <button id="unconfidential_mws"  class="on_sel">일반</button>
                    <button id="onconfidential_mws" class="off_sel">대외비</button>
                </div>
            </div>
            <div class="container2_mws">
                <div>
                    <div class="input_radio">협업공간 완료 설정</div>
                    <div class="input_label">설정 시 모든 멤버에게 현재 협업공간의 알림을 전송하<br/>지 않습니다.</div>
                </div>
                <div class="container3_mws">
                    <div class="select_bnt_mws"></div>
                    <button id="nocomplete_mws"class="on_sel">진행 중</button>
                    <button id="complete_mws" class="off_sel">완료</button>
                    
                </div>
            </div>

            <div><button id="del_mws">협업공간 삭제</button></div>
        
           <div id="workspace_del_mws" class="none">
               <div>
                    <p>
                        GUQ 협업공간을 삭제하면 이 협업공간에 등록된 문서 및 컨텐츠가 모두 삭제 되며 복구할 수<br/>없습니다. 또한 관리자를 포함한 모든 멤버는 이 협업공간에 접근할 수 없게 됩니다. 
                    </p>
               </div>
               <div id="insert_pw_mws">
                   <input type="text" id="pw_mws" placeholder="비밀번호를 입력해 주세요.">
                   <label for="pw_mws">협업공간 삭제 요청을 완료하려면 콜라비 계정 비밀번호를 입력해 주세요.</label>
               </div>
               
               <div>
                   <p>모든 관리자에게 동의를 받아야 협업공간 삭제가 완료됩니다.<br/>
                    1명의 관리자라도 동의하지 않으면 협업공간 삭제 요청은 무효가 됩니다.<br/>
                    협업공간 삭제 요청 버튼을 누르면, 모든 관리자에게 동의 요청이 전송됩니다.
                   </p>
               </div>
               <div id="del_bnt_mws">
                   <button id="del_cancel_mws">취소</button>
                   <button id="del2_mws">협업공간 삭제 요청</button>
                </div>
               
           </div>
        </div>
    </div>
    </section>
</div>

<script>
	$(function(){
	 	var x = "<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
		
	 	$("#setting_ws").click(function(){
			$("#mws").removeClass("none");
		});
	        
        //협업공간 정보 누름
        $("#tab1_mbws").click(function(){
            $(this).addClass("ontab").removeClass("untab");
            $("#mws").removeClass("none");
            $("#mbws").addClass("none");
        });
        
        //멤버관리 누름
        $("#tab2_mws").click(function(){
            $(this).addClass("ontab").removeClass("untab");
            $("#mws").addClass("none");
            $("#mbws").removeClass("none");
        });
		
        //이름,설명 수정시 활성화
        $(".input_sec").on("click",function(){
            $(this).css("border-bottom","1px solid rgb(51, 132, 108)");
            $(this).find(".save_mws").html("저장");
            $(this).next().removeClass("hidden");    
        });
        
        //저장 누르면 활성화 사라짐
        $(document).on("click", ".input_sec .save_mws", function(){
            var length = $("#setname_mws").val().length;
            if(length==0){
                var alert_message = $(".alert").html(x+"협업공간 이름은 1글자 이상 입력해야 합니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                         alert_message.fadeOut(); //3초후에 자동으로 닫힘
                    }, 3000);
                });
            } else {
            	var id = $(this).siblings().attr("id");
            	var label = $("label[for='"+id+"']").text();//수정한 input
            
                var alert_message = $(".alert").html(x+label+"이 변경되었습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut(); //3초후에 자동으로 닫힘
                    }, 3000);
                });
                $(this).html("수정");
                $(this).parent().css("border-bottom","1px solid rgb(225,225,225)");
                $(this).parent().siblings(".cnt_mws").addClass("hidden");
            }
            //안내메세지 높이
            var height = alert_message.prop("scrollHeight");
            alert_message.css("height", height);
        });    
        
        //안내창 x누르면 닫기
        $(document).on("click",".alert .closed", function(){
            var alert_message = $(".alert");
            alert_message.fadeOut();
        });
        
        //협업공간 이름 글자수
        $("#setname_mws").on("keyup", function(){
            var length = $(this).val().length;
            $("#cnt3").html(length);
            if(length >= 28) {
            	$("#cnt3").html(28);
                var alert_message = $(".alert").html(x+"협업공간 이름은 28자까지 설정할 수 있습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut(); //3초후에 자동으로 닫힘
                    }, 3000);
                    //안내메세지 높이
                    var height = alert_message.prop("scrollHeight");
                    alert_message.css("height", height);
                });
            } 
        });

        //설명 글자수
        $('#setsummary_mws').on('keyup', function() {
            var length=$(this).val().length;
            $("#cnt4").html(length);

            if(length >= 100) {
            	$("#cnt4").html(100);
                var alert_message = $(".alert").html(x+"협업공간 설명은 100자까지 입력할 수 있습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut(); //3초후에 자동으로 닫힘
                    }, 3000);
                    //안내메세지 높이
                    var height = alert_message.prop("scrollHeight");
                    alert_message.css("height", height);
                });
            }
        });

        //링크복사
        var linkBnt=$("#invite_link_mws").parent().find(".save_mws");
        $("#invite_link_mws, #link_copy_mws .save_mws").on("click", function(){
            var alert_message = $(".alert").html(x+"초대링크가 복사되었습니다. 초대링크를 공유하여 멤버를 초대하세요.")
            alert_message.fadeIn(function(){
                setTimeout(function() {
                    alert_message.fadeOut(); //3초후에 자동으로 닫힘
                }, 3000);
                //안내메세지 높이
                var height = alert_message.prop("scrollHeight");
                alert_message.css("height", height);
            });
            var url=$("#invite_link_mws").select();
       		document.execCommand("copy");
        });
    
        //버튼 슬라이드
        $("#onconfidential_mws, #complete_mws").on("click", function(){
        	var text = $(this).text();
        	
        	if(text=="대외비") {
        		var alert_message = $(".alert").html(x+"대외비 협업공간으로 변경되었습니다. 협업공간 내 문서를 협업공간으로 복제할 수 없습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut() //3초후에 자동으로 닫힘
                    }, 3000);
                //안내메세지 높이
                var height = alert_message.prop("scrollHeight");
                alert_message.css("height", height);
                });
        	} else if(text=="완료"){
        		if(confirm("협업공간의 진행상태를 완료로 변경하시겠습니까? 변경하면 협업공간 활동알림을 모든 멤버가 받으실 수 없습니다.")==true){
	        		var alert_message = $(".alert").html(x+"협업공간이 완료상태로 변경되었습니다. 이제부터 모든 멤버가 협업공간 내 활동알림을 받을 수 없습니다.");
	                alert_message.fadeIn(function(){
	                    setTimeout(function() {
	                        alert_message.fadeOut() //3초후에 자동으로 닫힘
	                    }, 3000);
	                //안내메세지 높이
	                var height = alert_message.prop("scrollHeight");
	                alert_message.css("height", height);
                	});
        		} else {
        			return;
        		}
        	}
            $(this).siblings(".select_bnt_mws").css("transform","translateX(100%)");
            $(this).css("color","rgb(255, 255, 255)");
            $(this).siblings(".on_sel").css("color","rgb(193, 193, 193)");
        });
        $("#unconfidential_mws, #nocomplete_mws").on("click", function(){
			var text = $(this).text();
        	
        	if(text=="일반") {
        		var alert_message = $(".alert").html(x+"협업공간이 일반 협업공간으로 설정되었습니다.");
                alert_message.fadeIn(function(){
                    setTimeout(function() {
                        alert_message.fadeOut(); //3초후에 자동으로 닫힘
                    }, 3000);
                //안내메세지 높이
                var height = alert_message.prop("scrollHeight");
                alert_message.css("height", height);
                });
        	} else if("진행 중"){
        		if(confirm("협업공간의 진행상태를 '진행중'으로 변경하시겠습니까? 변경 시, 협업공간 내 활동알림을 모든 멤버가 받게 됩니다.")==true){
	        		var alert_message = $(".alert").html(x+"협업공간이 진행 중으로 변경되었습니다.");
	                alert_message.fadeIn(function(){
	                    setTimeout(function() {
	                        alert_message.fadeOut(); //3초후에 자동으로 닫힘
	                    }, 3000);
	                //안내메세지 높이
	                var height = alert_message.prop("scrollHeight");
	                alert_message.css("height", height);
	                });
        		} else {
        			return;
        		}
        	}
            $(this).siblings(".select_bnt_mws").css("transform","translateX(0px)");
            $(this).css("color","rgb(255, 255, 255)");
            $(this).siblings(".off_sel").css("color","rgb(193, 193, 193)");
        });
        
        //협업공간 삭제 누르면 삭제 안내 뜨기
		$("#del_mws").click(function(){
        	$(this).addClass("none");
        	$("#workspace_del_mws").removeClass("none");
		});	
		
        //비번 안눌렀으면 삭제 요청 막기
        $("#del2_mws").click(function(){
        	var pwCnt = $("#pw_mws").val().length;
        	if(pwCnt==0){//비번 안썼으면
        		 var alert_message = $(".alert").html(x+"비밀번호를 입력해 주세요")
                 alert_message.fadeIn(function(){
                     setTimeout(function() {
                         alert_message.fadeOut() //3초후에 자동으로 닫힘
                     }, 3000);
                     //안내메세지 높이
                  var height = alert_message.prop("scrollHeight");
                  alert_message.css("height", height);
                 });
        	} else { //비번 썼으면
        		if(confirm("협업공간을 삭제하시겠습니까? 협업공간을 삭제하면 모든 문서와 컨텐츠가 삭제되어 복구할 수 없으며 모든 멤버가 접근할 수 없습니다.")==true){
        		//확인-> 비번 틀리면(해야됨) 
        		 var alert_message = $(".alert").html(x+"비밀번호가 일치하지 않습니다.")
                 alert_message.fadeIn(function(){
                     setTimeout(function() {
                         alert_message.fadeOut(); //3초후에 자동으로 닫힘
                     }, 3000);
                     //안내메세지 높이
	                  var height = alert_message.prop("scrollHeight");
	                  alert_message.css("height", height);
                 });
        		
        		//확인-> 비번 맞으면, 협업공간 삭제되고 메인으로 감
        		 var alert_message = $(".alert").html(x+"협업공간이 삭제되었습니다.")
                 alert_message.fadeIn(function(){
                     setTimeout(function() {
                         alert_message.fadeOut(); //3초후에 자동으로 닫힘
                     }, 3000);
                     //안내메세지 높이
                  var height = alert_message.prop("scrollHeight");
                  alert_message.css("height", height);
                 });
        		location.href="메인으로";
        		} else {//취소하면
        			return;
        		}
        	}
        	});
        
        //취소누르면 삭제안내 사라짐
		$("#del_cancel_mws").click(function(){
			$("#workspace_del_mws").addClass("none");
			$("#del_mws").removeClass("none");
			$("#pw_mws").val("");
		});
	
		//닫기버튼 클릭
	    $("#mws .closing_bnt").click(function(){
			$("#mws, #workspace_del_mws").addClass("none");
			$("#setname_mws, #setsummary_mws, #pw_mws").val("");
			$(".select_bnt_mws").css("transform","translateX(0px)");
            $(".on_sel").css("color","rgb(255, 255, 255)");
            $(".off_sel").css("color","rgb(193, 193, 193)");
            $("#del_mws").removeClass("none");
            $("#name_cnt_mws, #summary_cnt_mws").addClass("hidden");
            $("#name_mws, #summary_mws").css("border-bottom","1px solid rgb(225,225,225)");
            $(".save_mws").html("수정");
            $("#cnt3, #cnt4").html(0);
	    });
		
		//모달 바깥 누르면 닫힘
		$("#mws").on("click",function(e){
			if($(this).is(e.target)){
				$(this, "#workspace_del_mws").addClass("none");
				$("#setname_mws, #setsummary_mws, #pw_mws").val("");
				$(".select_bnt_mws").css("transform","translateX(0px)");
	            $(".on_sel").css("color","rgb(255, 255, 255)");
	            $(".off_sel").css("color","rgb(193, 193, 193)");
	            $("#del_mws").removeClass("none");
	            $("#name_cnt_mws, #summary_cnt_mws").addClass("hidden");
	            $("#name_mws, #summary_mws").css("border-bottom","1px solid rgb(225,225,225)");
	            $(".save_mws").html("수정");
	            $("#cnt3, #cnt4").html(0);
			}
		});
	});
</script>


<!-- 협업공간 멤버관리-->
<div class="modal_mws none" id="mbws">
<section id="manage_member_workspace" class="modal_content_mws">
        <header>
            <div class="header_cws">
                <span>협업공간 관리</span>
                <button class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></button>
            </div>    
        </header>
        <div id="tab_mbws">
            <button id="tab1_mbws" class="untab_mws">협업공간 정보</button>
            <button id="tab2_mbws" class="ontab_mws">멤버 관리</button>
        </div>

    <div id="container1_mbws">
        <div id="box_mbws">
            <label for="search_member_mbws"></label>
            <input type="text" id="search_member_mbws" placeholder="이름 또는 이메일 주소로 멤버 검색">
            <button id="del_bnt_mbws" class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></button>
        </div> 
        <div id="container2_mbws"  class="scroll_bar_mws"><!--멤버 출력 범위-->
            <div id="member_list_mbws"><!-- 나온 멤버 범위-->

                <div class="profile_mbws">
                    <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak1@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                </div>
                <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak2@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak3@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak4@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                    <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak5@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                </div>
                <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak6@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak7@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak8@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                    <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak9@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                </div>
                <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak10@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak11@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak12@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                    <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak13@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                </div>
                <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak14@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak15@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak16@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
                 <div class="profile_mbws">
                    <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak17@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                </div>
                <div class="profile_mbws">
                	 <div class="pf1_mbws">
                        <img src="https://down.collabee.co/userProfile/2972655" class="picture_mbws"/>
                        <div>
                            <span class="name_mbws">강지현</span>
                            <span class="email_mbws">twekyaak18@gmail.com</span>
                        </div>
                    </div>
                    <div class="pf2_mbws">
                        <svg width="19px" height="19px" viewBox="0 0 24 24" _title="관리자"><path fill="#33846C" fill-rule="evenodd" d="M12 22C6.477 22 2 17.523 2 12S6.477 2 12 2s10 4.477 10 10-4.477 10-10 10zm-1.078-9.39L12 9.187l1.078 3.421h-2.156zm3.234 3.14h1.781l-3-8.438h-1.874l-3 8.438h1.78l.657-1.875h3l.656 1.875z"></path></svg>
                        <svg width="19px" height="19px" viewBox="0 0 24 24" title="설정" style="cursor: pointer;"><path fill="#888888" fill-rule="evenodd" d="M19.43 12.98c.04-.32.07-.64.07-.98 0-.34-.03-.66-.07-.98l2.11-1.65c.19-.15.24-.42.12-.64l-2-3.46c-.12-.22-.39-.3-.61-.22l-2.49 1c-.52-.4-1.08-.73-1.69-.98l-.38-2.65A.488.488 0 0 0 14 2h-4c-.25 0-.46.18-.49.42l-.38 2.65c-.61.25-1.17.59-1.69.98l-2.49-1c-.23-.09-.49 0-.61.22l-2 3.46c-.13.22-.07.49.12.64l2.11 1.65c-.04.32-.07.65-.07.98 0 .33.03.66.07.98l-2.11 1.65c-.19.15-.24.42-.12.64l2 3.46c.12.22.39.3.61.22l2.49-1c.52.4 1.08.73 1.69.98l.38 2.65c.03.24.24.42.49.42h4c.25 0 .46-.18.49-.42l.38-2.65c.61-.25 1.17-.59 1.69-.98l2.49 1c.23.09.49 0 .61-.22l2-3.46c.12-.22.07-.49-.12-.64l-2.11-1.65zM12 15.5c-1.93 0-3.5-1.57-3.5-3.5s1.57-3.5 3.5-3.5 3.5 1.57 3.5 3.5-1.57 3.5-3.5 3.5z"></path></svg>
                    </div>
                 </div>
              
            </div>
        </div>
        <footer class="footer_mbws">
            <label for="invite_bnt_mbws">멤버 초대하기</label>
            <button id="invite_bnt_mbws"></button>
        </footer>

		
			<ul class="setting_mbws" style="display:none;">
				<li>관리자 권한 해제</li>
				<li>멤버 탈퇴</li>
			</ul>
			


<script>
    var x="<svg viewBox='0 0 24 24' width='24px' height='24px' class='closed'><path fill='rgb(255,255,255)' d='M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z'></path></svg>"
	$(function(){
		//input x 누르면 초기화
		$("#del_bnt_mbws").click(function(){
			$("#search_member_mbws").val("");
		});

        //모달창 끄기
        $("#manage_member_workspace .closing_bnt").click(function(){
            $("#mbws").addClass("none");
            $("#search_member_mbws").val("");
            $(".setting_mbws").addClass("none");
        });
		
        //모달 바깥 누르면 끄기
        $(document).on("click","#mbws", function(e){
            if($(this).is(e.target)) {
                $(this, ".setting_mbws").addClass("none");
                $("#search_member_mbws").val("");
            }
        });
        
        
		
		
		//멤버 설정 클릭  (학원pc 전체화면 100% 기준) alert가 반복실행되는 문제(안됨) ->이벤트 분리
		$("svg[title='설정']").on("click", function(event){
			//관리자 여부에 따라 팝업 다르게 표시
			var state= $(this).siblings().css("opacity");	
			if(state==1){
				 $(".setting_mbws li:nth-child(1)").html("관리자 권한 해제");
			} else{
				 $(".setting_mbws li:nth-child(1)").html("관리자 선정");
			}
			
			//팝업창 위치 설정 및 뜨기
            var position = $(this).position();
            var xx = position.left-865; 
            var yy = position.top-320;
			$(".setting_mbws").css("transform", "translate3d("+xx+"px, "+yy+"px, 0px)").toggle();
			
			//클릭한 멤버 정보 속성에 추가
			var selMember = $(this).parent().parent();
			var selName = selMember.find(".name_mbws").text();
			var selEmail = selMember.find(".email_mbws").text();
        	//.attr("selName","selName").attr("selEmail","selEmail");
		});	
			
		
		//멤버 설정 관리  누구의 설정인지 어떻게 구함???
        $(".setting_mbws li").click(function(){
            var text = $(this).text();
           	alert();
           	
            
           	//관리자 해제
            if(text.indexOf("해제") > 0){
                if(confirm(selName+"님의 관리자 권한을 해제하시겠습니까? 해제 시, 일반 멤버로 전환되며 협업공간을 관리할 수 없습니다.")==true){
	                var alert_message = $(".alert").html(x+selName+"님의 관리자 권한이 해제되었으며, 일반 멤버로 전환되었습니다.");
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
	                $(".setting_mbws").toggle();
	                alert(selMember.find("svg[_title='관리자']"));
	                selMember.find("svg[_title='관리자']").css({display:"none", opacity:0});
	                //$(this).html("관리자로 선정");
	                return;
                } else {
                	return;
                }
                 
            //관리자 선정    
            } else if(text.indexOf("선정")>0){
                if(confirm(selName+"님을 관리자로 선정하시겠습니까? 선정 시, 협업공간 관리를 진행할 수 있습니다.")==true){
	                var alert_message = $(".alert").html(x+selName+"님이 관리자로 선정되었습니다.");
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
	                $(".setting_mbws").toggle();
	                
	                selMember.find("svg[_title='관리자']").css({display:"block",opacity:1});
	                //$(this).html("관리자 권한 해제");
	                return;
                } else {
                	return;
                }
                
            //관리자 탈퇴    
            } else if(text.indexOf("탈퇴")>0){
                if(confirm(selName+"님을 협업공간에서 탈퇴시키겠습니까? 탈퇴 시 협업공간 및 컨텐츠에 접근할 수 없으며, 관련된 할 일과 의사결정의 권한이 변경됩니다.")==true){
	                var alert_message = $(".alert").html(x+selName+"님이 협업공간에서 탈퇴되었습니다.");
	     			alert_message.fadeIn(function(){
	         			setTimeout(function(){
	         				alert_message.fadeOut();
	         			}, 3000);
	     			});
	       			//글자수에 따라 높이 정하기
		     		var height = alert_message.prop("scrollHeight");
	    	 		alert_message.css("height", height);
	                $(".setting_mbws").toggle();
	                
	                selMember.detach();//멤버 html지우기
	                return;
                } else {
                	return;
                }
            }
        });//리스트 선택
	      
		
		
		//초대하기 버튼
        $("#invite_bnt_mbws").click(function(){
            $("#mbws").addClass("none");
            $("#invite_member").removeClass("none");
            $(".setting_mbws").addClass("none");
        });
	});	
</script>
    </div><!--container1-->
</section>
</div>
</body>
</html>



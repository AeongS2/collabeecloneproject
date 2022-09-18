<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.jm.dto.*" %>
<%@ page import = "com.jm.dao.*" %>
<%@ page import = "java.util.ArrayList" %>
<%
	// int member_id = session.getAttribute("member_id");

%> 
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>할 일</title>
	<style>
		*{
			box-sizing: border-box;
			margin: 0;
    		padding: 0;
    		border: 0;
    		outline: 0;
			font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;
		}
		body{
			font-size: 13px;
		}
		button{
			border: none;
		    box-sizing: border-box;
		    font-size: 12px;
		    outline: 0;
		}
		a{
			text-decoration: none;
		}
		li{
			list-style: none;
		}
		a:visited{
			text-decoration: none;
		}
		input{
			background-color: #fff;
		}
		textarea{
			resize: none;
			overflow: auto;
			margin: 0;
		}
		
		#overlay{
			position: fixed;
    		top: 0;
    		left: 0;
    		right: 0;
    		bottom: 0;
    		z-index: 100;
    		background-color: rgba(0,0,0,.8);
		}
		#todo_modal_close{
			width: 100%;
		    height: 100%;
		    position: absolute;
		    z-index: 5;
		    padding: 20px 0px 0px 20px;
		}
		.todo_madal_close_button{
			padding-left: 0px;
		    padding-right: 0px;
		    transition: fill 0.2s ease 0s;
		    cursor: pointer;
		    pointer-events: auto;
		    width: auto;
		    background-color: transparent;
		    text-decoration: none;
		}
		.button_x_svg{
			display: inline-block;
		    vertical-align: middle;
		    background-color: rgb(0,0,0,.8);
		    shape-rendering: inherit;
		}
		.button_x_path{
			transition: fill 0.2s ease 0s;
  		  	fill: rgb(255, 255, 255);
  		  	cursor: pointer;
    		pointer-events: auto;
		}
		
		#todo_modal_content{
			position: absolute;
		    top: 0px;
		    right: 0px;
		    width: calc(100% - 200px);
		    height: 100vh;
		    background-color: rgb(255, 255, 255);
		    z-index: 10;
		}
		#todo_header{
			position: relative;
		    height: 180px;
		    display: flex;
		    flex-direction: row;
		    background-repeat: no-repeat;
		    background-position: right bottom;
		    background-image: url(https://cdn.collabee.co/front/collabee.co/hornet/528/static/media/bgGnbArchiveTask.691c82ef.png);
		}
		#todo_header:before{
			position: absolute;
		    content: "";
		    display: block;
		    top: 0px;
		    left: 0px;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.6);
		}
		.todo_header_left{
			position: relative;
		    flex: 1 1 auto;
		    padding-top: 18px;
		    padding-left: 40px;
		    padding-right: 40px;
		    display: flex;
		    flex-direction: column;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		}
		.todo_header_left_top{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    margin-bottom: 6px;
		    justify-content: space-between;
		}
		.todo_header_left_topleft{
			display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		}
		.todo_title{
			margin-right: 12px;
			font-size: 22px;
		    font-weight: bold;
		    color: rgb(255, 255, 255);
		}
		#todo_space_select{
			position: relative;
		    box-sizing: border-box;
		    width: 200px;
    		border-color: rgb(136, 136, 136);
		    padding-top:17px;
		} 
		#todo_space_select1{
			max-width: calc(100% - 8px);
		    overflow: hidden;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    top: 50%;
		    transform: translateY(-50%);
		    box-sizing: border-box;
		    width: auto;
		    max-width: 100%;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    -webkit-box-pack: justify;
		    margin: 0px !important;
		    color: rgb(255, 255, 255) !important;
		} 
		
		.todo_space_select_svg{
			flex-shrink: 0;
		    margin-left: 8px;
		    margin-right: 8px;
		    display: inline-block;
		    vertical-align: middle;
		    shape-rendering: inherit;
		}
		.todo_space_select_path{
			fill: rgb(255, 255, 255);
		}
		
		.search_write_btn{
			display: flex;
		    flex-direction: row;
		    position: relative;
		    align-items: flex-start;
		}
		#bnt1_cal{
        	display:flex;
	    }
	    #searchbar::placeholder{
	        color: rgb(193, 193, 193);
	    }
	    #searchbar { /*상단 검색창  / 클릭하면 길어지면서 문서작성 버튼 없어짐(할지말지 고민중) */
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
	    
	    .fr{
	    	float: right;
	    }
	    
	    .todo_header_left_bottom{
	    	display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    height: 20px;
		    margin-bottom: 10px;
	    }
	    #todo_menu{
	    	display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    transform: translateX(-16px);
	    }
	    #todo_menu_style_active1{
 	    	display: block; 
		    padding: 10px 16px;
		    font-size: 12px;
		    transition: color 0.2s ease 0s;
		    color: rgb(255, 255, 255);
		    font-weight: bold;
	    }
	    #todo_menu_style_active0{
	    	display: block;
		    padding: 10px 16px;
		    font-size: 12px;
		    transition: color 0.2s ease 0s;
		    color: rgba(255, 255, 255, 0.6);
		    font-weight: normal;
	    }
	    
	    #todo_header_right{
	    	position: relative;
		    flex: 0 0 250px;
		    padding-top: 14px;
		    padding-right: 5px;
	    }
	    #todo_header_submenu{
	    	position: relative;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-pack: end;
		    justify-content: flex-end;
		    -webkit-box-align: center;
		    align-items: center;
		    padding-right: 20px;
	    }
	    .todo_header_submenu_link{
	    	display: inline-block;
		    cursor: pointer;
		    font-size: 12px;
		    line-height: 1.5;
		    padding: 10px;
		    margin: 0px 3px;
		    transition: color 0.2s ease 0s;
		    color: rgb(255, 255, 255);
	    }
	    .todo_header_submenu_link:hover{
	    	color: rgba(255, 255, 255, 0.8); 
	    }
	    .todo_header_submenu_link>svg{
	    	fill: white;
	    }
	    
	    #todo_main{
	    	display: flex;
		    flex-direction: row;
		    height: calc(100% - 180px);
		    margin-left: 20px;
	    }
	    #todo_main_left{
	    	flex: 1 1 0%;
		    min-width: 650px;
		    height: 100%;
	    }
	    .todo_content_list{
	    	display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    padding: 14px 10px 14px 0px;
		    border-bottom: 1px solid rgb(225, 225, 225);
		    background-color: rgb(255, 255, 255);
	    }
	    .todo_content1{
	    	flex: 0 0 38px;
		    position: relative;
	    }
	    .todo_content2{
	    	display: flex;
		    flex-direction: column;
		    margin-right: 20px;
		    flex: 1 1 0%;
		    min-width: 0px;
	    }
	    .todo_content3{
	    	flex: 0 0 94px;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-pack: center;
		    justify-content: center;
		    text-align: right;
	    }
	    .todo_content1_button{
	    	background-color: transparent;
		    transform: translateY(2px);
		    cursor: pointer;
	    }
	   /*  .todo_content1_svg{
	    	transition: fill 0.2s ease 0s;
	    } */
	    .todo_content2_title{
	    	font-size: 13px;
		    line-height: 1.54;
		    color: rgb(34, 34, 34);
	    }
	    .todo_content2_title_a{
	    	padding-right: 8px;
		    color: rgb(34, 34, 34);
		    transition: color 0.2s ease 0s;
		    word-break: break-all;
		    font-size: 13px;
    		line-height: 1.54;
    		cursor: pointer;
	    }
	    .todo_content2_title_a:hover{
	    	color: rgb(83, 83, 83);
	    }
	    .todo_content2_date{
	    	color: rgb(136, 136, 136);
		    padding-left: 2px;
		    padding-right: 5px;
	    }
	    .todo_content2_space{
	    	display: flex;
		    width: 100%;
		    -webkit-box-align: center;
		    align-items: center;
		    min-width: 0px;
		    margin-top: 6px;
	    }
	    .todo_content2_space_a{
	    	font-size: 12px;
		    color: rgb(51, 132, 108);
		    padding-right: 4px;
		    transition: color 0.2s ease 0s;
		    flex-shrink: 0;
		    cursor: pointer;
	    }
	    .todo_content2_space_a:hover{
	    	color: rgb(42, 98, 81);
	    }
	    
	    .todo_content3{
	    	flex: 0 0 94px;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-pack: center;
		    justify-content: center;
		    text-align: right;
	    }
	    .avatar_container{
	    	flex-shrink: 0;
		    position: relative;
		    width: 20px;
		    height: 20px;
		    border-radius: 50%;
		    padding: 1px;
		    background-color: rgba(0, 0, 0, 0.1);
		    content: "";
		    transition: border-color 0.3s ease 0s;
		    cursor: pointer;
	    }
	    .todo_avatar{
	    	position: absolute;
		    display: block;
		    top: 0px;
		    left: 0px;
		    background-color: rgb(255, 255, 255);
		    transform: translate(1px, 1px);
		    width: 18px;
		    height: 18px;
		    background-image: url(https://down.collabee.co/userProfile/2972576); 
		    border-radius: 50%;
		    background-size: cover;
		    background-position: center center;
		    content: "";
	    }
	    .avatar_container:after{
	    	position: absolute;
		    display: block;
		    top: 0px;
		    left: 0px;
		    width: 20px;
		    height: 20px;
		    border-radius: 50%;
		    content: "";
		    border: 2px solid rgba(0, 0, 0, 0);
		    transition: border-color 0.3s ease 0s;
	    }
	    
	    #todo_cur_selector{
	    	display: none;
	    	position: absolute;
		    top: 0px;
		    left: 0px;
		    z-index: 201;
	    }
		#div_background1 {
			display: none;
			z-index: 200;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom : 0;
			width: 100%;
			height: 100%;
			background-color: transparent;
		}
		#todo_cur_selector_container{
			width: 175px;
		    border-radius: 4px;
		    box-shadow: rgb(0 0 0 / 10%) 0px 0px 6px 2px;
		    border: 1px solid rgb(225, 225, 225);
		    background-color: rgb(255, 255, 255);
		    padding-top: 12px;
		    padding-bottom: 12px;
		   	display: flex;
		    flex-direction: column;
		}
		#todo_cur_selector_title{
			display: block;
		    font-size: 12px;
		    font-weight: normal;
		    line-height: 1.5;
		    color: rgb(136, 136, 136);
		    padding-bottom: 4px;
		    padding-left: 16px;
		}
		.todo_cur_selector_button{
			position: relative;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    width: 100%;
		    text-align: left;
		    font-size: 13px;
		    line-height: 1.5;
		    color: rgb(34, 34, 34);
		    padding: 5px 5px 5px 15px;
		    cursor: pointer;
		    background-color: rgb(255, 255, 255);
		    transition: background-color 0.2s ease 0s;
		}
		.todo_cur_selector_button:hover{
			background-color: rgb(242, 242, 242);
		}
		.todo_cur_selector_svg{
			margin-right: 6px;
		}
		
		#todo_article{
			flex: 1 1 0%;
		    width: 100%;
		    height: 100%;
		    padding: 0px 20px 0px 0px;
		    overflow-y: scroll;
		}
		
		.todo_aside_container{
			flex: 0 0 250px;
		    height: 100%;
		    padding: 32px 30px 40px 34px;
		    overflow-y: scroll;
		}
		.todo_aside_filtertitle{
			display: block;
		    font-size: 14px;
		    font-weight: normal;
		    color: rgb(136, 136, 136);
		    margin-bottom: 12px;
		}
		.todo_aside_item{
			display: flex;
		    flex-direction: row;
		    margin-bottom: 8px;
		}
		.todo_aside_item_link{
			display: inline-flex;
		    flex-flow: row wrap;
		    -webkit-box-align: center;
		    align-items: center;
		    color: rgb(34, 34, 34);
		    font-size: 12px;
		    line-height: 1.5;
		    margin-left: 8px;
		    transition: color 0.2s ease 0s;
		    min-width: 0px;
		}
		.todo_aside_iten_btn{
			background-color: transparent;
    		transform: translateY(2px);
		}
		.todo_aside_item_title{
			display: inline-block;
		    padding-right: 5px;
		    word-break: break-word;
		}
		.todo_aside_item_name{
			display: inline-block;
		    word-break: break-all;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    color: rgb(136, 136, 136);
		}
		
		/* 파일함 모달 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		#div2{
	    	display: none;
	    	background: white;
		    cursor: pointer;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    font-size: 12px;
		    line-height: 1.5;
		    border-radius: 4px;
		    width: 148px;
		    height: 73px;
		    margin-top: -10px;
		    margin-left: 69px;
		    
		    z-index: 300;
		    padding-top: 12px;
	    }
	    .div2_1:hover{
			filter: brightness(90%);
			transition: transform 10s;
		}
		.div2_1{
			overflow: hidden;
			background-color: white;
			height: 25px;  
			padding-left: 10px;
		}
		.div2_1>a>svg{
			filter: opacity(0.5); 
			width: 15px; 
			height:15px; 
			margin-right: 8px;  
			vertical-align: bottom;
		}
		
		/* 스크롤 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		#todo_article::-webkit-scrollbar {
			width:4px;
		}
		#todo_article::-webkit-scrollbar-thumb {
		    height: 70%; /* 스크롤바의 길이 */
		    background: #e1e1e1; /* 스크롤바의 색상 */
		    border-radius: 2px;
		}
		.todo_aside_container::-webkit-scrollbar {
			width:4px;
		}
		.todo_aside_container::-webkit-scrollbar-thumb {
		    height: 70%; /* 스크롤바의 길이 */
		    background: #e1e1e1; /* 스크롤바의 색상 */
		    border-radius: 2px;
		}
		
		/* 협업공간 선택 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
		 .workspace_list{/* 누르면 열리는 공간 목록*/
        	position: fixed;
        	z-index: 300;
            display:flex;
            justify-content: right;
            margin-right:90px;
            display : none;
          	
		    min-height: 270px; 
        }
        .workspace_list ul{ /* 누르면 열리는 공간 목록*/
            position: absolute;
            list-style: none;
            background-color: rgb(255, 255, 255);
            border-radius: 4px;
            width: 160px;
            /* width: 160px;
            height:270px; */
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
        }
        .workspace_list li span{
            margin-left:7px;
        }
        .icon_color{
            fill:rgb(136, 136, 136);
        } 
        
        /* 할일 디테일 창 스타일 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ */
        #todo_modal{
        	display: none;
        }
		.todo_layout_container{
			top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    z-index: 1000;
		    position: fixed;
		    
		    overflow-y: initial;
    		overflow-x: initial;
		}
		.modal_overlay{
			top: 0;
		    left: 0;
		    right: 0;
		    bottom: 0;
		    z-index: -1;
		    position: fixed;
		    touch-action: none;
		    background-color: rgba(0, 0, 0, 0.5);
		    -webkit-tap-highlight-color: transparent;
		}
		.todo_modal1{
			opacity: 1;
    		transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    		
    		height: 100%;
    		outline: none;
    		
    		display: flex;
    		align-items: center;
    		justify-content: center;
		}
		.todo_modal2{
			max-width: 600px;
			flex: 0 1 auto;
    		max-height: calc(100% - 96px);
    		margin: 48px;
		    display: flex;
		    position: relative;
		    flex-direction: column;
		    box-shadow: 0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
		    border-radius: 4px;
		    background-color: #fff;
		}
		.new_todo_container{
			background-color: rgb(255, 255, 255);
		    width: 580px;
		    padding: 20px 20px 22px;
		    border-radius: 4px;
		}
		.new_todo_header{
			display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    margin-bottom: 24px;
		    padding-left: 4px;
		}
		.new_todo_h6{
			font-size: 12px;
		    font-weight: bold;
		    line-height: 1.5;
		    color: rgb(136, 136, 136);
		}
		.new_todo_btn_x{
			min-width: inherit;
		    min-height: inherit;
		    padding-left: 0px;
		    padding-right: 0px;
		    transition: fill 0.2s ease 0s;
		    cursor: pointer;
		    pointer-events: auto;
		    width: auto;
		    background-color: transparent;
		    text-decoration: none;
		}
		.btn_x_svg{
			display: inline-block;
		    vertical-align: middle;
		    shape-rendering: inherit;
		}
		.btn_x_path{
			transition: fill 0.2s ease 0s;
    		fill: rgb(136, 136, 136);
		}
		.new_todo_inputcontainer{
			display: flex;
    		flex-direction: row;
		}
		.new_todo_path{
			fill: rgb(225, 225, 225);
		}
		.new_todo_input{
			width: 505px;
		    margin-left: 10px;
		    font-size: 22px;
		    color: rgb(34, 34, 34);
		    line-height: 1.45;
		    border: none;
		}
		.new_todo_assign{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    -webkit-box-align: center;
		    align-items: center;
		    margin-top: 4px;
		    margin-left: 40px;
		    margin-bottom: 24px;
		}
		.assign_list_btn{
			position: relative;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 1 auto;
		    min-width: 0px;
		    height: 32px;
		    background-color: transparent;
		    border: 1px solid rgb(230, 230, 230);
		    border-radius: 18px;
		    padding-left: 6px;
		    padding-right: 6px;
		    cursor: pointer;
		    transition: border-color 0.2s ease 0s;
		}
		.assign_list_path{
			fill: rgb(193, 193, 193);
		}
		.assign_list_view{
			background-color: transparent;
		    cursor: pointer;
		    display: flex;
		    min-width: 0px;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		}
		.assign_list_span{
			font-size: 15px;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    color: rgb(34, 34, 34);
		    padding-left: 4px;
		}
		.assign_list_path1{
			fill: rgb(34, 34, 34);
		}
		.new_todo_datecontainer{
			border-top: 1px solid rgb(225, 225, 225);
    		padding-top: 24px;
		}
		.todo_date_picker_container{
			display: flex;
		    flex-direction: row;
		    align-items: flex-start;
		}
		
		.todo_date_picker_icon_area{
			margin: 2px 9px 0px 5px;
			height: 20px;
		}
		.todo_date_picker_icon_path{
			fill: rgb(136, 136, 136);
		}
		.todo_date_picker{
			display: flex;
		    flex-flow: row wrap;
		    -webkit-box-align: center;
		    align-items: center;
		    padding-left: 4px;
		    font-size: 16px;
		    line-height: 24px;
		}
		.todo_date_picker_datecontainer{
			display: flex;
		    flex-flow: row wrap;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 1 1 0%;
		}
		.todo_picker_date_btn{
			font-weight: normal;
			font-size: 14px !important;
			height: 24px;
		    padding: 0px 1px;
		    line-height: 24px;
		    background-color: transparent;
		    cursor: pointer;
		    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
		    color: rgb(136, 136, 136);
		    pointer-events: auto;
		}
		.todo_picker_date_btn:hover{
			border-radius: 4px;
		    background-color: rgb(247, 246, 245);
		    color: rgb(34, 34, 34);
		}
		
		.new_todo_footer{
			display: flex;
		    flex-direction: row;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    margin-top: 40px;
		}
		.new_todo_footercell{
			display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    position: relative;
		    padding-left: 4px;
		}
		.icon_btn{
			margin-right: 10px;
			min-width: inherit;
		    min-height: inherit;
		    padding-left: 0px;
		    padding-right: 0px;
		    transition: fill 0.2s ease 0s;
		    cursor: pointer;
		    pointer-events: auto;
		    width: auto;
		    background-color: transparent;
		    text-decoration: none;
		}
		.todo_detail_btn{
			position: relative;
		    min-height: inherit;
		    color: rgb(255, 255, 255);
		    font-size: 12px;
		    font-weight: 500;
		    line-height: 1.5;
		    border-radius: 4px;
		    text-align: center;
		    padding: 5px 18px;
		    transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
		    border-width: 1px;
		    border-style: solid;
		    border-color: rgb(217, 173, 43);
    		background-color: rgb(217, 173, 43);
		    cursor: pointer;
		    opacity: 1;
		    width: auto;
		    box-shadow: none;
		}
		.todo_detail_btn:hover{
			background-color: rgb(179, 142, 34);
    		border-color: rgb(179, 142, 34);
		}
		.todo_date_picker_devide{
			display: inline-block;
		    color: rgb(34, 34, 34);
		    font-size: 12px;
		    line-height: 1.5;
		}

        
        .new_todo_projectdropdowncontainer{
        	position: relative;
    		margin-right: 12px;
        }
        .new_todo_projectdropdowncontainer1{
        	position: relative;
    		box-sizing: border-box;
    		
    		width: 160px;
		    border-width: 1px;
		    border-style: solid;
		    border-radius: 4px;
		    background-color: rgb(255, 255, 255);
		    border-color: rgb(217, 173, 43);
        }
        .new_todo_projectdropdowncontainer2{
        	-webkit-box-align: center;
		    /* align-items: center; */
		    cursor: default;
		    display: flex;
		    flex-wrap: wrap;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    position: relative;
		    transition: all 100ms ease 0s;
		    box-sizing: border-box;
		    outline: 0px !important;
		    
		    padding-left: 8px;
		    font-size: 13px;
		    background-color: transparent !important;
		    border: none !important;
		    border-radius: 0px !important;
		    box-shadow: none !important;
		    min-height: 28px !important;
        }
		.new_todo_projectdropdown_componet{
			-webkit-box-align: center;
		    align-items: center;
		    display: flex;
		    flex: 1 1 0%;
		    flex-wrap: wrap;
		    padding: 2px 8px;
		    position: relative;
		    overflow: hidden;
		    box-sizing: border-box;
		    
		    padding-left: 8px !important;
		}
        .new_todo_projectdropdown_workspace{
        	max-width: calc(100% - 8px);
		    overflow: hidden;
		    position: absolute;
		    text-overflow: ellipsis;
		    white-space: nowrap;
		    top: 50%;
		    transform: translateY(-50%);
		    box-sizing: border-box;
		    
		    width: 100%;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    -webkit-box-pack: justify;
		    justify-content: space-between;
		    margin: 0px !important;
		    color: rgb(204, 153, 0) !important;
        }
        .new_todo_projectdropdown_workspace>span{
        	display: inline-block;
		    width: 100%;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
        }
        
        .new_todo_filescontainer{
		   max-height: calc(100vh - 434px);
		    height: 100%;
		    overflow-y: scroll;
        }
        .new_todo_edit_file_container{
        	margin: 16px 0px;
        }
        .edit_des_iconcontainer{
        	margin: 3px 10px 0px 5px;
        }
        .new_todo_edit_des_container{
        	display: flex;
		    flex-direction: row;
		    margin-top: 16px;
		    padding: 0px 3px 3px 0px;
        }
        .edit_des_textarea{
        	overflow-wrap: break-word;
		    white-space: break-spaces !important;
		    
		    display: block;
		    width: 100%;
		    min-height: 50px;
		    padding: 1px 4px 2px;
		    border: 0px;
		    border-radius: 4px;
		    background-color: rgb(255, 255, 255);
		    color: rgb(34, 34, 34);
		    font-size: 14px;
		    line-height: 1.71;
		    flex: 1 1 0% !important;
		    resize: none;
        }
         .edit_des_textarea:focus{
         	box-shadow: rgb(217 173 43) 0px 0px 0px 1px inset, rgb(217 173 43 / 20%) 0px 0px 0px 4px;
         }
         .edit_des_textarea:hover{
         	background-color: rgb(255, 255, 255);
         }


		.new_todo_input::-webkit-scrollbar {
				width:4px;
			}
		.new_todo_input::-webkit-scrollbar-thumb {
		    height: 70%; /* 스크롤바의 길이 */
		    background: #e1e1e1; /* 스크롤바의 색상 */
		    border-radius: 2px;
		}
			.edit_des_textarea::-webkit-scrollbar {
				width:4px;
			}
			.edit_des_textarea::-webkit-scrollbar-thumb {
		    height: 70%; /* 스크롤바의 길이 */
		    background: #e1e1e1; /* 스크롤바의 색상 */
		    border-radius: 2px;
			}
		
		#div_background {
			display: none;
			z-index: 1001;
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			bottom : 0;
			width: 100%;
			height: 100%;
			/* background-color: rgba(0,0,0,0.5); */
			background-color: transparent;
		}
        
        .TodoDetailModal_title_container{
        	display: flex;
		    flex-direction: row;
		    margin-left: 4px;
        }
        .TodoDetailselector_btn{
        	background-color: transparent;
		    transform: translateY(2px);
		    /* cursor: pointer; */
        }
        .TodoDetailselector_btn svg{
		    transition: fill 0.2s ease 0s;        	
        }
        .TodoDetailselector_btn:hover svg path{
	        /* fill: rgb(163, 163, 163);   */      	
        }
        .edit_title_container{
        	width: 100%;
    		margin-left: 10px;
        }
        .edit_title_input{
        	overflow-wrap: break-word;
		    flex: 0 0 auto;
		    white-space: break-spaces !important;
		    height: 32px;
		     display: block;
		    width: 100%;
		    max-height: inherit;
		    padding: 0px;
		    border: 0px;
		    cursor: text;
		    color: rgb(34, 34, 34);
		    font-size: 22px;
		    line-height: 1.45;
		    outline: none !important;

        }
        
        .todo_detail_assign_container{
        	display: flex;
		    flex-direction: row;
		    -webkit-box-pack: start;
		    justify-content: flex-start;
		    -webkit-box-align: center;
		    align-items: center;
		    padding: 4px 0px 24px 40px;
        }
        .todo_detail_assign_writer{
        	position: relative;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 1 auto;
		    min-width: 50px;
		    max-width: 200px;
		    height: 32px;
		    border: 1px solid transparent;
		    border-radius: 18px;
		    padding-left: 6px;
		    padding-right: 10px;
		    cursor: pointer;
		    background-color: rgb(242, 242, 242);
        }
        .todo_modal_avatar_container{
        	flex-shrink: 0;
		    position: relative;
		    width: 20px;
		    height: 20px;
		    border-radius: 50%;
		    padding: 1px;
		    background-color: rgba(0, 0, 0, 0.1);

        }
        .todo_modal_writer_name{
        	font-size: 15px;
		    white-space: nowrap;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    color: rgb(34, 34, 34);
		    padding-left: 4px;
        }
        .todo_detail_assign_svg{
       		margin-left: 8px;
   			margin-right: 8px;
   			display: inline-block;
		    vertical-align: middle;
		    shape-rendering: inherit;
        }
        .todo_detail_assign_path{
        	fill: rgb(211, 211, 211);
        }
        .todo_modal_avatar{
        	position: absolute;
		    display: block;
		    top: 0px;
		    left: 0px;
		    background-color: rgb(255, 255, 255);
		    transform: translate(1px, 1px);
		    width: 18px;
		    height: 18px;
		    background-image: url(https://down.collabee.co/userProfile/2972576);
		    border-radius: 50%;
		    background-size: cover;
		    background-position: center center;
        }
        .todo_detail_assign_pic{
        	position: relative;
		    display: flex;
		    flex-direction: row;
		    -webkit-box-align: center;
		    align-items: center;
		    flex: 0 1 auto;
		    min-width: 50px;
		    max-width: 200px;
		    height: 32px;
		    border: 1px solid rgb(230, 230, 230);
		    border-radius: 18px;
		    padding-left: 6px;
		    padding-right: 6px;
		    background-color: transparent;
        } 
		
	</style>
	
	<script src="js/jquery-3.6.0.min.js"></script>
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>

	$(function() {
		var todo_id;
		var this_todo_content1_button_g;
		
		// 할일 설렉터 모달 열기
		$(".todo_content1_button").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 25;
        	$("#todo_cur_selector").css('left',px+'px');
        	$("#todo_cur_selector").css('top',py+'px');
			
			$("#todo_cur_selector").css('display', 'block');
			$("#div_background1").css('display', 'block'); 
			
			todo_id = $(this).parent().parent().parent().find(".todo_id").text();
			alert(todo_id);
			this_todo_content1_button_g = $(this).find(".g");
		});
      	$("#div_background1").click(function() {
        	$("#div_background1").css('display', 'none');
      		$("#todo_cur_selector").css('display', 'none');
      	});	
      	
    	 // 할일 상태 변경
      	$(".todo_cur_selector_button").click(function() {
	      	var todo_cur_id_str = $(this).text();
      		$.ajax({
				type: 'post',
				url: 'Controller', 
				data: {'command' : 'TodoCurSelectorAction', 'todo_cur_id_str' : todo_cur_id_str, 'todo_id' : todo_id },
				datatype: "json",	
				success: function(d){
					alert("할 일 상태가 변경되었습니다.");
					location.href="Controller?command=Todo";
				},
				error: function(r,s,e){
					alert("에러");
				}
			});
      		
      	});
      	
      	// 파일함 모달
      	$("#div1").mouseenter(function() {
            $("#div2").css("display","block");
		});
        $("#div2").mouseleave(function() {
            $("#div2").css("display","none");
        });
        
        // x버튼
        $(".todo_modal_close_button").mouseenter(function() {
            $(".button_x_path").css('fill', 'rgb(217, 173, 43)');
		});
        $(".todo_modal_close_button").mouseleave(function() {
            $(".button_x_path").css('fill', 'rgb(255, 255, 255)');
        });

      	//협업공간 선택
        $("#todo_space_select").click(function() {
        	var px = $(this).offset().left;	/* 클릭한 현재위치 가로 */
        	var py = $(this).offset().top+ 35;
        	$(".workspace_list").css('left',px+'px');
        	$(".workspace_list").css('top',py+'px');
			
			$(".workspace_list").css('display', 'block');
			$("#div_background").css('display', 'block');
	        $("#todo_space_select1>span").html("공간 검색").css("color", "rgb(255, 255, 255)");
	        $(".todo_space_select_svg").css({visibility:"hidden", opacity:0});
		});
      	$("#div_background").click(function() {
        	$("#div_background").css('display', 'none');
      		$(".workspace_list").css('display', 'none');
      	});

	    
	    $(".workspace_list > ul > li ").click(function(){ //리스트 선택하면 그값으로 바뀌고 리스트 닫힘
	        var workspace = $(this).text();
	        $("#todo_space_select1>span").html(workspace).css("color", "rgb(255, 255, 255)");
	        $(".todo_space_select_svg").css({visibility:"visible", opacity:1});
	        $("#div_background1").css('display', 'none');
      		$(".workspace_list").css('display', 'none');
	    });
	    $(".workspace_list li").hover(function (){
	        $(this).css("background-color", "rgb(242,242,242)");
	    }, function(){
	        $(this).css("background-color", "rgb(255, 255, 255)");
	    });
	    
	    // 달력피커
        $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker("setDate", new Date());
        $("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").click(function() { 
        	$("#todo_start_date_picker_btn, #todo_finish_date_picker_btn").datepicker({
        		dateFormat:"yy.m.d" ,showOthermonths: true ,showMonthAfterYear:true
                ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
                ,dayNamesMin:["일", "월","화","수","목","금","토"]
                , showButtonPanel:true, currentText:"오늘", closeText:"닫기"
        	});
        	//finish가 start보다 전이면 start가 선택한 finish 날짜로 변함(보류)            
        });

        
	}); 
	
	</script>
	<script>
		
		var todo_id = -1;
		// 할일 디테일 모달
		$(function () {
		    // 할일 디테일 띄우기
		    $(".todo_content2_title_a").click(function () {
		    	todo_id = $(this).parent().parent().parent().find(".todo_id").text();
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetail', 'todo_id' : todo_id },
		    		datatype: 'json',
		    		success: function(d){

		    			$("#todo_modal .TodoDetailselector_btn g").html(d.todo_cur_p);
		    			$("#todo_modal .edit_title_input").val(d.content);
		     			$("#todo_modal #todo_start_date_picker_btn").val(d.start_date);
		    			$("#todo_modal #todo_finish_date_picker_btn").val(d.finish_date);
		    			$("#todo_modal .edit_des_textarea").val(d.des);
		    			$("#todo_modal #todo_detail_writer_avatar").css('background-image', d.writer_p);
		    			$("#todo_modal #todo_detail_writer_name").text(d.writer_name);
		    			$("#todo_modal #todo_detail_pic_avatar").css('background-image', d.writer_p);
		    			$("#todo_modal #todo_detail_pic_name").text(d.pic_name); 

		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    		
		    		
		    	});
		    	$("#todo_modal").css('display', 'block');
		    });
		    
		    // 할일 수정
		    $("#todo_detail_btn_edit").click(function () {
		    	var content = $("#todo_modal .edit_title_input").val();
		    	var start_date = $("#todo_modal #todo_start_date_picker_btn").val();
		    	var finish_date = $("#todo_modal #todo_finish_date_picker_btn").val();
		    	var des = $("#todo_modal .edit_des_textarea").val();
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetailEdit', 'todo_id' : todo_id, 'content' : content, 'start_date' : start_date, 'finish_date' : finish_date, 'des' : des },
		    		datatype: 'json',
		    		success: function(d){
		    			alert("할 일이 수정되었습니다.")
		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    	});
		    });
		    
		    // 할일 삭제
		    $("#todo_detail_btn_del").click(function () {
		    	
		    	$.ajax({
		    		type: 'post',
		    		url: 'Controller',
		    		data: { 'command' : 'TodoDetailDel', 'todo_id' : todo_id },
		    		datatype: 'json',
		    		success: function(d){
		    			if(d.result==1){
			    			alert("할 일을 삭제하였습니다.");	
			    			location.href="Controller?command=Todo";
		    			}else{
		    				alert("할 일 삭제 실패.")
		    			}
		    			
		    		},
		    		error: function(r,s,e){
		    			alert("에러");
		    		}
		    	});
		    	
		    });
		    
		    $(".todo_modal_close_button").click(function() {
		    	location.href= "Controller?command=Home";
		    });
		    
		});
		
	</script>
</head>
<body>
	
	<div id="overlay">
		<div id="todo_modal_close">
				<button  title="닫기" class="todo_modal_close_button">
					<svg viewBox="0 0 24 24" width="35px" height="35px" class="button_x_svg">
						<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="button_x_path"></path>
					</svg>
				</button>
		</div>
		
		<div id="todo_modal_content">
			<header id="todo_header">
				<div class="todo_header_left">
					<div>
						<div class="todo_header_left_top">
							<div class="todo_header_left_topleft">
								<div class="todo_title">할 일</div>
								
								<div id="todo_space_select">
									<div id="todo_space_select1">
										<span>모든 공간</span>
										<svg viewBox="0 0 24 24" width="16px" height="16px" class="todo_space_select_svg">
											<path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z" class="todo_space_select_path"></path>
										</svg>
									</div>	
								</div>
								
							</div>
							
							<div class="search_write_btn">
							  	<div id="bnt1_cal">
							        <div id="search_icon" class="bnt_base"><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M15.5 14h-.79l-.28-.27A6.471 6.471 0 0 0 16 9.5 6.5 6.5 0 1 0 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z"></path></svg></div>
							        <input type ="text" id=searchbar placeholder="검색"/>
							        <button id="posting_bnt">
							            <svg viewBox="0 0 24 24" width="13px" height="13px" ><path d="M3 17.25V21h3.75L17.81 9.94l-3.75-3.75L3 17.25zM20.71 7.04a.996.996 0 0 0 0-1.41l-2.34-2.34a.996.996 0 0 0-1.41 0l-1.83 1.83 3.75 3.75 1.83-1.83z" class="posting_icon" ></path></svg>
							            <span>문서 작성</span>
							        </button>
						    	</div>
							</div> 
														
						</div>
					</div>
					<div class="todo_header_left_bottom">
						<div id="todo_menu">
							<li>
								<a id="todo_menu_style_active1" href="todo_me.html"><span>내 할 일</span></a>
							</li>
							<li>
								<a id="todo_menu_style_active0" href="todo_request.html"><span>요청한 할 일</span></a>
							</li>
						</div>
					</div>

				</div>
				
				<div id="todo_header_right">
					<div id="todo_header_submenu">
						<a class="todo_header_submenu_link" href="Controller?command=Todo">할 일</a>
						<a class="todo_header_submenu_link" href="">의사결정</a>
						<a class="todo_header_submenu_link" href="" id="div1">파일함
							<svg viewBox="0 0 24 24" width="12px" height="12px" class="svg5"><path d="M17.0278306,8 C18.1356358,8 18.40014,8.63354932 17.6171348,9.41655445 L13.4502437,13.5834455 C12.6679023,14.365787 11.40014,14.3664507 10.6171348,13.5834455 L6.45024373,9.41655445 C5.66790231,8.63421303 5.93074941,8 7.03954794,8 L17.0278306,8 Z"></path></svg><br/>
						</a>
					</div>
					<div id="div2">
	       				<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><g fill="currentColor" fill-rule="evenodd"><path fill="currentColor" d="M6 2c-1.1 0-1.99.9-1.99 2L4 20c0 1.1.89 2 1.99 2H18c1.1 0 2-.9 2-2V8l-6-6H6zm7 7V3.5L18.5 9H13z"/></g></svg>파일</a></div>
	       				<div class="div2_1"><a href="" style="text-decoration:none; color: black;"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path fill="currentColor" fill-rule="evenodd" d="M3.9 12c0-1.71 1.39-3.1 3.1-3.1h4V7H7c-2.76 0-5 2.24-5 5s2.24 5 5 5h4v-1.9H7c-1.71 0-3.1-1.39-3.1-3.1zM8 13h8v-2H8v2zm9-6h-4v1.9h4c1.71 0 3.1 1.39 3.1 3.1 0 1.71-1.39 3.1-3.1 3.1h-4V17h4c2.76 0 5-2.24 5-5s-2.24-5-5-5z"/></svg>링크</a></div>
	    			</div>
				</div>
				

			</header>
			
			<main id="todo_main">
				<section id="todo_main_left">
					<article id="todo_article">
						
					<%
						ArrayList<TodoListDto> tDtoList = (ArrayList<TodoListDto>)request.getAttribute("tDtoList");
						for (int i = 0; i<tDtoList.size(); i++){
							
					%>
						<div>	<!-- (할일1개당) 시작 -->
							<div class="todo_content_list">
								<div style="display: none;" class="todo_id"><%=tDtoList.get(i).getTodo_id() %></div>
								
								<div class="todo_content1">
									<div>
										<button class="todo_content1_button">
											<svg xmlns="http://www.w3.org/2000/svg" width="24px" height="24px" viewBox="0 0 24 24" _title="할 일 상태 변경">
												<g fill="none" fill-rule="evenodd">
													<%= tDtoList.get(i).getTodo_cur_p() %>
												</g>
											</svg>
										</button>
									</div>
								</div>
								<div class="todo_content2">
									<div class="todo_content2_title">
										<a class="todo_content2_title_a"><%= tDtoList.get(i).getContent() %></a>
										<span class="todo_content2_date"><%= tDtoList.get(i).getDate() %></span>
									</div>
									<div class="todo_content2_space">
										<a class="todo_content2_space_a"><%= tDtoList.get(i).getWorkspace_name() %></a>
									</div>
								</div>
								<div class="todo_content3">
									<div>
										<button size="20" class="avatar_container" name="">
											<div class="todo_avatar" style="background-image: url(<%= tDtoList.get(i).getWriter_p() %>)"></div>
										</button>
									</div>
									<svg xmlns="http://www.w3.org/2000/svg" width="5.5" height="7" viewBox="0 0 11 14" style="margin-top: 10px; margin-left: 7px; margin-right: 7px;"><path fill="#888888" fill-rule="evenodd" d="M0 0v14l11-7z"></path></svg>
									<div>
										<button size="20" class="avatar_container" name="" >
											<div class="todo_avatar" style="background-image: url(<%= tDtoList.get(i).getPic_p() %>)"></div>
										</button>
									</div>
								</div>
							</div>
						</div>	<!-- 끝 -->
					<%
						}
					%>
					</article>
				</section>
				
				
				<aside class="todo_aside_container">
					<h6 class="todo_aside_filtertitle">마감이 임박한 내 할 일</h6>
					<ul>
					<%
					ArrayList<TodoListDto> todoListW = (ArrayList<TodoListDto>)request.getAttribute("todoListW");
					for(int i = 0; i<todoListW.size(); i++){
					%>
						<li class="todo_aside_item">	<!-- 마감임박할일 시작 -->
							<div style="display: none;"><%= todoListW.get(i).getTodo_id() %></div>
							<div>
								<button class="todo_aside_iten_btn">
									<svg xmlns="http://www.w3.org/2000/svg" width="17px" height="17px" viewBox="0 0 24 24" _><g fill="none" fill-rule="evenodd"><%= todoListW.get(i).getTodo_cur_p() %></g></svg>
								</button>
							</div>
							<a class="todo_aside_item_link" href="">
								<span class="todo_aside_item_title"><%= todoListW.get(i).getContent() %></span>
								<span class="todo_aside_item_name"><%= todoListW.get(i).getWriter_p() %></span>
							</a>
						</li> <!-- 마감임박할일 끝 -->
					<%
						}
					%>
					</ul>
				</aside>
			</main>
		</div>
	</div>
	
	<div id="todo_cur_selector" role="tooltip">
		<div id="todo_cur_selector_container">
			<span id="todo_cur_selector_title">할 일 상태 변경</span>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title="">
					<g fill="none" fill-rule="evenodd">
						<path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#C1C1C1"></path>
					</g>
				</svg>할당됨
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 14.5v-9l6 4.5-6 4.5z" fill="#038EDA"></path></g></svg>
				진행 중
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 14H9V8h2v8zm4 0h-2V8h2v8z" fill="#F1AA00"></path></g></svg>
				일시중지
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#3DA200"></path></g></svg>
				완료
			</button>
			<button class="todo_cur_selector_button">
				<svg class="todo_cur_selector_svg" xmlns="http://www.w3.org/2000/svg" width="21px" height="21px" viewBox="0 0 24 24" title=""><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#009481"></path></g></svg>
				확인 요청
			</button>
		</div>
		
	</div>
	
	<div id="div_background"></div>
	<div id="div_background1"></div>
	
	<div class="workspace_list">
		<ul class="left-bar icon_color" >
			<li>공간 검색</li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>프로젝트</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>코드공유 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 12c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm0 2c-2.67 0-8 1.34-8 4v2h16v-2c0-2.66-5.33-4-8-4z"></path></svg><span>프라이빗 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-1 17.93c-3.95-.49-7-3.85-7-7.93 0-.62.08-1.21.21-1.79L9 15v1c0 1.1.9 2 2 2v1.93zm6.9-2.54c-.26-.81-1-1.39-1.9-1.39h-1v-3c0-.55-.45-1-1-1H8v-2h2c.55 0 1-.45 1-1V7h2c1.1 0 2-.9 2-2v-.41c2.93 1.19 5 4.06 5 7.41 0 2.08-.8 3.97-2.1 5.39z"></path></svg><span>모두의 공간</span></li>
			<li><svg viewBox="0 0 24 24" width="16px" height="16px"><path d="M14.027 5L13.6 3H4v18h2v-7h6l.533 2H20V5z"></path></svg><span>Test</span></li>
		</ul>
	</div>
	
	<!-- todo detail 모달 -->
	<div id="todo_modal" class="todo_layout_container">
		<div class="modal_overlay" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
		
		<div class="todo_modal1">
			<div class="todo_modal2">
				
				<form action="" method="post">
				<div id="new_todo">
					<div class="new_todo_container" style="height: 550px;">
						<header class="new_todo_header">
							<button color="mono3Grey" title="닫기" class="new_todo_btn_x" style="margin-left: 510px;">
								<svg viewBox="0 0 24 24" width="24px" height="24px" class="btn_x_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="btn_x_path"></path></svg>
							</button>
						</header>

						<div>
						
							<div class="TodoDetailModal_title_container">
								<div>
									<button type="button" class="TodoDetailselector_btn"><svg xmlns="http://www.w3.org/2000/svg" width="32px" height="32px" viewBox="0 0 24 24"><g fill="none" fill-rule="evenodd"><path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z" fill="#C1C1C1"></path></g></svg></button>
								</div>
								<div class="edit_title_container">
									<textarea maxlength="101" placeholder="제목을 입력해 주세요." spellcheck="false" class="edit_title_input"></textarea>
								</div>
							</div>
				
							<div class="todo_detail_assign_container">
								<div class="todo_detail_assign_writer">
									<div class="todo_modal_avatar_container">
										<div class="todo_modal_avatar" id="todo_detail_writer_avatar"></div>
									</div>
									<span class="todo_modal_writer_name" id="todo_detail_writer_name"></span>
								</div>
								<svg viewBox="0 0 24 24" width="12px" height="12px" class="todo_detail_assign_svg"><path d="M4 0v24l18-12z" color="#D3D3D3" class="todo_detail_assign_path"></path></svg>
								<div class="todo_detail_assign_pic">
									<div class="todo_modal_avatar_container">
										<div class="todo_modal_avatar" id="todo_detail_pic_avatar"></div>
									</div>
									<span class="todo_modal_writer_name" id="todo_detail_pic_name"></span>
								</div>
							</div>
							
							<div class="new_todo_datecontainer">
								<div class="todo_date_picker_container">
								
									<div class="todo_date_picker_icon_area">
										<svg viewBox="0 0 24 24" width="20px" height="20px" class="btn_x_svg"><path d="M11.99,2 C17.52,2 22,6.48 22,12 C22,17.52 17.52,22 11.99,22 C6.47,22 2,17.52 2,12 C2,6.48 6.47,2 11.99,2 Z M12,4 C7.58,4 4,7.58 4,12 C4,16.42 7.58,20 12,20 C16.42,20 20,16.42 20,12 C20,7.58 16.42,4 12,4 Z M12.5,7 L12.5,12.25 L17,14.92 L16.25,16.15 L11,13 L11,7 L12.5,7 Z" class="todo_date_picker_icon_path"></path></svg>
									</div>
									
									<div class="todo_date_picker">
										<div class="todo_date_picker_datecontainer">
											<div>
												<!-- <button id="todo_start_date_picker_btn" class="todo_picker_date_btn" >시작일 추가</button> -->
												<input name="todo_startd" type='text' id="todo_start_date_picker_btn" class="todo_picker_date_btn"  value='시작일 추가'/>
											</div>
											
											<span class="todo_date_picker_devide" style="padding: 0px 10px 0px 6px;">~</span>
											
											<div>
												<!-- <button id="todo_finish_date_picker_btn" class="todo_picker_date_btn">완료일 추가</button> -->
												<input name="todo_finishd" type='text' id="todo_finish_date_picker_btn" class="todo_picker_date_btn"  value='완료일 추가'/>
												
											</div>
										</div>
									</div>
									
								</div>
							</div>
							
						</div>

						<div class="new_todo_edit_des_container">
								<div class="edit_des_iconcontainer">
									<svg viewBox="0 0 24 24" width="21px" height="21px" class="btn_x_svg"><path d="M5 1h13.6a2 2 0 0 1 2 2v18a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm.467 1.467a1 1 0 0 0-1 1v17.066a1 1 0 0 0 1 1h12.666a1 1 0 0 0 1-1V3.467a1 1 0 0 0-1-1H5.467zm1.444 8.555V9.556h9.778v1.466H6.91zm0-3.666V5.889h9.778v1.467H6.91z" class="btn_x_path"></path></svg>
								</div>
								
								<textarea name="todo_des" maxlength="501" placeholder="할 일 설명 추가" spellcheck="false" class="edit_des_textarea"></textarea>
							</div>
						
						<footer class="new_todo_footer">
							<div class="new_todo_footercell"  style="margin-top: 170px;  margin-left: 400px;">
								<button type="button" color="primary" class="todo_detail_btn" id="todo_detail_btn_del" style="margin-right: 10px;">삭제</button>
								<button type="button" color="primary" class="todo_detail_btn" id="todo_detail_btn_edit">수정</button>
							</div>
						</footer>

					</div>
				</div>
				</form>
				
			</div>
		</div>
	</div>
	
</body>
</html>
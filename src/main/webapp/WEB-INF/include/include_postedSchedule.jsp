<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발행된 일정</title>
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
	input{
		background-color: #fff;
	}
	textarea{
		resize: none;
		overflow: auto;
		margin: 0;
	}
	.schedule_layout_container{
		top: 0;
	    left: 0;
	    right: 0;
	    bottom: 0;
	    z-index: 1300;
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
	.schedule_modal1{
		opacity: 1;
   		transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
   		height: 100%;
   		outline: none;
   		display: flex;
   		align-items: center;
   		justify-content: center;
	}
	.schedule_modal2{
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
	.schedule_container{
		background-color: rgb(255, 255, 255);
	    width: 580px;
	    padding: 20px 20px 22px;
	    border-radius: 4px;
	}
	#schedule_modal .schedule_header{
		display: flex;
	    flex-direction: row;
	    -webkit-box-align: center;
	    align-items: center;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    padding-left: 4px;
	}
	#schedule_modal .schedule_h6{
		font-size: 12px;
	    font-weight: bold;
	    line-height: 1.5;
	    color: rgb(136, 136, 136);
	}
	.schedule_btn_x{
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
	.schedule_inputcontainer{
		display: flex;
   		flex-direction: row;
	}
	.schedule_path{
		fill: rgb(225, 225, 225);
	}
	.schedule_input{
		width: 505px;
	    margin-left: 10px;
	    font-size: 22px;
	    color: rgb(34, 34, 34);
	    line-height: 1.45;
	    border: none;
	}
	.schedule_assign{
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
	.schedule_datecontainer{
		border-top: 1px solid rgb(225, 225, 225);
   		padding-top: 24px;
	}
	.schedule_date_picker_container{
		display: flex;
		margin: 3px 0px 5px0px;
	    flex-direction: row;
	    align-items: flex-start;
	}
	.schedule_date_picker{
		display: flex;
	    flex-flow: row wrap;
	    -webkit-box-align: center;
	    align-items: center;
	    padding-left: 4px;
	    font-size: 16px;
	    line-height: 24px;
	}
	.schedule_date_picker_datecontainer{
		display: flex;
	    flex-flow: row wrap;
	    -webkit-box-align: center;
	    align-items: center;
	    flex: 1 1 0%;
	}
	.schedule_picker_date_btn{
		font-weight: normal;
		font-size: 16px !important;
		height: 24px;
	    padding: 0px 1px;
	    line-height: 24px;
	    background-color: transparent;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    color: rgb(34, 34, 34);
	    pointer-events: auto;
	    width: 80px;
	}
	.schedule_picker_date_btn:hover{
		border-radius: 4px;
	    background-color: rgb(247, 246, 245);
	    color: rgb(34, 34, 34);
	}
	.schedule_footer{
		display: flex;
	    flex-direction: row;
	    -webkit-box-pack: justify;
	    justify-content: space-between;
	    margin-top: 40px;
	}
	.schedule_footercell{
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
	.schedule_detail_btn{
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
	    border: 1px solid rgb(217, 173, 43);
   		background-color: rgb(217, 173, 43);
	    cursor: pointer;
	    opacity: 1;
	    width: auto;
	    box-shadow: none;
	}
	.schedule_detail_btn:hover{
		background-color: rgb(179, 142, 34);
   		border-color: rgb(179, 142, 34);
	}
	.schedule_date_picker_devide{
		display: inline-block;
	    color: rgb(34, 34, 34);
	    font-size: 12px;
	    line-height: 1.5;
	}
    .schedule_projectdropdowncontainer{
       	position: relative;
   		margin-right: 12px;
	}
    .schedule_projectdropdowncontainer1{
       	position: relative;
   		box-sizing: border-box;
   		width: 160px;
	    border-width: 1px;
	    border-style: solid;
	    border-radius: 4px;
	    background-color: rgb(255, 255, 255);
	    border-color: rgb(217, 173, 43);
	}
       .schedule_projectdropdowncontainer2{
       	-webkit-box-align: center;
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
	.schedule_projectdropdown_componet{
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
	.schedule_projectdropdown_workspace{
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
	.schedule_projectdropdown_workspace>span{
       	display: inline-block;
	    width: 100%;
	    white-space: nowrap;
	    text-overflow: ellipsis;
	    overflow: hidden;
    }
    .schedule_filescontainer{
	    max-height: calc(100vh - 434px);
	    height: 100%;
	    overflow-y: scroll;
       }
    .schedule_edit_file_container{
       	margin: 16px 0px;
       }
    .edit_des_iconcontainer{
       	margin: 3px 10px 0px 5px;
       }
	.schedule_edit_des_container{
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
	.schedule_input::-webkit-scrollbar {
		width:4px;
	}
	.schedule_input::-webkit-scrollbar-thumb {
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
		z-index: 2000;
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
    .scheduleDetailModal_title_container{
      	display: flex;
    	flex-direction: column;
    	margin-left: 4px;
    }
    .scheduleDetailselector_btn{
      	background-color: transparent;
    	transform: translateY(2px);
    	cursor: pointer;
    }
    .scheduleDetailselector_btn svg{
    	transition: fill 0.2s ease 0s;        	
    }
    .scheduleDetailselector_btn:hover svg path{
        fill: rgb(163, 163, 163);        	
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
	.edit_title_input::placeholder{
		font-size:22px;
	}

</style>

</head>
<body>
<div id="schedule_modal" class="schedule_layout_container hidden">

	<div class="modal_overlay" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
	<div class="schedule_modal1">
		<div class="schedule_modal2">
			<!-- <form action="" method="post"> -->
			<div id="posted_schedule">
				<div class="schedule_container column" style="height: 550px;">
			
				<header class="schedule_header">
					<button color="mono3Grey" title="닫기" class="schedule_btn_x" style="margin-left: 510px;">
						<svg viewBox="0 0 24 24" width="24px" height="24px" class="btn_x_svg"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z" class="btn_x_path"></path></svg>
					</button>	
				</header>
				<%
				%>
				<div class="column">
					<div class="scheduleDetailModal_title_container column">
					<div class="row">
						<div>
							<button class="scheduleDetailselector_btn"><svg width="28px" height="28px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M17 12h-5v5h5v-5zM16 1v2H8V1H6v2H5c-1.11 0-1.99.9-1.99 2L3 19a2 2 0 0 0 2 2h14c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-1V1h-2zm3 18H5V8h14v11z"></path></svg></button>
						</div>
						<div class="edit_title_container">
							<textarea maxlength="101" placeholder="제목을 입력해 주세요." spellcheck="false" class="edit_title_input"></textarea>
						</div>
					</div>
					<div class="schedule_date_picker_container">
						<div class="schedule_date_picker">
							<div class="schedule_date_picker_datecontainer">
								<div>
									<!-- <button id="schedule_start_date_picker_btn" class="schedule_picker_date_btn" >시작일 추가</button> -->
									<input name="schedule_startd" type='text' id="schedule_start" class="schedule_picker_date_btn"  value='시작일 추가'/>
								</div>
								<span class="schedule_date_picker_devide" style="padding: 0px 10px 0px 6px;">~</span>
								<div>
									<!-- <button id="schedule_finish_date_picker_btn" class="schedule_picker_date_btn">완료일 추가</button> -->
									<input name="schedule_finishd" type='text' id="schedule_end" class="schedule_picker_date_btn"  value='완료일 추가'/>
								</div>
							</div>
						</div>
					</div>
					
					<div style="margin:5px 0px 20px 0px;">
						<button class="assign_list_btn" style="background-color:rgb(225,225,225);" type="button">
							<svg viewBox="0 0 24 24" width="20px" height="20px" class="btn_x_svg"><path d="M9 11.75a1.25 1.25 0 1 0 0 2.5 1.25 1.25 0 0 0 0-2.5zm6 0a1.25 1.25 0 1 0 0 2.5 1.25 1.25 0 0 0 0-2.5zM12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8 0-.29.02-.58.05-.86 2.36-1.05 4.23-2.98 5.21-5.37a9.974 9.974 0 0 0 10.41 3.97c.21.71.33 1.47.33 2.26 0 4.41-3.59 8-8 8z" color="#C1C1C1" class="assign_list_path"></path></svg>
							<div class="assign_list_view">
								<span class="assign_list_span">강지현</span>
							</div>
						</button>
					</div>
					
					<div class="schedule_datecontainer"></div>
					</div>
					<!-- <div class="schedule_assign">
						<div class="user_manage">
							
						</div>
					</div> -->
				</div>
				
				<!-- <div class="schedule_edit_des_container">
					<div class="edit_des_iconcontainer">
						<svg viewBox="0 0 24 24" width="21px" height="21px" class="btn_x_svg"><path d="M5 1h13.6a2 2 0 0 1 2 2v18a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2zm.467 1.467a1 1 0 0 0-1 1v17.066a1 1 0 0 0 1 1h12.666a1 1 0 0 0 1-1V3.467a1 1 0 0 0-1-1H5.467zm1.444 8.555V9.556h9.778v1.466H6.91zm0-3.666V5.889h9.778v1.467H6.91z" class="btn_x_path"></path></svg>
					</div>
					<textarea name="schedule_des" maxlength="501" placeholder="할 일 설명 추가" spellcheck="false" class="edit_des_textarea"></textarea>
				</div> -->
				
			<div style="min-height:275px; overflow:auto;">
                <div id="schedule_attendee">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M8,13 C8.44380952,13 8.97251701,13.042449 9.53767844,13.1272778 L9.96762769,13.1988446 L10.1863094,13.2405857 L10.1863094,13.2405857 L10.6282484,13.335979 C12.6995674,13.8181974 14.8465478,14.8190402 14.9921524,16.3355444 L15,16.5 L15,19 L1,19 L1,16.5 C1,14.8911905 3.22645692,13.8354195 5.37175157,13.335979 L5.81369061,13.2405857 L6.03237231,13.1988446 L6.03237231,13.1988446 L6.46232156,13.1272778 C6.95683781,13.0530526 7.42344401,13.0112744 7.82968645,13.0019897 L8,13 Z M16,13 C16.4438095,13 16.972517,13.042449 17.5376784,13.1272778 L17.9676277,13.1988446 C18.0401728,13.2120964 18.1130982,13.2260102 18.1863094,13.2405857 L18.6282484,13.335979 C20.6995674,13.8181974 22.8465478,14.8190402 22.9921524,16.3355444 L23,16.5 L23,19 L17,19 L17,16.5 C17,15.02 16.19,13.89 15.03,13.05 C15.38,13.02 15.71,13 16,13 Z M8,15 C6.97965547,15 5.491506,15.2840212 4.36930568,15.7330936 C3.80433548,15.9591785 3.3721832,16.2096374 3.12198987,16.4403759 L3.02415633,16.5274912 C3.00685247,16.5397253 3.00191646,16.5362153 3.00052995,16.5201426 L3,17 L13,17 L12.99947,16.5201426 C12.9980835,16.5362153 12.9931475,16.5397253 12.9758437,16.5274912 L12.8780101,16.4403759 C12.6278168,16.2096374 12.1956645,15.9591785 11.6306943,15.7330936 C10.508494,15.2840212 9.02034453,15 8,15 Z M8.00584307,4.5 C9.9457429,4.5 11.5,6.06333333 11.5,8 C11.5,9.93666667 9.9457429,11.5 8.00584307,11.5 C6.06594324,11.5 4.5,9.93666667 4.5,8 C4.5,6.06333333 6.06594324,4.5 8.00584307,4.5 Z M16,5 C17.66,5 18.99,6.34 18.99,8 C18.99,9.66 17.66,11 16,11 C14.34,11 13,9.66 13,8 C13,6.34 14.34,5 16,5 Z M8.00584307,6.5 C7.16976661,6.5 6.5,7.16865034 6.5,8 C6.5,8.83134966 7.16976661,9.5 8.00584307,9.5 C8.83761519,9.5 9.5,8.83565768 9.5,8 C9.5,7.16434232 8.83761519,6.5 8.00584307,6.5 Z" color="#75726f"></path></svg></div>
                    <input type="text" id="schedule_attendee_sel" class="icon2_sch" placeholder="참석자 추가" style="border: none; box-shadow: none; cursor: pointer;">
                    <div class="attendee_list hidden"><!-- 참석자 목록 -->
                        <ul>
                            <!-- <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강지현</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">이정민</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">김유라</li></div>
                            <div><div class="picture_sch" style="background-image:url(https://down.collabee.co/userProfile/2972655)"></div><li email="twekyaak@gmail.com">강태안</li></div> -->
                        </ul>
                    </div>
                </div>
                <!-- 선택된 멤버들 div -->
                <div class="row picked_attendee"></div>
                
                <div id="schedule_location">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M12,1.5 C16.1464286,1.5 19.5,4.7865 19.5,8.85 C19.5,10.8625 18.5003779,13.2248677 17.2310166,15.4134123 L16.8942399,15.9800496 L16.548105,16.5367347 L16.1954912,17.0814017 L15.8392782,17.6119845 L15.4823453,18.1264172 L15.127572,18.6226337 L14.7778378,19.0985681 L14.436022,19.5521542 L14.1050043,19.9813261 L13.6350226,20.5747879 L13.0730483,21.2613379 L12.6060961,21.8130427 L12,22.5 L11.5845481,22.0331633 L11.1737453,21.5550789 L10.6564026,20.9338855 L10.2123361,20.3840178 L9.89499574,19.9813261 L9.56397797,19.5521542 L9.04810496,18.8632653 L8.60666295,18.2522598 L8.60666295,18.2522598 L8.16072178,17.6119845 L7.80450875,17.0814017 L7.45189504,16.5367347 L7.10576012,15.9800496 L6.76898343,15.4134123 C5.49962207,13.2248677 4.5,10.8625 4.5,8.85 C4.5,4.7865 7.85357143,1.5 12,1.5 Z M12,3.5 C8.94919823,3.5 6.5,5.90021427 6.5,8.85 C6.5,9.7886792 6.82202538,10.9901559 7.44497146,12.3757437 C8.03843625,13.6957578 8.87719392,15.1262865 9.89733893,16.6080471 C10.5245873,17.5191253 11.1899804,18.4062371 11.8628789,19.2460749 L11.999,19.414 L12.1371211,19.2460749 C12.641795,18.6161965 13.1422471,17.9597266 13.6255514,17.2864979 L14.1026611,16.6080471 C15.1228061,15.1262865 15.9615637,13.6957578 16.5550285,12.3757437 C17.1779746,10.9901559 17.5,9.7886792 17.5,8.85 C17.5,5.90021427 15.0508018,3.5 12,3.5 Z M12,6.5 C13.38,6.5 14.5,7.62 14.5,9 C14.5,10.38 13.38,11.5 12,11.5 C10.62,11.5 9.5,10.38 9.5,9 C9.5,7.62 10.62,6.5 12,6.5 Z" color="#75726f"></path></svg></div>
                    <textarea rows="1" class="icon2_sch" placeholder="장소 입력"></textarea>
                </div>
                
                <div id="schedule_summary">
                    <div class="icon_sch"><svg viewBox="0 0 24 24" width="20px" height="20px" class="icon_color"><path d="M18.5,1.5 C19.6045695,1.5 20.5,2.3954305 20.5,3.5 L20.5,20.5 C20.5,21.6045695 19.6045695,22.5 18.5,22.5 L5.5,22.5 C4.3954305,22.5 3.5,21.6045695 3.5,20.5 L3.5,3.5 C3.5,2.3954305 4.3954305,1.5 5.5,1.5 L18.5,1.5 Z M18.5,3.5 L5.5,3.5 L5.5,20.5 L18.5,20.5 L18.5,3.5 Z M7.5,12.5 L7.5,10.5 L16.5,10.5 L16.5,12.5 L7.5,12.5 Z M7.5,8.5 L7.5,6.5 L16.5,6.5 L16.5,8.5 L7.5,8.5 Z" color="#75726f"></path></svg></div>
                    <textarea class="icon2_sch" placeholder="일정에 대한 설명" style="border: none; box-shadow: none; color: rgb(136, 136, 136);"></textarea>
                </div>
            </div>
				
<style>
	#schedule_attendee {
		display: flex;
	    flex-direction: row;
	    position: relative;
	    min-height: 28px;
	}
	#schedule_modal .icon_sch {
	    margin: 4px 10px 0px 8px;
	    /* padding-top: 4px; */
	}		
	#schedule_modal .icon_color {
	    fill: rgb(136, 136, 136);
	}
	#schedule_modal .icon2_sch {
	    width: 100%;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    font-size: 14px;
	    border-radius: 4px;
	    background-color: transparent;
	    color: rgb(136, 136, 136);
	    margin-right: 30px;
	}	
	#schedule_modal .attendee_list {
	    height: 180px;
	    width: 240px;
	    line-height: 2.3;
	    cursor: pointer;
	    transition: color 0.2s ease 0s, background-color 0.2s ease 0s;
	    position: absolute;
	    font-size: 14px;
	    color: rgb(34, 34, 34);
	    border: 1px solid rgb(247,239,213);
	    border-radius: 4px;
	    padding: 1px;
	    background-color: #fff;
	    margin-left: 36px;
	    margin-top: 28px;
	    overflow: auto;
	}
	#schedule_modal .attendee_list ul {
	    list-style: none;
	    padding-top: 12px;
	    padding-left: 16px;
	}			
	.picked_attendee {
	    flex-wrap: wrap;
	    display: flex;
	    padding-left: 40px;
	}
	.selected_attendee{
        display: flex;
        height: 32px;
        margin: 8px 4px 0px 0px;
        padding: 5px 10px 5px 13px;
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
    #schedule_attendee_sel{ /*참석자 추가*/
        height: 28px;
        padding-left: 4px;
        font-weight: normal;
        text-align: left;
        line-height: 28px;
    }			
	#schedule_location {
	    display: flex;
	    flex-direction: row;
	    margin-top: 14px;
	    align-items: center;
	}			
	#schedule_location > textarea {
	    border-radius: 4px;
	    text-align: left;
	    height: auto;
	    padding-left: 4px;
	    line-height: 1.5;
	    resize: none;
	    border: none;
	    overflow: hidden;
	}
	#schedule_summary {
	    display: flex;
	    flex-direction: row;
	    margin-top: 14px;
	    padding: 3px 3px 0px 0px;
	    font-size: 14px;
	}			
	#schedule_summary > textarea {
	    min-height: 50px;
	    padding: 2px 4px;
	    padding-left: 2px;
	    overflow-wrap: break-word;
	    border: none;
	    resize: none;
	}
</style>

<script>
var workspaceId = <%=request.getParameter("workspaceId")%>;
var workspaceName = "<%=request.getParameter("workspaceName")%>";
var loginId = 4;
var gg;
$(function(){
	 //공유된 일정 클릭
	    $(document).on("click", "input[title='일정제목']", function(){
	    	var scheduleId = $(this).attr("scheduleId");
	    	$("#schedule_modal").removeClass("hidden").attr("scheduleId", scheduleId);
	    	/* var scheduleId = $("#schedule_modal").attr("scheduleId"); */
	    });
	 
    	/* $.ajax({
			type:"post",
			url:"Controller?command=scheduleGetter",
			data:{
				"scheduleId_1":$("input[title='일정제목']").attr("scheduleId"),
				
			},
			datatype:"json",
			success:function(data){
				//$.each(data, function(index, item){
					$(".edit_title_container textarea").val(data.title);					
					$("#schedule_start").val(data.startDate); //날짜 나오는 형식 다름
					$("#schedule_end").val(data.finishDate);
					$("#schedule_location > textarea").val(data.locations);
					$("#schedule_summary > textarea").val(data.content);//여기까지는 성공
					
					$(".attendee_list ul li").each(function(index, item) {
						var memberId = $(item).attr("scheduleattendee_id");
						if(data.writerId==memberId){
						$(".assign_list_span").text($(item).attr("name"));							
							//참석자 배열만 풀어서 넣으면 됨.....!!!
						}
						var atd = data.attendee;
						for(var i in atd){
							if(atd[i]==memberId){
								var setPickedMember = "<div class='selected_attendee' email='"+$(item).attr("email")+"' scheduleattendee_id='"+memberId+"'><span>"+$(item).text()+"</span></div>";
								$("#schedule_modal .picked_attendee").append(setPickedMember);
							}
						}
					});
					/* var atd = item.attendee.split(",");
					for(var i in atd){
						
					} */
					/* $(".attendee_list ul li").each(function(index, item2) {
						var memberId = $(item2).attr("scheduleAttendee_id");
						var attendeeId = item.attendee;
						alert(memberId);
						if(memberId == item.attendee.get(i)) {
							var setPickedMember = "<div class='selected_attendee' email='"+$(item2).attr("email")+"' scheduleattendee_id='"+memberId+"'><span>"+$(item2).attr("name")+"</span></div>";
						$(".picked_attendee").append(setPickedMember);								
	    	 		});
					
				$(".attendee_list ul li").each(function(index, item){//item.attendee까지는 잘 들어옴
					for(var i = 0; i <= (item.attendee.length)-1; i++){
						}
					}
				}); *///attendee_list ul li
				//});//item
		/*	},
			error:function(r,s,e){
				alert("error!");	
			}
		}); //ajax2 */
		
    	 $.ajax({//참석자 리스트 세팅
			type:"post",
			url:"Controller?command=getThisWorkspaceMember",
			data:{
				"workspaceId" : workspaceId,
				"loginId":loginId//loginId//로그인한 ID
			},
			datatype:"json",
			success:function(data){
				$.each(data, function(index, item) {
					var memberLi = "<li email='"+item.email+"' scheduleAttendee_id='"+item.member_id+"'>"+item.name+"</li>";
					$("#schedule_modal .attendee_list ul").append(memberLi);						
				});//참석자 리스트 세팅
				
			}//success
    	 });//ajax
    	
    	 
    	 
	$("#schedule_modal .attendee_list ul div").hover(function() {
        $(this).css("background-color", "rgb(242,242,242)");
    },  function() {
        $(this).css("background-color", "rgb(255, 255, 255)");
    });
    
    //참석자
    $("#schedule_attendee_sel").on("focus", function (){
       	$(this).attr("placeholder","참석자 이름, 이메일 주소 입력").css({color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow': "0 0 4px rgb(247,239,213)", 'padding-right':"200px", cursor:"text"});
       	$(".attendee_list").removeClass("hidden"); //리스트 열기
    });
    
    //클릭하면 아래에 추가
    $(document).on("click","#schedule_modal .attendee_list li", function(){
        var name = $(this).text();//선택한 멤버 이름
        //var _url = $(this).find(".picture_sch").css("background-image");
        //var url = _url.substring(_url.indexOf('"')+1, _url.lastIndexOf('"')); //프로필사진주소
        var email = $(this).attr("email");  // 선택한 멤버 이메일
        var memberId = $(this).attr("scheduleattendee_id");
        $("#schedule_modal .attendee_list").addClass("hidden");
        $(this).detach();//고른 멤버 리스트에서 삭제.
            
        var setPickedMember = "<div class='selected_attendee' email='"+email+"' scheduleattendee_id='"+memberId+"'><span>"+name+"</span></div>";
        $("#schedule_modal .picked_attendee").append(setPickedMember);
    });
    
    //클릭하면 사라짐
    $(document).on("click","#schedule_modal .selected_attendee", function(){
    	var name = $(this).find("span").text();//선택한 멤버 이름
        var email = $(this).attr("email");  // 선택한 멤버 이메일
        $(this).detach();
        
        var setPickedMember = "<li email='"+email+"'>"+name+"</li>";
        $("#schedule_modal .attendee_list ul").append(setPickedMember);
    });	
    
	//참석자 리스트 밖 영역 누르면 닫기
    $(document).click(function(e){
	    if($(e.target).is('#schedule_attendee_sel')) {
	    	$(this).attr("placeholder","참석자 이름, 이메일 주소 입력").css({color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow': "0 0 4px rgb(247,239,213)", 'padding-right':"200px", cursor:"text"});
	       	$("#schedule_modal .attendee_list").removeClass("hidden"); //리스트 열기
	    } else {
	    	$("#schedule_attendee_sel").attr("placeholder","참석자 추가").css({border:"none","box-shadow":"none", cursor:"pointer"});
	        $("#schedule_modal .attendee_list").addClass("hidden");
	    }
    });
	
	//장소
	$("#schedule_location > textarea").focus(function() {
	    $(this).attr("placeholder","회의 장소 / 모일 장소명 입력").css({color:"rgb(136, 136, 136)", border:"1px solid rgb(217, 173, 43)", 'box-shadow':"0 0 4px rgb(247,239,213)",'box-shadow':"0 0 0 4px rgb(247,239,213)", cursor:"text"});
	});
	
	//높이 자동 조절
	$("#schedule_location > textarea").keydown(function(){
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
	$("#schedule_location > textarea").on("keyup", function(){
	    $(this).css("height", "auto"); //다시 오토로 만들고
	    var height = $(this).prop("scrollHeight"); //스크롤 길이 측정
	    $(this).css("height", height); //스타일에 대입
	});
	
	$("#schedule_location > textarea").blur(function () {
	    $(this).attr("placeholder","장소 입력").css({border:"none", 'box-shadow':"none", color:"rgb(136,136,136)"});
	});
	
	//일정 설명
	$("#schedule_summary > textarea").focus(function(){
	    $(this).css("border", "1px solid rgb(217, 173, 43)").css("box-shadow", "0 0 4px rgb(247,239,213)").css("box-shadow", "0 0 0 4px rgb(247,239,213)");
	});
	$("#schedule_summary > textarea").blur(function() {
	    $(this).css({border:"none", 'box-shadow':"none", color:"rgb(136,136,136)"});
	});	

	//datepicker
    $("#schedule_start, #schedule_end").datepicker({//datepicker호출
        dateFormat:"yy.mm.dd" ,showOthermonths: true ,showMonthAfterYear:true
        ,buttonImageOnly:true ,yearSuffix:"년", monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"]
        ,dayNamesMin:["일","월","화","수","목","금","토"]
        , showButtonPanel:true, currentText:"오늘", closeText:"닫기"
        /* var start_date = $("#startSche");
        var finish_date = $("#endSche");  */
    });
    //현재날짜 가져오기
    $("#schedule_start, #schedule_end").datepicker("setDate", new Date()); 
    
    //finish가 start보다 전이면 start가 선택한 finish 날짜로 변함
    $('#schedule_start').datepicker("option", "onClose", function (selectedDate) {
        $("#schedule_end").datepicker("option", "minDate", selectedDate);
    });
    
    
    
    
    //x버튼 클릭
    $(".schedule_btn_x").on("click", function(){
    	$("#schedule_modal").addClass("hidden");
    	$(".selected_attendee").detach();
    });
    
    //모달 닫기 뭐야
    $(".schedule_modal2").on("click", function(e){
    	if($(this).is(e.target)){
    		$("#schedule_modal").addClass("hidden");
    	} else {
    		
    	}
    });
    
    //일정 수정, 삭제
    $(".schedule_footercell > button").on("click", function(){
    	var text = $(this).text();
    	var command="";
    	var setData="";
    	var scheduleId = $("#schedule_modal").attr("scheduleId");
    	$("#schedule_modal").addClass("hidden");
    	switch(text) {
		case "수정" :
			command="updateSchedule";
			var attendee = "";
			$("#schedule_modal .selected_attendee").each(function(index, item) {
				attendee += $(item).attr("scheduleAttendee_id")+"_";//undifined
			});
			setData= {
				"scheduleId":scheduleId,
				"title":$(".edit_title_input").val(),
				"startDate" : $("#schedule_start").val()+" 00:00:00",
				"finishdate" : $("#schedule_end").val()+" 23:59:59",
				"locations" : $("#schedule_location > textarea").val(),
				"summary" : $("#schedule_summary > textarea").val(),
				"attendee" : attendee
			}
			//result = "수정";
			break;
		case "삭제" :
			if(confirm("일정을 삭제하시겠습니까?")==true) {
				command="deleteSchedule";
				setData = {
					"scheduleId":scheduleId //연결된 문서 있는지??
				}
				//result="삭제";
			}
			break;
		}
    	$.ajax({
    		type:"post",
    		url:"Controller?command="+command,
    		data:setData,
    		datatype:"json",
    		sucess:function(data) {
				var alert_message = $(".alert").html(x+"일정이 "+text+"되었습니다.");
				alert_message.fadeIn(function(){
					setTimeout(function() {
						alert_message.fadeOut(); //3초후에 자동으로 닫힘
				   	}, 3000);
				//안내메세지 높이
				var height = alert_message.prop("scrollHeight");
				alert_message.css("height", height);
				});
    		}, 
    		error:function(r,s,e) {
    			alert("error!");
    		}
    	});
    });
    
    
    
    
    
});
</script>
					
				<footer class="schedule_footer">
					<div class="schedule_footercell"  style="margin-left: 400px;">
						<button type="button" color="primary" class="schedule_detail_btn" style="margin-right: 10px;">삭제</button>
						<button type="button" color="primary" class="schedule_detail_btn">수정</button>
					</div>
				</footer>
			</div>
		</div>
		<!-- </form> -->
		</div>
	</div>
</div>



</body>
</html>
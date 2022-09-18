<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

    <style>
    *{
        box-sizing: border-box;
        outline:none;
        margin:0;
        padding:0;
        font-family: -apple-system,BlinkMacSystemFont,Malgun Gothic,Hiragino Kaku Gothic ProN,Hiragino Sans,Meiryo,MS PGothic,sans-serif,Dotum;   
    }
    input, button{
        border:none;
        font-size:20px;
    }
    .row{
        display:flex;
        flex-direction: row;
    }
    .column{
        display:flex;
        flex-direction:column;
    }
    .hidden{
        visibility:hidden;
        opacity:0;
    }
    .modal_payment{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;
        height:100%;
        z-index: -1;
        position: fixed;
        /* touch-action: none; */
        background-color: rgba(0, 0, 0, 0.5);
        -webkit-tap-highlight-color: transparent;
        transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
    }
    .modal_payment_content{
        /* position:relative; */
        background:rgb(255,255,255);
        box-shadow:0px 11px 15px -7px rgb(0 0 0 / 20%), 0px 24px 38px 3px rgb(0 0 0 / 14%), 0px 9px 46px 8px rgb(0 0 0 / 12%);
        border-radius: 4px;
        width:580px;
        height:570px;
        padding:28px;
    }
    .payment_title{
        font-size: 16px;
        font-weight: bold;
        line-height: 1.5;
        color: rgb(34, 34, 34);
    }
    .closing_bnt{
        padding-left: 0;
        padding-right: 0;
        cursor: pointer;
        transition: fill 0.2s ease 0s;
        background-color: transparent;
        fill: rgb(136, 136, 136);
        border:none;
    }
    .closing_bnt:hover{
        fill:rgb(86, 86, 86);
    }
    #create_workspace label{
        display: block;
        font-size: 12px;
        font-weight: bold;
        color: rgb(136, 136, 136);
        padding-bottom: 10px;
    }
    .payment_type{
        margin-top:25px;
        font-weight:bold;
        font-size:30px;
    }
    .payment_summary{
        margin-top:8px;
        color: rgb(136, 136, 136);
        font-size:14px;
        line-height:1.4;
    }
    .payment_style1{
        justify-content:space-between; 
        align-items:center; 
        margin-top:42px;
    }
    .payment_style3{
        border-bottom:1px solid rgb(225,225,225);
        justify-content:space-between; 
        margin-top:12px;
        padding-bottom: 10px;
    }
    .payment_style3 input::placeholder{
        line-height: 1.5;
        font-size: 20px;
        color: rgb(194, 193, 193);
        font-family: Open Sans, Segoe UI, sans-serif;
    }
    .payment_style4{
        font-size:12px; 
        font-weight: bold; 
        color:rgb(136, 136, 136);
    }
    .payment_bnt{
        color:rgb(255,255,255);
        width:100%;
        height:45px;
        border-radius:4px;
        border-color: 1px solid rgb(217, 173, 43);
        background-color: rgb(217, 173, 43);
        font-size:14px;
        font-weight:bold;
        cursor:pointer;
        margin-top:45px;
        transition: background-color 0.2s ease 0s, color 0.2s ease 0s, border-color 0.4s ease 0s, fill 0.2s ease 0s, opacity 0.2s ease 0s;
    }
    .payment_bnt:hover{
        background-color: rgb(179, 142, 34);
        border-color: rgb(179, 142, 34);
    }
    .none{
        display:none;
        opacity:0;
    }
    </style>

    <script>
        $(function(){
        	
            $(".closing_bnt").click(function(){ //x누르면 닫힘
                var answer = confirm("결제과정이 진행 중입니다. 중지하고 나가시겠습니까?");
                if(answer) {
                    var modal = $(this).parent().parent().parent();
                    $(modal).css({visibility:"hidden",opacity:0});
                }
            });
            $(document).on('click', function(e){ //다른곳 누르면 닫힘
                if($(".modal_payment.hidden").is(e.target)) {
                    var answer = confirm("결제과정이 진행 중입니다. 중지하고 나가겠습니까?");
                    if(answer) {
                        $(".modal_payment.hidden").css({visibility:"hidden", opacity:0});
                    }
                }
            });
            

        });

    </script>
</head>
<body>
    
    <div id="payment_b" class="modal_payment hidden">
    <div class="modal_payment_content column">
        <div class="row" style="justify-content:space-between;">
            <span class="payment_title">요금제 결제 - 샘숭&nbsp;(4명)</span>
            <span class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></span>
        </div>

        <div class="column">
            <span class="payment_type">Business&nbsp;/&nbsp;연간 정기 결제</span>
            <p class="payment_summary">
                *&nbsp;연간 요금제는 선불로 결제됩니다.<br/>
                *&nbsp;해외결제 신용/체크카드만 결제 가능합니다.<br/>
                *&nbsp;연간요금제는 취소 시 환불되지 않으며, 잔여기간 금액은 '콜라비 적립금' 으로 <br/>회사에 적립됩니다.
            </p>
        </div>

        <div class="column">
            <div class="row payment_style1">
                <span class="payment_style4">카드정보</span>
                <img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img-pay-cards.2b5600d1.png" style="width:230px; height:20px;">
            </div>
            <div class="row payment_style3">
                <div>
                    <span><svg focusable="false" viewBox="0 0 32 21" style="width:30px;"><g fill="none" fill-rule="evenodd"><g style="fill:#515e80;"><g transform="translate(0 2)"><path d="M26.58 19H2.42A2.4 2.4 0 0 1 0 16.62V2.38A2.4 2.4 0 0 1 2.42 0h24.16A2.4 2.4 0 0 1 29 2.38v14.25A2.4 2.4 0 0 1 26.58 19zM10 5.83c0-.46-.35-.83-.78-.83H3.78c-.43 0-.78.37-.78.83v3.34c0 .46.35.83.78.83h5.44c.43 0 .78-.37.78-.83V5.83z" opacity=".2"></path><path d="M25 15h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0H4c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1z" opacity=".3"></path></g></g></g></svg></span>
                    <input type="text" placeholder="카드 번호"style="padding:2px;">
                </div>
                <div class="row" style="justify-content:right;">
                    <input type="text" placeholder="MM / YY" style="width:90px;">
                    <input type="text" placeholder="CVC" style="width:50px;">
                </div>
            </div>
        </div>

        <div class="column payment_style3">
            <span class="payment_style4" style="margin: 50px 0px 15px 0px;">이메일 주소 (영수증 수신용)</span>
            <input type="text" value="twekyaak@gmail.com">
        </div>

        <div><button class="payment_bnt">$240 매년 결제</button></div>
    </div>
    </div>


    <div id="payment_e" class="modal_payment hidden">
        <div class="modal_payment_content column">
            <div class="row" style="justify-content:space-between;">
                <span class="payment_title">요금제 결제 - 샘숭&nbsp;(4명)</span>
                <span class="closing_bnt"><svg viewBox="0 0 24 24" width="24px" height="24px"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></span>
            </div>
    
            <div class="column">
                <span class="payment_type">Enterprise&nbsp;/&nbsp;연간 정기 결제</span>
                <p class="payment_summary">
                    *&nbsp;연간 요금제는 선불로 결제됩니다.<br/>
                    *&nbsp;해외결제 신용/체크카드만 결제 가능합니다.<br/>
                    *&nbsp;연간요금제는 취소 시 환불되지 않으며, 잔여기간 금액은 '콜라비 적립금' 으로 <br/>회사에 적립됩니다.
                </p>
            </div>
    
            <div class="column">
                <div class="row payment_style1">
                    <span class="payment_style4">카드정보</span>
                    <img src="https://cdn.collabee.co/front/collabee.co/hornet/530/static/media/img-pay-cards.2b5600d1.png" style="width:230px; height:20px;">
                </div>
                <div class="row payment_style3">
                    <div>
                        <span><svg focusable="false" viewBox="0 0 32 21" style="width:30px;"><g fill="none" fill-rule="evenodd"><g style="fill:#515e80;"><g transform="translate(0 2)"><path d="M26.58 19H2.42A2.4 2.4 0 0 1 0 16.62V2.38A2.4 2.4 0 0 1 2.42 0h24.16A2.4 2.4 0 0 1 29 2.38v14.25A2.4 2.4 0 0 1 26.58 19zM10 5.83c0-.46-.35-.83-.78-.83H3.78c-.43 0-.78.37-.78.83v3.34c0 .46.35.83.78.83h5.44c.43 0 .78-.37.78-.83V5.83z" opacity=".2"></path><path d="M25 15h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0h-3c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1zm-6 0H4c-.65 0-1-.3-1-1s.35-1 1-1h3c.65 0 1 .3 1 1s-.35 1-1 1z" opacity=".3"></path></g></g></g></svg></span>
                        <input type="text" placeholder="카드 번호"style="padding:2px;">
                    </div>
                    <div class="row" style="justify-content:right;">
                        <input type="text" placeholder="MM / YY" style="width:90px;">
                        <input type="text" placeholder="CVC" style="width:50px;">
                    </div>
                </div>
            </div>
    
            <div class="column payment_style3">
                <span class="payment_style4" style="margin: 50px 0px 15px 0px;">이메일 주소 (영수증 수신용)</span>
                <input type="text" placeholder="이메일 주소를 입력해 주세요." value="twekyaak@gmail.com">
            </div>
    
            <div><button class="payment_bnt">$480 매년 결제</button></div>
        </div>
        </div>
</body>
</html>
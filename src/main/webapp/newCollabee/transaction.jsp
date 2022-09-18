<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제내역</title>
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
    a{
        text-decoration:none;
        color:rgb(34,34,34);
    }
    .transaction{
        flex: 1 0 auto;
        width: calc(100vw - 200px);
        height: 100%;
        padding: 40px 40px 0px;
        overflow: auto;
    }
    .transaction_section{
        max-width: 1120px;
        min-width: 770px;
        height:100%;

    }
    .column{
        display:flex;
        flex-direction:column;
    }
    .row{
        display:flex;
        flex-direction:row;
    }
    .transaction_back{
        transition: fill 0.2s ease 0s;
        cursor: pointer;
    }
    .transaction_back:hover svg path{
        fill: rgb(83, 83, 83);
        transition:fill 0.2s ease 0s;
    }
    .transaction_style1{
        position: relative;
        font-size: 18px;
        font-weight:bold;
        line-height: 1.22;
        color: rgb(34, 34, 34);
        padding-bottom: 4px;
    }
    .transaction_style2{
        font-size: 12px;
        line-height: 1.5;
        color: rgb(136, 136, 136);
        padding-top: 14px;
    }
    table{
        margin-top:40px;
        table-layout: fixed;
        width: 100%;
        border-collapse: collapse;
        border-spacing: 0px;
        color: rgb(34, 34, 34);
        line-height: 1.54;
        background-color: rgb(255, 255, 255);
        margin-bottom: 40px;
    }
    thead > tr > th{
        font-size: 12px;
        font-weight: bold;
        padding: 14px 3px;
        text-align: left;
        border-bottom: 1px solid rgb(225, 225, 225);
    }
    thead > tr > th:nth-child(1){
        width: 87px;
        padding-left: 10px;
    }
    thead > tr > th:nth-child(7){
        width: 59px;
    }
    thead > tr > th:last-child{
        width: 62px;
        text-align: center;
        padding-left: 0px;
        padding-right: 0px;
    }
    tbody > tr > td{
        font-size:12px;
        padding: 14px 3px;
        border-bottom-color: rgba(255, 255, 255, 0) !important;
        border-bottom: 1px solid rgb(225, 225, 225);
        line-height: 1.54;
        height: calc(100vh - 270px);
    }
    /* 스크롤 */
    ::-webkit-scrollbar {
        width: 4px;
        height:4px;
    } 
    ::-webkit-scrollbar-track{
        -webkit-box-shadow: none;
    }
    ::-webkit-scrollbar-thumb {
        border-radius: 2px;
        background-color: #e1e1e1;
    }
    </style>
</head>
<body>
    <!-- 결제 내역을 모르는데 어떻게 출력함?(해야됨) -->
    <div class="column transaction">
        <section class="transaction_section">
        <div class="row">
            <a href="" class="transaction_back"><svg width="20px" height="20px" viewBox="0 0 24 24"><path fill="#888888" fill-rule="evenodd" d="M16.41 5.41L15 4l-8 8 8 8 1.41-1.41L9.83 12z"></path></svg></a> 
            <div class="column">
                <span class="transaction_style1">결제내역</span>
                <span class="transaction_style2">아래 항목을 클릭하여 자세한 이용내역을 확인하실 수 있습니다.</span>
            </div>
        
        </div>

        <table>
            <thead>
            <tr style="font-weight:bold; font-size:12px;">
                <th>결제일</th>
                <th>항목</th>
                <th>총금액</th>
                <th>크래딧 내역</th>
                <th>크래딧 잔액</th>
                <th>결제금액</th>
                <th>결제상태</th>
                <th>영수증</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                <td colspan="8">    
                    <div class="column" style="align-items:center; text-align:center;">
                        <svg width="72px" height="72px" viewBox="0 0 24 24"><path fill="#e1e1e1" fill-rule="evenodd" d="M12 22l-2-1.5L8 22l-2-1.5L4 22V2l2 1.5L8 2l2 1.5L12 2l2 1.5L16 2l2 1.5L20 2v20l-2-1.5-2 1.5-2-1.5-2 1.5zm2-5.5V15H7v1.5h7zm3-4V11H7v1.5h10zm0-4V7H7v1.5h10z"></path></svg>
                        <p class="transaction_style2">결제내역이 없습니다.<br/>
                            월간 요금제는 후불 결제이며,<br/>
                            결제 이후에 내역을 확인하실 수 있습니다.
                        </p>
                    </div>
                </td>
                </tr>
            </tbody>

        </table>

        </section>


    </div>
</body>
</html>
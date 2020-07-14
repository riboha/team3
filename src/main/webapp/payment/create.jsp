<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>서울여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">

<link rel="stylesheet" href="../css/style.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

 <script type="text/javascript">
 
 $(function() { // 자동 실행
   $('#btn_send').on('click', send); 
 });

 function send(){
   
   var frm = $('#frm');
   var mem_no = $('#mem_no', frm).val();
   var at_no = $('#at_no', frm).val();

   var radioVal = $("input[id='payment_way']:checked").val();
   alert(radioVal);
   
   var params = frm.serialize();// 값가져옴
  // var params ='mem_no='+mem_no +'&at_no=' + at_no;
   alert(params); 
   


 } 
 
 </script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />

 
  <DIV style='width: 90%;' >
    <FORM name='frm'  id='frm' method='POST' action='./create.do' class="form-horizontal" style='margin-top:50px;'>

      <input type='hidden' name='at_no' id='at_no'  value='1'>
      <input type='hidden' name='mem_no' id='mem_no'  value='1'>
      <input type='hidden' name='cart_no' id='cart_no'  value='${cartVO.cart_no }'>
    <div> 
      
  <div style='width: 100%; margin-top:50px;' >
  
  <h2 style='margin-left:40px;'>구매자 정보</h2>
  <hr>
  
    <table style='width: 80%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 80%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
        <tr>
          <th style='text-align: right; font-size:16px; padding-right:10px;'>이름</th>
          <td style='text-align:left; padding-left:15px;'>
           <input type='text' id = 'mem_name'  name='mem_name'  value='${memVO.mem_name }' placeholder="이름" style='width: 20%;'>
         </td>   
        </tr>
        
        <tr>
          <th style='text-align: right; font-size:16px;'>전화번호</th>
          <td style='text-align:left; padding-left:15px;'>
          <input type='text' id = 'mem_tel'  name='mem_tel'  value='${memVO.mem_tel }' placeholder="전화번호" style='width: 30%;'>
          </td>
        </tr>      
        
    </table>
    </div>
      
      
      <br><br>
      
   <div style='width: 100%; margin-top:50px;' >     
      <h2 style='margin-left:40px;'>결제정보</h2>
      <hr>
   <table style='width: 80%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 80%;"></col>
      </colgroup>

<%--       <tr>
      <th style='text-align: right; font-size:16px; padding-right:10px;'>상품명</th>
      <td style='text-align:left; padding-left:15px;' name='at_name' id='at_name'>${atVO.at_name }</td>      
      </tr>

      <tr>
      <th style='text-align: right; font-size:16px; padding-right:10px;'>수량</th>
      <td style='text-align:left; padding-left:15px;' name='cart_cnt' id='cart_cnt'>${cartVO.cart_cnt }</td>      
      </tr> --%>
      
            <tr>
      <th style='text-align: right; font-size:16px; padding-right:10px;'>개당결제금액</th>
      <td style='text-align:left; padding-left:15px;' name='cart_cnt' id='cart_cnt'>${cartVO.cart_payment }</td>      
      </tr> 
       
      <tr>
      <th style='text-align: right; font-size:16px; padding-right:10px;'>총결제가격</th>
      <td style='text-align:left; padding-left:15px;'>${atVO.at_price*cartVO.cart_cnt }원</td>      
      </tr>


      <tr>
      <th style='text-align: right; font-size:16px; padding-right:10px;'>결제방법</th>
        <td style='text-align:left; padding-left:15px;'>
          <input type='radio' id = 'payment_way'  name='payment_way' value="무통장입금" placeholder="결제방법" >무통장입금   
          <input type='radio' id = 'payment_way'  name='payment_way' value="신용카드" placeholder="결제방법"  style='margin-left:5px;'>신용카드    
          <input type='radio' id = 'payment_way'  name='payment_way' value="계좌이체" placeholder="결제방법"  style='margin-left:5px;'>계좌이체    
          
        </td>      
      </tr>
     
                      
   
      </table>
  
  </div>     
     
      

      
      

      <DIV class='content_bottom_menu'>
         <button type="submit" id='btn_send' name='btn_send'class="btn btn-info" style="margin-top:150px;">결제하기</button>
        <button type="button" 
                    onclick="history.back()" 
                    class="btn btn-info"
                    style="margin-top:150px;">취소</button>

  </div>
      </DIV>
    </FORM>
  </DIV>












<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
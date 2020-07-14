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
<link rel="stylesheet" href="../css/style_con.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->

 <script type="text/javascript">
 
 $(function() { // 자동 실행
   $('#btn_send').on('click', send); 
 });

 function send(){
   
   var frm = $('#frm');
   var mem_no = $('#mem_no', frm).val();
   var at_no = $('#at_no', frm).val();
   
   var params = frm.serialize();// 값가져옴
  // var params ='mem_no='+mem_no +'&at_no=' + at_no;
   alert(params); 
   $.ajax({ 
     url: './create.do',
     type: 'post',  //다른타입은 get
     cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
     async: true, //true: 비동기통신
     dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
     data: params, //데이터

     success: function(data) { // 서버로부터 성공적으로 응답이 온경우
       // var msg = "";
      if (data.cnt > 0) {
         
         //alert (rdata.cnt); // 정상적 전달 확인
        location.href='${root}/cart/at_cart_mem_list.do?mem_no='+data.mem_no;

       } else {
         alert("장바못감");


       }
     },
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
     error: function(request, status, error) { // callback 함수
       var msg = 'ERROR<br><br>';
       msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
       msg += '<strong>error</strong><br>'+error + '<hr>';
       console.log(msg);
     }
   });

 
 }
 </script>
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>
    장바구니
  </DIV>
 
  <DIV style='width: 90%;' >
    <FORM name='frm'  id='frm' method='POST' action='./create.do' class="form-horizontal" style='margin-top:50px;'>
               
      <!-- FK memberno 지정 -->
<!--       <input type='hidden' name='mem_no' id='mem_no'  value='1'> -->
      <!-- FK at_no 지정 -->
      <input type='hidden' name='at_no' id='at_no'  value='1'>
      <input type='hidden' name='mem_no' id='mem_no'  value='1'>
      

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-sm" id = 'at_no'  name='at_no'  value='1' placeholder="상품번호" required="required" style='width: 80%;'>
        </div>
      </div>   

        <!-- <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-sm" id = 'mem_no' name='mem_no' value='1' placeholder="회원번호"  style='width: 80%;'>
        </div>
      </div>    -->
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg"  id = 'cart_cnt'  name='cart_cnt' value='' placeholder="수량" style='width: 80%;'>
        </div>
      </div>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg"  id = 'at_price'  name='at_price' value='50000' placeholder="개별가격" style='width: 80%;'>
        </div>
      </div>      
      

      
      

      <DIV class='content_bottom_menu'>
        <button type="button" id='btn_send' class="btn btn-info">장바구니 담기</button>
        <button type="button" 
                    onclick="history.back()" 
                    class="btn btn-info">취소</button>
      </DIV>
       
    </FORM>
  </DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
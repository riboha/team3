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

</script>

 

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
     ♣${memVO.mem_id}님 결제 목록  ༼;´༎ຶ۝༎ຶ༽
  </DIV>
 
  <form name='frm' id='frm'>
        
         <input type='hidden' name='mem_no' id='mem_no' value='1'> 
         
         
   
         
  <div style='width: 100%; margin-top:50px;' >
  
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 25%;"></col>
        <col style="width: 25%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>결제번호</th>
          <th style='text-align: center;'>상품명</th>
          <th style='text-align: center;'>총액</th>
          <th style='text-align: center;'>결제방법</th>
          <th style='text-align: center;'>결제일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="paymentVO" items="${list }">
        
          <c:set var="payment_no" value="${paymentVO.payment_no }" />
          <c:set var="at_price" value="${paymentVO.at_price }" />
          <c:set var="at_name" value="${paymentVO.at_name }" />
          <c:set var="payment_total" value="${paymentVO.payment_total }" />
          <c:set var="payment_way" value="${paymentVO.payment_way }" />
          <c:set var="payment_date" value="${paymentVO.payment_date }" />
          <c:set var="cart_cnt" value="${paymentVO.cart_cnt }" />
          
          <tr> 
           <td style='text-align: center;'> <a href="../payment_details/read.do?payment_no=${payment_no }&mem_no=1">
           ${payment_no } </a> </td>
           
          
            <td style='text-align: center;'>${at_name}</td>
            <td style='text-align: center;'>${payment_total} </td>
            <td style='text-align: center;'>${payment_way }</td>
            <td style='text-align: center;'>${payment_date}</td>
            
            <td> 

              
 뀹
            </td>
            

          </tr>
          
               


        </c:forEach>
             
      </tbody>
    </table>
    </div>




    <br><br>
  
</form>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
 
 
</html> 
 
 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>

                                                                        
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./delete.do'>
    
      <input type='hidden' name='cart_no' id='cart_no' value='${cartVO.cart_no}'> <!-- ko, en -->
      <input type='hidden' name='mem_no' id='mem_no' value='1'> <!-- ko, en -->
      <input type='hidden' name='at_no' id='at_no' value='1'> <!-- ko, en -->
        
      <label>상품 번호</label>
      <input type='text' name='at_no' value='${cartVO.at_no }' required="required" style='width: 25%;'>
 
  
      <label>수량</label>
             <input type='number' name='cart_cnt' value='${cartVO.cart_cnt }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
                
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./.do'">삭제취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
      <colgroup>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 30%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
        <col style="width: 10%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>순서</th>
          <th style='text-align: center;'>상품번호</th>
          <th style='text-align: center;'>회원번호</th>
          <th style='text-align: center;'>수량</th>
          <th style='text-align: center;'>상품가격</th>
          <th style='text-align: center;'>등록일</th>
          <th style='text-align: center;'>수정 / 삭제</th>
        </tr>
      
      </thead>
  
  <tbody>
  
      <c:forEach var="at_Cart_VO" items="${list }">
          <c:set var="at_no" value="${at_Cart_VO.at_no }" />
          <c:set var="at_price" value="${at_Cart_VO.at_price }" />
          
          <c:set var="cart_no" value="${at_Cart_VO.cart_no }" />
          <c:set var="cart_no" value="${at_Cart_VO.cart_no }" />
          <c:set var="cart_payment" value="${at_Cart_VO.at_price*at_Cart_VO.cart_cnt }" />
          <c:set var="cart_cnt" value="${at_Cart_VO.cart_cnt }" />
          <c:set var="cart_date" value="${at_Cart_VO.cart_date }" />
          
          <c:set var="mem_no" value="${memVO.mem_no }" />
          <c:set var="mem_id" value="${memVO.mem_id }" />

          <tr> 
           <td style='text-align: center;'>${cart_no}</td>
            <td style='text-align: center;'>${at_no}</td>
            <td style='text-align: center;'>${mem_no}</td>
            <td style='text-align: center;'>${cart_cnt}  <br></td>
            <td style='text-align: center;'>${at_price}</td>
            <td style='text-align: center;'>${cart_date.substring(0, 10)}</td>
          </tr>
        </c:forEach>
 
  </tbody>
 
</TABLE>
 

</body>
 
</html> 








 
 
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>장바구니 목록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
  
</script>
 
</head> 
 
<body>



  <ASIDE style='float: left;'>
    전체 보기 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <!--  <span class='menu_divide' >│</span> -->
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
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
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="cartVO" items="${list }">
          <c:set var="CART_NO" value="${cartVO.CART_NO }" />
          
          <tr> 
           <td style='text-align: center;'>${cartVO.CART_NO}</td>
            <td style='text-align: center;'>${cartVO.AT_NO}</td>
            <td style='text-align: center;'>${cartVO.MEM_NO}</td>
            <td style='text-align: center;'>${cartVO.CNT}  <br></td>
            <td style='text-align: center;'>${cartVO.PAYMENT}</td>
            <td style='text-align: center;'>${cartVO.cart_date.substring(0, 10)}</td>
            <td style='text-align: center;'><a href="./read_update.do?CART_NO=${CART_NO} "><button>수정</button></a>
                                                         <a href="./read_delete.do?CART_NO=${CART_NO} "> <button>삭제</button></a>
           </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
</body>
 
</html> 
 
 
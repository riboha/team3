<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
 
<script type="text/javascript">
  $(function(){
 
  });
</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
  <DIV class='title_line'>
    회원
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./mem/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>목록</A>
  </ASIDE> 
 
  <div class='menu_line'></div>
  
 
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>No.</TH>
    <TH class='th'>상품 이름</TH>
    <TH class='th'>가격</TH>
    <TH class='th'>구매 일자</TH>
    <TH class='th'>상태</TH>
  </TR>
 
  <c:forEach var="mem_hisVO" items="${list }">
    <c:set var="mem_his_no" value ="${mem_hisVO.mem_his_no}" /> 
    
  <TR>
    <TD class='td'><A href="./read.do?mem_no=${mem_his_no}">mem_his_no</A></TD>
    <TD class='td'><A href="./read.do?mem_no=${mem_his_no}">?</A></TD>
    <TD class='td'><A href="./read.do?mem_no=${mem_his_no}">?</A></TD>
    <TD class='td'>mem_his_no</TD> <!-- 년월일 -->
    <TD class='td'>mem_his_no</TD> 
  </TR>
  </c:forEach>
</TABLE>

 <br><br><br>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
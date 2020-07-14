<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울 여행</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>
 <div class='message'>
  <fieldset class='fieldset_basic'>
    <ul>
      <c:choose>
        <c:when test="${cnt == 1 }">
          <li class='li_none'>
           <span class='span_success'>새로운 설문조사를 등록했습니다.</li></SPAN>
      </c:when>
      <c:otherwise>
        <li class="li_none">
          <span class='span_fail'>새로운 설문조사 등록에 실패했습니다.</li><br>
        <li class="li_none">
          <span class='span_fail'>다시 시도 해 주세요.</li><br><br>
      </c:otherwise>            
    </c:choose>
    
    <c:choose>
      <c:when test="${cnt == 1 }">
        <button type='button'onclick="location.href='./surv_create.do'">새로운 설문조사 등록</button>
      </c:when>
      <c:otherwise>
        <button type='button' onclick='history.back()'>이전으로</button>
      </c:otherwise>
    </c:choose>
        <button type='button' onclick="location.href='./surv_list.do'">설문목록</button>
        <button type='button' onclick="location.href='../surv_item/surv_item_create.do'">설문항목등록</button>
  </ul>
 </div>
</body>
</html>
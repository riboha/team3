<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>서울여행</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>

<body>
  <jsp:include page="/menu/top.jsp" />
 <DIV class='title_line'><h2>설문조사 항목 목록</h2></div>
 <div class="cm-title-1 gap-3">

 </div>
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    설문조사 항목 목록
  </ASIDE>
 <div>
 </div>
  <ASIDE style='float: right;'>
    <A href='./surv_item_create.do'>항목등록</A> 
  </ASIDE>
 
 
  <FORM name='frm' id='frm' method='POST' action='./surv_item_list.do'>
  <input type='hidden' name='surv_no' value='${param.surv_no }'>
  
  <table class="table">
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 70%;">
      <col style="width: 20%;">
    </colgroup>
    
    <%-- table 컬럼 --%>
    <thead>
    <tr style="text-align: center;">
      <th>항목순서</th>
      <th>항목제목</th>
      <th>기타</th>
    </tr>
    </thead>
    
    <%-- table 내용 --%>
    <tbody>
      <c:forEach var="surv_Item_VO" items="${list }">
        <c:set var="surv_item_ques" value="${surv_Item_VO.surv_item_ques}"/>
        <c:set var="surv_item_no" value="${surv_Item_VO.surv_item_no}"/>
      
      <tr>
       <td>${surv_Item_VO.surv_item_seqno }</td>
       <td><a href='./surv_item_read.do?surv_item_no=${surv_Item_VO.surv_item_no}'>${surv_item_ques }</a></td>
       <td><A href='../surv_choice/surv_choice_create.do?surv_item_no=${surv_item_no }'>문항등록</A>
       /<A href="./surv_item_update.do?surv_item_no=${surv_item_no }">수정</A>
       /<A href='./surv_item_delete.do?surv_item_no=${surv_item_no }'>삭제</A></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
 </FORM>
</body>
</html>
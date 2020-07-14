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
 <DIV class='title_line'><h2>설문조사 전체목록</h2></div>
 <div class="cm-title-1 gap-3">
    <h4 class="txt-1">진행 중인 설문조사에 참여해주세요!</h4>
 </div>
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    설문조사 전체목록
  </ASIDE>
 <div>
 </div>
  <ASIDE style='float: right;'>
    <A href='./surv_create.do'>등록</A> 
  </ASIDE>

 
<DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
 <FORM name='frm_create' id='frm_create' method='POST' action='./surv_list.do'>
    <table class='table'>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 20%;">
      <col style="width: 20%">
      <col style="width: 20%">
      <col style="width: 10%">
      <col style="width: 10%">
      <col style="width: 10%">
    </colgroup>
    
     <thead>
      <tr style="text-align: center;">
        <th>번호</th>
        <th>제목</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>진행여부</th>
        <th>참여회원수</th>
        <th>기타</th>
      </tr>
     </thead>
     
     <%-- table 내용 --%>
     <tbody>
      <c:forEach var="surv_VO" items="${surv_list }">
        <c:set var="surv_no" value="${surv_VO.surv_no }"/>
        <tr>
          <td>${surv_VO.surv_seqno }</td>
          <td><a href="./surv_read.do?surv_no=${surv_VO.surv_no}">${surv_VO.surv_title }</a></td>
          <td>${surv_VO.surv_startdate.substring(0,10) }</td>
          <td>${surv_VO.surv_enddate.substring(0,10) }</td>
          <td>${surv_VO.surv_continue }</td>
          <td>${surv_VO.surv_cnt }</td>
          <td><A href="../surv_item/surv_item_create.do?surv_no=${surv_VO.surv_no }">항목등록</A> / 
              <A href="./surv_update.do?surv_no=${surv_VO.surv_no }">수정</A> / 
              <A href="./surv_delete.do?surv_no=${surv_VO.surv_no }">삭제</A></td>
      </c:forEach>
     </tbody>
     
  </table>
  </FORM>
  </div>
</body>
</html>
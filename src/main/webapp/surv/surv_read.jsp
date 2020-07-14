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
 <div class="container">
 <DIV class='title_line'>설문조사 조회</div>
 
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    <A href='./surv_list.do'>설문조사 전체목록</A>
  </ASIDE>
  
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./surv_list.do'>목록</A>
    <span class='menu_divide' > | </span>
    <A href="./surv_update.do?surv_no=${surv_VO.surv_no }">수정</A>
    <span class='menu_divide' > | </span>
    <A href='./surv_delete.do?surv_no=${surv_VO.surv_no }'>삭제</A>
  </ASIDE>
 
<DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
 <FORM name='frm_read' id='frm_read' method='POST' action='./surv_read.do'>
  <input type='hidden' name='mem_no' id='mem_no' value='1'>
  <input type='hidden' name='mem_no' id='surv_no' value='${param.surv_no }'>
      <br>
      <DIV style="text-align: right">등록일자 : ${surv_VO.surv_rdate }</DIV>
  </FORM>
 </div>
</div>
</body>
</html>
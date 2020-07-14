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
    <A href='./surv_item_list.do'>설문조사 항목 목록
  </ASIDE>
  
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./surv_item_list.do'>목록</A>
    <span class='menu_divide' > | </span>
    <A href="./surv_item_update.do?surv_item_no=${surv_Surv_Item_VO.surv_item_no }">수정</A>
    <span class='menu_divide' > | </span>
    <A href='./surv_item_delete.do?surv_item_no=${surv_Surv_Item_VO.surv_item_no }'>삭제</A>
  </ASIDE>
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm' method='POST' action='surv_read_all.do'>
    <input type='hidden' name='surv_no' id='surv_no' value='${param.surv_no }'>  
    <input type='hidden' name='surv_item_no' id='surv_item_no' value='${surv_Surv_Item_VO.surv_item_no }'>  
       <H4>${surv_Item_VO.surv_item_ques }</H4>
      
      
      <label style="cursor: pointer;">
       1. <INPUT TYPE = "RADIO" NAME='survey' value='${surv_Surv_Item_VO.surv_item_ans_1 }' checked="checked">${surv_Surv_Item_VO.surv_item_ans_1 }
      </label><BR>
      
      <label style="cursor: pointer;">
       2. <INPUT TYPE = "RADIO" NAME='survey' value='${surv_Surv_Item_VO.surv_item_ans_2 }'>${surv_Surv_Item_VO.surv_item_ans_2 }
      </label><BR>
      
      <label style="cursor: pointer;">
       3. <INPUT TYPE = "RADIO" NAME='survey' value='${surv_Surv_Item_VO.surv_item_ans_3 }'>${surv_Surv_Item_VO.surv_item_ans_3 }
      </label><BR>
      
      <label style="cursor: pointer;">
       4. <INPUT TYPE = "RADIO" NAME='survey' value='${surv_Surv_Item_VO.surv_item_ans_4 }'>${surv_Surv_Item_VO.surv_item_ans_4 }
      </label>
      </DIV>
      
      <button type="button" id="btn_send" class="btn btn-info">참여</button>
     </FROM>
</body>
</html>
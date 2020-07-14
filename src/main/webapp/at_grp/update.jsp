<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>카테고리 그룹 수정</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(function() {
  $('#btn_send').on('click', send);
});

function send() {
  var frm = $('#frm_update');
  var param= $('#frm_update').serialize();

  $.ajax({
    type : "post",
    url : "./update.do",
    cache : false,
    dataType : "json",
    async : false,
    data : param,
    success : function(rdata) {
      if (rdata.cnt == 1) {
        alert("수정 성공");
        location.href = "./list.do";
      } else {
        alert("수정 실패");
      }
     
    },
    error : function(request, status, error) { // callback 함수, 전형적인 에러함수
      var msg = 'ERROR<br><br>';
      msg += '<strong>request.status</strong><br>' + request.status + '<hr>';
      msg += '<strong>error</strong><br>' + error + '<hr>'; //에러메시지
      console.log(msg);
    }

  });

}




</script>

</head>

<body>
<jsp:include page="/menu/top.jsp" />
 
 

  <DIV class='title_line'>카테고리 그룹 > [${at_grp_VO.at_grp_name }] 수정 </DIV>
  <!-- [${param.categrpno }]이전 url에서 param.으로 받아 옴 -->

  <DIV id='panel_create'
    style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_update' id='frm_update' method='POST' action='./update.do'>
      <input type='hidden' name='at_grp_no' id='at_grp_no' value='${at_grp_VO.at_grp_no }'><!-- ko, en -->


      <label>카테고리 그룹 이름</label> 
       <input type='text' name='at_grp_name' value='${at_grp_VO.at_grp_name }' required="required" style='width: 25%;'> 
        
      <label>출력 순서</label>
        <input type='number' name='at_grp_seqno' value='${at_grp_VO.at_grp_seqno }'
        required="required" min='1' max='1000' step='1'
        style='width: 5%;'> 
        
    
        
        
      <label>출력 모드</label>
       <select name='at_grp_visible'>
        <option value='Y' ${at_grp_VO.at_grp_visible == 'Y' ? "selected='selected'" : "" }>Y</option>
        <option value='N' ${at_grp_VO.at_grp_visible == 'N' ? "selected='selected'" : "" }>N</option>
      </select>
        
 
        

      <button type="button" name='btn_send' id='btn_send'>저장</button>
      <button type="button" onclick="location.href='./list.do'">수정  취소</button>
    </FORM>
  </DIV>


  <TABLE class='table table-striped'>
    <!-- TABLE 전체에 bootstrap 적용 -->
    <colgroup>
      <col style='width: 10%;' />
      <col style='width: 10%;' />
      <col style='width: 40%;' />
      <col style='width: 10%;' />
      <col style='width: 10%;' />
      <col style='width: 10%;' />
      <col style='width: 10%;' />
    </colgroup>

    <thead>
      <TR>
        <TH class="th_bs">고유번호</TH>
        <TH class="th_bs">출력순서</TH>
        <TH class="th_bs">카테고리그룹명</TH>
        <TH class="th_bs">출력순서 상향</TH>
        <TH class="th_bs">출력순서 하향</TH>
        <TH class="th_bs">수정</TH>
        <TH class="th_bs">삭제</TH>


      </TR>
    </thead>

    <tbody>

      <c:forEach var="at_grp_VO" items="${list }">
        <c:set var="at_grp_no" value="${at_grp_VO.at_grp_no }" />
   
        <tr>
          <td class="td_bs">${at_grp_no} </td>
          <td class="td_bs">${at_grp_VO.at_grp_seqno }</td>
          <td class="td_bs_left">
          <a href="../at/list.do?at_grp_no=${at_grp_no }">${at_grp_VO.at_grp_name }</a></td>
         
     
          <td class="td_bs">
          <a href="./update_seqno_up.do?at_grp_no=${at_grp_no }"><img src='${root}/menu/images/arrow_up.png'style="width: 20px;"></a></td>
          <td class="td_bs">
          <a href="./update_seqno_down.do?at_grp_no=${at_grp_no }"><img src='${root}/menu/images/arrow_down.png'style="width: 20px;"></a></td>
       
         <td class="td_bs">
          <a href="./update.do?at_grp_no=${at_grp_no }"><img src='${root}/menu/images/update.png'style="width: 20px;"></a></td>
          <td class="td_bs">
          <a href="./delete.do?at_grp_no=${at_grp_no }"><img src='${root}/menu/images/delete.png'style="width: 20px;"></a></td>


</tr>
      </c:forEach>

    </tbody>

  </TABLE>

<jsp:include page="/menu/bottom.jsp" />
</body>

</html>
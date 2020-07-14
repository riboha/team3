<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 등록화면 -->
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>서울 여행</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css">



<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
  });

  function send() {

    $.ajax({
      type : "post",
      processData : false,
      contentType : false,
      url : "./modify.do",
      cache : false,
      dataType : "json",
      async : true,
      data : new FormData($(frm)[0]),
      success : function(rdata) {

        if (rdata.cnt >= 1) {
          alert("등록 성공");
          location.href = "../at/read.do?at_grp_no=${at_VO.at_grp_no }&at_no=${at_VO.at_no }";
        } else {
          alert("등록 실패");
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
  <jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>${at_VO.at_name }첨부파일 등록</DIV>
  <p>*기존 첨부파일에 추가됩니다.</p>

  <FORM name='frm' id='frm' method='post' action='./modify.do'
     enctype="multipart/form-data" class="form-horizontal">
    <input type='hidden' name='at_no' id='at_no'
      value='${at_VO.at_no }'>

    <div class="form-group">
      <div class="col-md-12">
        <input type='file' class="form-control" name='fnamesMF'id='fnamesMF' value=''
          placeholder="파일 선택" multiple="multiple">
      </div>
    </div>

    <div class="content_bottom_menu" style="padding-right: 20%;">
      <button type="button" class="btn" id="btn_send">등록</button>
      <button type="button" class="btn"
        onclick="location.href='./list.do'">목록</button>
    </div>
  </FORM>

  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>

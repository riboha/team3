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

<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
  });

  function send() {
    var frm = $('#frm');
    var param= $('#frm').serialize();

    $.ajax({
      type : "post",
      url : "./create.do",
      cache : false,
      dataType : "json",
      async : false,
      data : param,
      success : function(rdata) {
        if (rdata.cnt == 1) {
          alert("등록 성공");
          location.href = "./list.do";
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

  <DIV class='title_line'>카테고리 그룹 등록</DIV>
  *모든 항목은 필수 입력
  <br> *카테고리 그룹 번호는 자동생성

  <FORM name='frm' id='frm' method='post' action='./create.do'
    class="form-horizontal">


    <div class="form-group">
      <label class="control-label col-md-3">카테고리 그룹 이름</label>
      <div class="col-md-9">
        <input type='text' name='at_grp_name' id='at_grp_name' value=''
          required="required" autofocus="autofocus" class="form-control"
          style='width: 50%;'>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">출력 순서</label>
      <div class="col-md-9">
        <input type='number' name='at_grp_seqno' id='at_grp_seqno'
          value='' required="required" placeholder="" min="1"
          max="1000" step="1" style='width: 30%;' class="form-control">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-md-3">출력 모드</label>
      <div class="col-md-9">
        <select name='at_grp_visible' id='at_grp_visible'
          class="form-control" style="width: 20%;">
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
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

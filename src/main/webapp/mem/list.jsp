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

 function mem_delete_proc (mem_no) {

    alert('mem_no: ' + mem_no);
    var params = 'mem_no=' + mem_no;
  
    $.ajax({
      url: './delete.do', 
      type: 'post', // type: post / get
      cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      async: true, // 비동기 통신
      dataType: 'json', // 응답 형식: json / html / xml
      data: params, // 데이터
      
      // ▼ 서버로부터 성공적으로 응답이 온경우
      success: function (rdata) {
          alert('cnt: ' + rdata.cnt);
          
         if(rdata.cnt>0) {
          msg = "멤버 삭제 성공";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('삭제 성공'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel_2').modal();              // 다이얼로그 출력
        }
      },   
      error: function(request, status, error) { 
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
    }
    })
    }



</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal (2) -->
  <div class="modal fade" id="modal_panel_2" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- ▶ 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- ▶ 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button"  onclick="window.location.reload();" class="btn btn-default" data-dismiss="modal">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div> 
 
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
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>번호</TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>닉네임</TH>
    <TH class='th'>포인트</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>상태</TH>
    <TH class='th'>기타</TH>
  </TR>
 
  <c:forEach var="memVO" items="${list }">
    <c:set var="mem_no" value ="${memVO.mem_no}" /> 
  <TR>
    <TD class='td'>${mem_no}</TD>
    <TD class='td'><A href="./read.do?mem_no=${mem_no}">${memVO.mem_id}</A></TD>
    <TD class='td'><A href="./read.do?mem_no=${mem_no}">${memVO.mem_name}</A></TD>
    <TD class='td'><A href="./read.do?mem_no=${mem_no}">${memVO.mem_nick}</A></TD>

    <TD class='td'>${memVO.mem_pt}</TD> 
    <TD class='td'>${memVO.mem_date.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td'>${memVO.mem_sts}</TD> 
    <TD class='td'>
      <A href="./passwd_update.do?mem_no=${mem_no}">PW 변경<IMG src='../css/images/passwd.png' title='패스워드 변경'></A> <br>
      <%-- <A href="./read.do?mem_no=${mem_no}">수정<IMG src='../css/images/create.png' title='수정'></A> --%>
      <%-- <A href="./delete.do?mem_no=${mem_no}">삭제<IMG src='../css/images/delete.png' title='삭제'></A> --%>
      <button type="button" onclick="mem_delete_proc ('${memVO.mem_no}')" >삭제</button>
    </TD>
  </TR>
  </c:forEach>
  
</TABLE>
 
<DIV class='bottom_menu'>
  <button type='button' onclick="location.href='./create.do'">등록</button>
  <button type='button' onclick="location.reload();">새로 고침</button>
</DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
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
    // $('#btn_wish_delete_check').on('click', wish_delete_check);
    // $('#btn_wish_delete_proc').on('click', wish_delete_proc);
    
  });

  
/*   function wish_delete_check (mem_wish_no) {
    
    // alert('mem_wish_no: ' + mem_wish_no);

    var msg = '위시리스트에서 삭제하시겠어요?.';
    var mem_wish_no = mem_wish_no;
    
    $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
    $('#modal_title').html('위시리스트 삭제 확인'); // 제목 
    $('#modal_content').html(msg);        // 내용
    $('#modal_panel_1').modal();              // 다이얼로그 출력
  } 
 */

  
  function wish_delete_proc (mem_wish_no) {

    alert('mem_wish_no: ' + mem_wish_no);
    var params = 'mem_wish_no=' + mem_wish_no;
  
    $.ajax({
      url: './delete.do', 
      type: 'post', // type: post / get
      cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
      async: true, // 비동기 통신
      dataType: 'json', // 응답 형식: json / html / xml
      data: params, // 데이터
      
      // ▼ 서버로부터 성공적으로 응답이 온경우
      success: function (rdata) {
         if(rdata.cnt>0) {
          msg = "위시리스트 삭제 성공";
          $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
          $('#modal_title').html('회원정보 수정 성공'); // 제목 
          $('#modal_content').html(msg);        // 내용
          $('#modal_panel_2').modal();              // 다이얼로그 출력 
        }
        location.href='${root}/team3/mem_wish/list.do?mem_no='+rdata.mem_no;
      },   
      
      error: function(request, status, error) { 
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
        msg += '<strong>error</strong><br>'+error + '<hr>';
        console.log(msg);
    }
    })
    }

  $(document).ready(function() {     
    $('#deleteWish').on('show.bs.modal', function(event) {          
      mem_wish_no = $(event.relatedTarget).data('notifyid');
    });
});


  function deleteWish()
  {
      // var blackCount = $('#blackCount').val();
      location.href='${root}/team3/mem_wish/delete.do?mem_wish_no='+mem_wish_no;
  }


  
</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<!-- Modal (1) -->
  <div class="modal fade" id="deleteWish" role="dialog">
    <div class="modal-dialog" role="document">
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
        
          <button type="button"  onclick ='deleteWish();' class="btn btn-default" data-dismiss="modal">삭제</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div> 

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
          <button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
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
    <col style='width: 5%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
    <col style='width: 15%;'/>
  </colgroup>
  <TR>
    <TH class='th'>No.</TH>
    <TH class='th'>상품 이름</TH>
    <TH class='th'></TH>
    <TH class='th'>가격</TH>
    <TH class='th'></TH>
  </TR>
 
  <c:forEach var="list" items="${list }">
    <c:set var="at_no" value ="${list.at_no}" />
    <c:set var="mem_no" value ="${list.mem_no}" />
      <TR>
       <c:if test="${list.at_visible =='Y'}">
          <TD class='td'><A href="./read.do?mem_wish_no=${list.mem_wish_no}">${list.mem_wish_seqno}</A></TD>
          <TD class='td'><A href="../at/read.do?at_no=${at_no}">${list.at_name}</A></TD>
          <TD class='td'>${list.at_detail}</TD> 
          <TD class='td'>${list.at_price}</TD>
          <TD class='td'> 
            <%-- <button type="button" onclick='wish_delete_check (${list.mem_wish_no})' >삭제</button> --%>
            
            <button data-toggle="modal" data-target="#deleteWish"  data-mem_wish_no="${list.mem_wish_no }" >삭제</button>
            
            <A href="./delete.do?mem_wish_no=${mem_wish_no}"><!-- <IMG src='../css/images/delete.png' title='삭제'> -->구매</A>
          </TD>
     </c:if> 
      </TR>
    </c:forEach>
</TABLE>

 <br><br><br>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
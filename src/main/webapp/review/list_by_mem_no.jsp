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
    $('#tolist').on('click', tolist);
    
  });

  
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

/*   function tolist() {
    var mem_no = $('#mem_no');
    location.href='${root}/team3/mem/list_search_paging.do?mem_no='+mem_no;
    }
 */
  
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
<%--           <button type="button"  id="tolist" class="${list.mem_no}" data-dismiss="modal">확인</button> --%>
           <button type="button" onclick="window.location.reload();" class="btn btn-default" data-dismiss="modal">확인</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        </div>
      </div>
    </div>
  </div> 
 
  <DIV class='title_line'>
    회원
  </DIV>
  
      <ASIDE style='float: right;'>
          <A href='./mem/list.do'>회원 목록</A>  
      </ASIDE>
      
      <ASIDE style='float: right;'>
        <A href="javascript:location.reload();">새로고침</A>
        <span class='menu_divide' >│</span> 
        <A href='./create.do'>회원 가입</A>
        <span class='menu_divide' >│</span> 
        <A href='./create.do'>목록</A>
      </ASIDE>        
  
      <form name='frm' id='frm' method='get' action='./list_search_paging.do'>
    
      <ASIDE style='float: left;'>
        <c:choose>
          <c:when test="${param.word != ''}">
            > '${param.word }' ${search_count } 건
          </c:when>
          <c:otherwise> 
            > ${search_count } 건
          </c:otherwise>
        </c:choose>    
      </ASIDE>
      
        <input type='hidden' name='mem_no' id='mem_no' value='${mem_no }' style='width: 35%;'>
            
        <c:choose>
          <c:when test="${param.word != '' }"> <%-- 검색하는 경우 --%>
            <input type='text' name='word' id='word' value='${word }' style='width: 35%;'>
          </c:when>
          <c:otherwise> <%-- 검색하지 않는 경우 --%>
            <input type='text' name='word' id='word' value='' style='width: 35%;'>
          </c:otherwise>
        </c:choose>
        
      <button type='submit'>검색</button>
      <c:if test="${param.word.length() > 0 }">
        <button type='button' onclick="location.href='./list_search_paging.do?mem_no=${param.mem_no}&word='">검색 취소</button>  
      </c:if>
     
    <DIV class='menu_line' style='clear: both;'></DIV>
  </form>
  <div class='menu_line'></div>
  
  
   <br>
  <br>
  
    <c:import url="/mem_wish/list_index_left.do" />
     <DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 --> 
  
 
  <table class="table table-striped" style='width: 100%;'>
  <caption>관리자만 접근가능합니다.</caption>
  <colgroup>
    <col style='width: 10%;'/>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 40%;'/>
    <col style='width: 5%;'/>
    <col style='width: 10%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <TR>
    <TH class='th'>payment_no</TH>
    <TH class='th'>at_name</TH>
    <TH class='th'>payment_total</TH>
    <TH class='th'>review_word</TH>
    <TH class='th'>review_rate</TH>
    <TH class='th'>rdate</TH>
    <TH class='th'></TH>
  </TR>
 
  <c:forEach var="list" items="${list }">
    <c:set var="review_no" value ="${list.review_no}" />
    <c:set var="at_no" value ="${list.at_no}" />
    <c:set var="payment_no" value ="${list.payment_no}" />
    <c:set var="review_word" value ="${list.review_word}" />
    <c:set var="review_rate" value ="${list.review_rate}" />
    <c:set var="rdate" value ="${list.rdate}" />
    
      <TR>
      <TD class='td'>${payment_no}</TD>
      <TD class='td'><A href="./read.do?mem_wish_no=${list.at_no}">${at_no}</A></TD>
      <TD class='td'><A href="../payment/read.do?payment_no=${payment_no}">${payment_no}</A></TD>
      <TD class='td'>${review_word}</TD> 
      <TD class='td'>${review_rate}</TD>
      <TD class='td'>${rdate}</TD>
      <TD class='td'> 
        <button type="button" onclick="wish_delete_proc ('${review_no}')" >삭제</button>
        <button type="button" onclick="wish_delete_proc ('${review_no}')" >수정</button>
      </TD>
      </TR>
    </c:forEach>
    
  </TABLE>
  </DIV>
  
 <br><br><br>
  
<DIV class='bottom_menu'><%-- ${paging } --%></DIV> 


 <br><br><br>
 <br><br><br>
 <br><br><br>
 <br><br><br>
 <br><br><br>
 <br><br><br>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
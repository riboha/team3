<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath }"/>
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
 <script type="text/javascript">
 $(function(){ // 자동실행
   $('#btn_send').on('click',send);
 });
 
 function btn_list(){
   location.href='${root}/surv_item/surv_item_list.do'
 }
 
 function send(){
   var frm = $('#frm');
   var surv_item_no = $('#surv_item_no',frm).val();
   
   var params = "surv_item_no="+surv_item_no;
   
   alert('params: ' + params);
   
   $.ajax({
     url: './surv_item_response.do', 
     type: 'post', 
     cache: false, 
     async: true, // 비동기통신
     dataType: 'json', // 응답 형식: json,html,xml.. json이 가장 신속하고 빠른방법, 대신에 개발자가 json에 대한 지식이 있어야 함.
     data: params, //보내는데이터
     success: function(rdata){ // 성공했을때, 응답이 온 경우
       
      alert('응답: ' + rdata.cnt);
     
       var msg ="";
       if(rdata.cnt > 0){
         
         alert('수신성공');
         
         msg = "참여성공";
         
         $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
         $('#modal_title').html('등록성공'); // 제목 : modal_title 요소내용을 ID 중복 확인으로 바꿈
         $('#modal_content').html(msg);        // 내용
         $('#modal_panel').modal();     
         
         
       } else {
         
         alert('실패')
       }
     },
     // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 , 디버깅을 위해 있는 것 이고 소스는 거의 이대로 쓰임
     error: function(request, status, error) { // callback 함수, ajax가 호출하는 함수, ajax엔진이 호출 함
         var msg = 'ERROR<br><br>';
         msg += '<strong>request.status</strong><br>'+request.status + '<hr>'; // 상태값.
         msg += '<strong>error</strong><br>'+error + '<hr>'; // 에러메세지 
         console.log(msg);
       } //브라우저 콘솔에 찍힘
     });
 }
 </script>
</head>
<body>
 <jsp:include page="/menu/top.jsp" />
 
 <!-- Modal 알림창 시작, 알림창 필요시 계속 사용할 수 있음-->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 핵심)제목 두가지 위치를 잘 알고 있어야 함-->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 핵심)내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='btn_list' class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  

 <DIV class='title_line'>설문조사 조회</div>
 
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    <A href='./surv_item_list.do'>설문조사 항목 목록</A>
  </ASIDE>
  
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./surv_item_list.do'>목록</A>
    <span class='menu_divide' > | </span>
    <A href="./surv_item_update.do?surv_item_no=${surv_Item_VO.surv_item_no }">수정</A>
    <span class='menu_divide' > | </span>
    <A href='./surv_item_delete.do?surv_item_no=${surv_Item_VO.surv_item_no }'>삭제</A>
  </ASIDE>
  
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm'>
       <input type='hidden' name='surv_no' id='surv_no' value='${param.surv_no }'>  
      
      
      <H4>${surv_item_ques }</H4>
      <c:forEach var="Surv_Surv_Item_VO" items="${list }" varStatus="status"> <%--그룹이름, 레코드가 6개이면 Categrp_Cate_VO가 6번 만들어짐--%>
        <c:set var="surv_item_ques" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_ques}"></c:set> 
        <c:set var="surv_item_no" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_no}"></c:set> 
        <c:set var="surv_item_ans_1" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_ans_1 }"></c:set> <!-- 변수추출: 조인할때-->
        <c:set var="surv_item_ans_2" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_ans_2 }"></c:set> 
        <c:set var="surv_item_ans_3" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_ans_3 }"></c:set> 
        <c:set var="surv_item_ans_4" value="${Surv_Surv_Item_VO.surv_Item_VO.surv_item_ans_4 }"></c:set> 
      
      
          <label>
          ${status.count} <INPUT TYPE = "RADIO" NAME='surv_item_no' id='surv_item_no' value='${surv_item_no}' >${surv_item_ans_1 }
         
          
          <%-- ${surv_item_ans_1 } --%>
          </label> <br>
      
      </c:forEach>
      
      <button type="button" id="btn_send" class="btn btn-info">참여</button>
      
    </FORM>     
  </div>

</body>
</html>
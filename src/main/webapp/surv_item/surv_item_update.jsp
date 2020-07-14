<%@ page contentType="text/html; charset=UTF-8" %>
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
   window.onload = function(){
     document.getElementById('update_btn').onclick= send;    
   }
    
   
   // jQuery ajax요청
   function send(){
     var frm = $('#frm'); 
     var params = frm.serialize();
     var surv_item_no = $('#surv_item_no',frm).val();
     var surv_item_seqno = $('#surv_item_seqno',frm).val();
     var surv_item_ques = $('#surv_item_ques',frm).val();
     var surv_item_ans_1 = $('#surv_item_ans_1',frm).val();
     var surv_item_ans_1 = $('#surv_item_ans_2',frm).val();
     var surv_item_ans_1 = $('#surv_item_ans_3',frm).val();
     var surv_item_ans_1 = $('#surv_item_ans_4',frm).val();
     
     $.ajax({
       url: './passwd.do',  //이렇게 하려면 Controller에도 해당하는 내용 구현해야 함 './cehckID.jsp'로 보내서 하단의 $('#panel').html(rdata)로 들어옴 panel아이디는 하단의 html에 있음
       type: 'get', // get방식
       cache: false, // 응답결과 임시 저장 취소:, 계속 새로운 내용만 응답받고 싶을 때 사용
       async: true, // 비동기통신
       dataType: 'json', 
       data: params, //보내는데이터, 파라미터 전송 함 // 여기까지 보통 복사해서 최적화 함
       success: function(rdata) { //서버로부터 성공적으로 응답이 온경우
         var msg ='';
       
       if (rdata.cnt > 0) { // 패스워드일치
         
         alert('수정을 성공하였습니다. 목록으로 이동합니다.') 
         
         frm.submit(); //submit은 post방식 전송
          } else { // 패스워드 불 일치
            
            msg = "패스워드가 일치하지 않습니다.";
              
              $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
              $('#modal_title').html('패스워드 에러'); // 제목 : modal_title 요소내용을 ID 중복 확인으로 바꿈
              $('#modal_content').html(msg);        // 내용
              $('#modal_panel').modal();              // 다이얼로그 출력(거의 지정되어있음)
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
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <DIV class='title_line'> <a href='./surv_item_list.do'>설문조사 항목 목록</a> >  설문조사수정 </DIV>
  
  <DIV id='panel_update' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm' id='frm' method='POST' action='./surv_item_update.do'>
      <input type='hidden' name='surv_no' id='surv_no' value='1'>
      <input type='hidden' name='surv_item_no' id='surv_item_no' value='${param.surv_item_no }'>
      
      <label>출력순서</label>
      <input type='number' name='surv_item_seqno' id='surv_item_seqno' value='${surv_Item_VO.surv_item_seqno }' placeholder="출력순서" required="required"
          min="1" max="1000" step="1" style='width: 10%;' class="form-control">
      
      <label>질문</label>
      <input type='text' name='surv_item_ques' id='surv_item_ques' class="form-control"
            value='${surv_Item_VO.surv_item_ques }' required="required" style='width: 80%;'>
            
  
    <div class="col-md-12">
      <input type='password' class="form-control" name='surv_item_passwd' id='surv_passwd' value='' placeholder="패스워드" 
          style='width: 40%;'>
    </div>    
       
      </div>
      <button type="button" id='update_btn'>수정</button>
      <button type="button" onclick="location.href='./surv_item_list.do'">수정 취소</button>
    </FORM>
   </DIV> 
</body>
</html>
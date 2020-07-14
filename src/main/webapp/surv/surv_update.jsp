<%@ page contentType="text/html; charset=UTF-8" %>
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
    
<script type="text/javascript">
window.onload = function(){
  document.getElementById('update_btn').onclick=send; //id가 btn_basic인 태그를 찾아서 basic함수 연결
}
 
 // jQuery ajax요청
  function send(){
   var frm = $('#frm'); //frm 찾기
   var params = frm.serialize();
   var surv_no = $('#surv_no',frm).val();
   var surv_title = $('#surv_title',frm).val();
   var surv_seqno = $('#surv_seqno',frm).val();
   var surv_content = $('#surv_content',frm).val();
   var surv_seqno = $('#surv_continue',frm).val();
   var surv_passwd = $('#surv_passwd',frm).val();

   //var params='surv_no=' + surv_no + '&surv_passwd=' + surv_passwd;
  
   
   // alert('params: ' + params);
   // return;
   //alert("dddd");

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
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
<DIV class='container' style='width:100%;'> 
 <DIV class='content'> 
  <DIV class='title_line'> <a href='./surv_create.do' class="form-horizontal">설문조사등록</a> >  설문조사수정 </DIV>
 
    <FORM name='frm' id='frm' method='POST' action='./surv_update.do'> 
      <input type='hidden' name='surv_no' id='surv_no' value='${param.surv_no}'> <!-- ko, en -->
      <input type='hidden' name='mem_no' id='mem_no' value='1'>
        <!-- hidden써야할지 말아야 할지 판단은 sql보고 판단 해야 함 -->
        <!-- 사용자에게 출력 될 필요없어 보이진 않지만 전송은 되는 데이터임 -->
        <!-- 프라이머리키가 있어야 해당키에 대한 데이터만 수정되어 프라이머리키가 필요함-->
        
     <div class="form-group">   
      <label class="control-label col-md-3">설문제목</label>
       <div class="col-md-5">
        <input type='text' name='surv_title' id='surv_title' value='${surv_VO.surv_title }' required="required" style='width: 25%;'>
       </div>
      </div>
     
     <div class="form-group"> 
      <label class="control-label col-md-3">출력순서</label>
       <div class="col-md-5">
        <input type='number' name='surv_seqno' id='surv_seqno' value='${surv_VO.surv_seqno }' required="required" 
                min='1' max='1000' step='1' style='width: 5%;'>
     </div>
   </div>
   
   
    <div class="form-group">
       <label class="control-label col-md-3">시작 날짜</label>
        <div class="col-md-5">
         <input type='date' class="form-control" name='surv_startdate' id='surv_startdate' value='${surv_VO.surv_startdate }' placeholder="설문내용" required="required" style='width: 40%;'>
        </div>
      </div>
    
      <div class="form-group">
       <label class="control-label col-md-3">종료 날짜</label>
        <div class="col-md-5">
         <input type='date' class="form-control" name='surv_enddate' id='surv_enddate' value='${surv_VO.surv_enddate }' placeholder="설문내용" required="required" style='width: 40%;'>
        </div>
      </div>
          
     <div class="form-group">
      <label class="control-label col-md-3">진행여부</label>
       <div class="col-md-5">
        <select name='surv_continue' id='surv_continue'>
         <option value='설문진행' ${surv_VO.surv_continue == '설문진행' ? "selected='selected'" : "" }>설문진행</option>
         <option value='설문종료' ${surv_VO.surv_continue == '설문종료' ? "selected='selected'" : "" }>설문종료</option>
        </select>
       </div>
     </div>
     
     <div class="form-group"> 
      <label class="control-label col-md-3">패스워드</label>
       <div class="col-md-5">
         <input type='password' class="form-control" name='surv_passwd'  id='surv_passwd' value='' placeholder="패스워드" 
          style="width: 20%;">
       </div>
     </div>
      
     <DIV style='text-align: center;'> 
      <button type="button" id='update_btn'>수정</button>
      <button type="button" onclick="location.href='./surv_list.do'">수정취소</button>
     </DIV>
    </FORM>
   </DIV>
  </DIV>
 </body>
</html> 
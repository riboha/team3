<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>서울여행</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
window.onload = function(){
  document.getElementById('delete_btn').onclick=send; //id가 btn_basic인 태그를 찾아서 basic함수 연결
}
 
 // jQuery ajax요청
  function send(){
   var frm = $('#frm'); //frm 찾기
   var surv_item_no = $('#surv_item_no',frm).val();
   var surv_item_passwd = $('#surv_item_passwd',frm).val();

   var params='surv_item_no=' + surv_item_no + '&surv_item_passwd=' + surv_item_passwd;
  
   
    //alert('params: ' + params);
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
          alert('삭제를 성공하였습니다. 목록으로 이동합니다.')
         
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
<jsp:include page="/menu/top.jsp" flush='false' />

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
  
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    <A href='./surv_item_delete.do'>설문조사 항목 삭제</A>
    </ASIDE>
    
    <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./surv_item_list.do'>목록</A>
    <span class='menu_divide' > | </span>
  </ASIDE>
  
   <div class='menu_line'></div>
 
  <FORM name='frm' id='frm' method='POST' action='./surv_item_delete.do'>
      <input type='hidden' name='surv_item_no' id='surv_item_no' value='${param.surv_item_no }'>
      <input type="hidden" name="mem_no" value='1'>
      
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${surv_Item_VO.surv_item_ques }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
        </div>
        
        <div class="form-group">   
          <div class="col-md-12">
            <input type='password' class="form-control" name='surv_item_passwd' id='surv_item_passwd' value='' placeholder="패스워드" 
                    style="width: 20%; margin: 10px auto;">
          </div>
        </div>
        
        <div style="margin-left: 550px;">  
          <button type = "button" id='delete_btn' class="btn btn-info">삭제 진행</button>
          <button type = "button" onclick = "history.back()" class="btn btn-info">취소</button>
        </div>
      </div>
          
  </FORM>
  <jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>
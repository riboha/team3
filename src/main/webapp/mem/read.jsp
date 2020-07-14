<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
  $(document).ready(function(e){

    var frm = $('#frm')[0];
    var mem_no = $('#mem_no', frm).val(); 

    $('#mem_delete').click(function(){
      var params = 'mem_no=' + mem_no;
      $.ajax({
        url: './delete.do',
        type: 'post', // type: post / get
        cache: false, // 브라우저 메모리에 응답 결과 임시저장 X (계속 새로운 결과를 응답받음)
        async: true, // 비동기 통신
        dataType: 'json', // 응답 형식: json / html / xml
        data: params, // 데이터
        success: function (rdata) {
          if(rdata.cnt>0) {
            
            alert('cnt: ' + rdata.cnt);
           msg = " 삭제 성공";
           $('#modal_content').attr('class', 'alert alert-success'); // Bootstrap CSS 변경
           $('#modal_title').html('삭제 성공'); // 제목 
           $('#modal_content').html(msg);        // 내용
           $('#modal_panel').modal();              // 다이얼로그 출력
         }
        },   
        error: function(request, status, error) { 
         var msg = 'ERROR<br><br>';
         msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
         msg += '<strong>error</strong><br>'+error + '<hr>';
         console.log(msg);
        }
      }); 

    });

    // list go
    $('#tolist').click(function(){
      location.href='${root}/team3/mem/list.do';
      });
    

    
 
  })
</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    회원 정보 조회 및 수정
  </DIV>

  <ASIDE style='float: left;'>
      <A href='./mem/list.do'>회원 목록</A>  
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create.do'>회원 가입</A>
    <span class='menu_divide' >│</span> 
    <A href='./list.do'>목록</A>
  </ASIDE> 

  <div class='menu_line'></div>
 
  <DIV id='main_panel'></DIV>
 
  <!-- Modal -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4>
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>
        </div>
        <div class="modal-footer">
          <button type="button" id="tolist" class="btn btn-default" data-dismiss="modal">확인</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal END -->
  
<%--   <c:forEach var = "mem_Mem_picVO"   items= "${mem_Mem_picVO}" > <!-- list도 EL을 이용, requet객체에서 꺼내야 함 --> --%>
  
 
 <c:set var = "mem_no" value = '${memVO.mem_no}'/>
 <c:set var = "mem_id" value = '${memVO.mem_id}'/>
 <c:set var = "mem_pw" value = '${memVO.mem_pw}'/>
 <c:set var = "mem_nick" value = '${memVO.mem_nick}'/>
 <c:set var = "mem_name" value = '${memVO.mem_name}'/>
 <c:set var = "mem_addr1" value = '${memVO.mem_addr1}'/>
 <c:set var = "mem_addr2" value = '${memVO.mem_addr2}'/>
 <c:set var = "mem_zip" value = '${memVO.mem_zip}'/>
 <c:set var = "mem_tel" value = '${memVO.mem_tel}'/>
 <c:set var = "mem_pt" value = '${memVO.mem_pt}'/>
 <c:set var = "mem_date" value = '${memVO.mem_date}'/>
 <c:set var = "mem_sts" value = '${memVO.mem_sts}'/>
 
 <c:set var = "mem_pic_name" value = '${memVO.mem_pic_name.toLowerCase()}'/>
 <c:set var = "mem_pic_name_up" value = '${memVO.mem_pic_name_up}'/>
 <c:set var = "mem_pic_th" value = '${memVO.mem_pic_th.toLowerCase()}'/>
 
  <DIV class='title_line' style='width: 30%;'>회원 정보 조회</DIV>
  
  <br>
  <br>
  
    <c:import url="/mem/list_index_left.do" />

  
  
  <DIV class="col-sm-9 col-md-10 cont">  <!-- 내용 출력 컬럼 -->  
  <FORM name='frm' id='frm' method='POST' action='' onsubmit="return send();" class="form-horizontal">
    
    <input type='hidden' name='mem_no' id='mem_no' value='${mem_no }'>          
 
  
  <div class="form-group">
      <label for="mem_id" class="col-md-2 control-label">아이디</label>    
      <div class="col-md-10">
      ${mem_id }
      </div>
    </div>   
                
                
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>성명</label>    
      <div class="col-md-10">
      ${mem_name }
      </div>
    </div>   
    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>우편번호</label>    
      <div class="col-md-10">
      ${mem_zip }
      </div>
    </div>  
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>주소</label>    
      <div class="col-md-10">
            ${mem_addr1 }
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>상세 주소</label>    
      <div class="col-md-10">
        ${mem_addr2 }
      </div>
    </div>
    
    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>등급</label>    
      <div class="col-md-10">
        ${mem_sts }
      </div>
    </div>

    <div class="form-group">
      <label class="col-md-2 control-label" style='font-size: 0.9em;'>포인트</label>    
      <div class="col-md-10">
        ${mem_pt }
      </div>
    </div>
 

 
 <br>
 
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <!-- <button type="button" onclick="history.go(-1)  ;" class="btn btn-primary btn-md">취소</button> --> <!-- 이전 페이지 -->
        <button type="button" onclick="location.href='./update.do?mem_no=${mem_no}'" class="btn btn-primary btn-md">수정</button>
        <button type="button" id="mem_delete" class="btn btn-primary btn-md">삭제</button>
      </div>
    </div>   
    
 </FORM>
  
  </div>
  </div>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />

</body>
</html>
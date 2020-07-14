<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>공지사항 수정</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->

<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>

<script type="text/javascript">
  $(function() {
    CKEDITOR.replace('notice_content');  // <TEXTAREA>태그 id 값
      
  });
  
</script> 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
    공지사항
  </DIV>

  <ASIDE style='float: left;'>
    공지사항 수정
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./update.do' class="form-horizontal">    
      
      <input type='hidden' name='noticeno' id='noticeno' value='${noticeVO.noticeno }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <label for="notice_division" style='font-size: 0.9em;'>구분</label>
          <SELECT name="notice_division" id ="notice_division" onChange="division();">            
            <OPTION value="공지">공지</OPTION>
            <OPTION value="일반">일반</OPTION>
            <OPTION value="서비스">서비스</OPTION>
          </SELECT>
        </div>
      </div>  
      
     <div class="form-group">   
        <div class="col-md-12">
          <label for="notice_division" style='font-size: 0.9em;'>출력 형식</label> 
          <SELECT name="notice_visible" id ="notice_visible" onChange="division();">
            <option value='Y' selected="selected">Y</option>
            <option value='N'>N</option>
          </SELECT>
        </div>
      </div>       
            
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='notice_title' id='notice_title' value='${noticeVO.notice_title }'
                    placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>        
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control" name='notice_content' id='notice_content' rows='6' placeholder="내용">${noticeVO.notice_content }</textarea>
        </div>
      </div>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control" name='notice_rname'  value='${noticeVO.notice_rname }' placeholder="등록자" style='width: 40%;'>
        </div>
      </div>  
        
      <div class="form-group">   
        <div class="col-md-12">
          <input type='password' class="form-control" name='notice_passwd'  value='' placeholder="패스워드" style='width: 20%;'>
        </div>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" id="btn_division" class="btn btn-info">수정</button>
        <button type="button"
                    onclick="location.href='./list.do?noticeno=${noticeVO.noticeno}'"
                     class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>


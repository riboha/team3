<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>공지사항 조회</title>
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
<script type="text/javascript">
  
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">"; // 이미지 감추기
    tag += "  <IMG src='../attachfile/storage/" + file + "' style='width: 100%;'>";
    tag += "</A>";

    $('#attachfile_panel').html(tag); // 문자열을 태그로 적용
    $('#attachfile_panel').show(); // 패널 출력
  }

  
</script>
</head>

<body>

<jsp:include page="/menu/top.jsp" flush='false' />
  
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title" id='modal_title'></h4><!-- 제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p>  <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  <DIV class='title_line'>
    조회
  </DIV>
  
<table border="0" cellpadding="0" cellspacing="0" class="notice_line">
<colgroup>
  <col width="61" />
  <col width="303" />
  <col width="70" />
  <col width="150" />
  <col width="71" />
  <col width="97" />
</colgroup>
<thead>
  <tr>
      <th class="notice_title" style="font-size: 20px;">제목</th>
      <td colspan="5" class="notice_title" style="font-size: 20px;">${noticeVO.notice_title}</td>
  </tr>
  <tr>
  <th style="font-size: 20px;">등록자</th>
  <td style="font-size: 20px;">${noticeVO.notice_rname}</td>
  <th style="font-size: 20px;">등록일</th>
  <td style="font-size: 20px;">${noticeVO.notice_rdate.substring(0, 10)}</td>
  <th style="font-size: 20px;">조회수</th>
  <td style="font-size: 20px;">${noticeVO.notice_cnt}</td>
  </tr>
</thead>
</table>

  <FORM name='frm' method="get" action='./update.do'>
    <fieldset class="fieldset">
        <ul>
                                     
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;' >
            <c:forEach var="attachfileVO" items="${attachfile_list }">
              <c:set var="thumb" value="${attachfileVO.thumb.toLowerCase() }" />
              
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${attachfileVO.fname }')"><IMG src='../attachfile/storage/${thumb }' style='margin-top: 2px;'></A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
                    
          <li class="li_none">
            <DIV>${noticeVO.notice_content }</DIV>
          </li>         
          
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>FAQ 목록</title>
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
 
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

  <DIV class='title_line'>
    FAQ 목록
  </DIV>
  
  <ASIDE style='float: left;'>
    전체 보기 
  </ASIDE>
  <ASIDE style='float: right;'>
  <c:choose>
        <c:when test="${sessionScope.id_admin != null}">
          <A href="./create.do">등록</A>
          <span class='menu_divide' >│</span>       
          <A href="javascript:location.reload();">새로고침</A>
        </c:when>
        <c:otherwise>
          <A href="javascript:location.reload();">새로고침</A>
          <!--  <span class='menu_divide' >│</span> -->
        </c:otherwise>
  </c:choose>     
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
    <c:choose>
          <c:when test="${sessionScope.id_admin != null}">
            <colgroup>
              <col style='width: 10%;'/>
              <col style='width: 10%;'/>
              <col style="width: 15%;"/>
              <col style='width: 45%;'/>
              <col style='width: 20%;'/>
            </colgroup>
           
            <thead>  
            <TR>
              <th class="th_bs">순서</th>
              <th class="th_bs">번호</th>
              <th class="th_bs">구분</th>
              <th class="th_bs">제목</th>
              <th class="th_bs">기타</TH>
            </TR>
            </thead>
            
            <tbody>
              <c:forEach var="faqVO" items="${list }">
                <c:set var="faqno" value="${faqVO.faqno }" />
                
                <tr>
                  <td class="td_bs">${faqVO.faq_seqno}</td>
                  <td class="td_bs">${faqVO.faqno}</td> 
                  <td class="td_bs">${faqVO.faq_division}</td>
                  <td class="td_bs">
                    <a href="./read.do?faqno=${faqno}">${faqVO.faq_title}</a> 
                  </td>
                  <td class="td_bs">
                    <A href="./update.do?faqno=${faqno }"><span class="glyphicon glyphicon-pencil"></span></A>
                    <A href="./delete.do?faqno=${faqno }"><span class="glyphicon glyphicon-trash"></span></A>
                    <A href="./update_seqno_up.do?faqno=${faqno }"><span class="glyphicon glyphicon-arrow-up"></span></A>
                    <A href="./update_seqno_down.do?faqno=${faqno }"><span class="glyphicon glyphicon-arrow-down"></span></A>          
                  </td>                 
               </tr>
              </c:forEach>             
            </tbody>
          </c:when>
          <c:otherwise>
            <colgroup>
              <col style="width: 15%;"></col>
              <col style="width: 20%;"></col>
              <col style="width: 65%;"></col>
            </colgroup>
            <%-- table 컬럼 --%>
            <thead>
              <tr>
                <th class="th_bs">번호</th>
                <th class="th_bs">구분</th>
                <th class="th_bs">제목</th>
              </tr>
            
            </thead>
            
            <%-- table 내용 --%>
            <tbody>
              <c:forEach var="faqVO" items="${list }">
                <c:set var="faqno" value="${faqVO.faqno }" />
                
                <tr>
                  <td class="td_bs">${faqVO.faqno}</td> 
                  <td class="td_bs">${faqVO.faq_division}</td>
                  <td class="td_bs">
                    <a href="./read.do?faqno=${faqno}">${faqVO.faq_title}</a> 
                  </td> 
                </tr>
              </c:forEach>
              
            </tbody>
          </c:otherwise>
    </c:choose>    
               
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
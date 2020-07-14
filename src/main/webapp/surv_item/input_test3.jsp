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
$(document).ready(function(){
  $("#btn_add").on('click',function(){
   $(".depth_div").append("<label><input type='text' name='depth'>개</label><br/>");
  });
  $("#btn_mi").on('click',function(){
   $(".depth_div label:last").remove();
   $(".depth_div br:last").remove();
  });
 });

출처: https://nizimo.tistory.com/84 [스마일데이]
</script>
</head>
<body>
  <form name="frm" id="frm" action="action" method="post">
    <input type="button" id="add_textbox" value="추가" >
    <input type="button" id="btn_send" value="등록">
  </form>

</body>
</html>
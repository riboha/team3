<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />



<c:forEach var="at_grp_VO" items="${list }">
  <c:choose>
    <c:when test="${at_grp_VO.at_grp_visible =='Y' }">
      <li><a href="${root}/at/list.do?at_grp_no=${at_grp_VO.at_grp_no }">${at_grp_VO.at_grp_name }</a></li>
    </c:when>
  </c:choose>
</c:forEach>
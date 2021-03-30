<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(외부 lib) 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL, JSTL로 바꿔서 처리(choose 등등)</h3>
	
	<c:choose>
		<c:when test="${param.name == 'kglim'}">
			<b>${param.name}</b>
		</c:when>
		<c:when test="${param.name == 'hong'}">
			<i>${param.name}</i>
		</c:when>
		<c:otherwise>
			<h3>${param.name}</h3>
		</c:otherwise>
	</c:choose>
	<hr>
	 
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(외부 lib) 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String id = request.getParameter("ID");
	if(id.equals("hong")){
%>
	<%=id%><img src="images/1.jpg" style="width: 200px;">
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL과 JSTL 사용하기</h3>
	<!-- ${param.ID} = request.getParameter("ID"); -->
	<c:if test="${param.ID == 'hong'}">
		${param.ID}<img src="images/1.jpg" style="width: 200px;">
	</c:if>
	
	<h3>JSTL IF문</h3>
	<!-- 
	http://localhost:8090/WebJSP_EL_JSTL/Ex04_EL_JSTL.jsp?ID=hong&age=25 라고 넘어온다고 가정
	 -->

	<c:if test="${param.age > 20}" var="result"> <!-- var -> if 조건의 결과를 갖는다 -->
		param.value: ${param.age}
	</c:if>
	<br>if구문에서 만들었던 var 변수값: ${result}<br>
</body>
</html>
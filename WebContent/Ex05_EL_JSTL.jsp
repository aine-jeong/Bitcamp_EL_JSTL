<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(외부 lib) 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
/*  
JSTL 구문

1. c:set 	  	## 변수 생성, 값을 저장
2. c:remove  	   변수 삭제
3. c:if test="" ## 조건문
4. c:choose		## 여러가지 조건에 따라 처리 가능(if보다 활용도 높다) 
5. c:forEach	## 반복문
6. c:forTokens	   for문과 split 결합
7. c:out		   출력 (얘보다는 EL ${} 을 사용한다)
8. c:catch		   예외처리

*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL & EL</h3>
	
	EL parameter : ${param.id} - ${param.pwd}<br>
	
	<h3>EL parameter값 변수로 저장하기</h3>
	<c:set var="userid" value="${param.id}" />
	<c:set var="userpwd" value="${param.pwd}" />
	<hr>
	<h3>JSTL 변수값 출력하기</h3>
	id: ${userid}<br>
	pwd: ${userpwd}<br>
	<hr>
	<c:if test="${!empty userpwd}"> <!-- pwd가 비어있지 않다면(pwd가 있으면) -->
		<h3>NOT EMPTY userpwd</h3>
		<c:if test="${userpwd == 1004}">
			<h3> 🐾🦝 WELCOME Admin page 🦝🐾 </h3>
		</c:if>
	</c:if>
</body>
</html>
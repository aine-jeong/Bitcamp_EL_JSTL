<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//EL: 서버쪽 자원에 접근 가능 (: <%= 사용하지 않아도 된다)
	//BUT, EL을 사용한다고 해서 JAVA객체의 API를 지원받을 수 있는 것은 아니다
	//     출력만 할 수 있는고~~
	
	Date today = new Date();
	request.setAttribute("day", today);
	session.setAttribute("day2", today);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>EL 화면출력(: 별도의 객체를 통해서 서버의 자원에 접근 가능하다)</h3>
	EL : ${requestScope.day}<br>
	EL : ${day}<br> <!-- 객체명 생략 가능하나, 잘 사용하지 않는다. -->
	EL : ${sessionScope.day2}<br> <!-- 객체를 명시해서 사용하자~~ -->
</body>
</html>
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
	<h3>JSTL out 출력객체</h3>
	<!-- <p>태그를 적용시키지 않고 화면에 그대로 보이게 하는 두가지 방법 -->
	<!-- 1 -->
	<c:out value="<p>문단태그입니다</p>" />
	<hr>
	<!-- 2 -->
	&lt;p&gt; 태그문 문단태그 입니다.
	
	<hr>
	
	<!-- 
	catch블럭 안에서 예외가 발생하면 예외 객체가 생성되고,
	예외객체정보를 msg 변수가 받는다.
	
	catch(Ex...e)
	-->
	<h3>JSTL 예외처리</h3>
	<c:catch var="msg"> 
	name: <%= request.getParameter("name") %><br>
	<%
		if(request.getParameter("name").equals("hong")){ //예외처리 안하면 equals가 null과 비교되면서 에러난다.
			out.print("당신의 이름은: " + request.getParameter("name"));
		}
	%>
	</c:catch>
	<c:if test="${msg != null}">
		<h3>예외발생</h3>
		오류메세지: ${msg}<br>
	</c:if>
</body>
</html>
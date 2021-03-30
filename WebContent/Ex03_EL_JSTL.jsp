<%@page import="java.util.HashMap"%>
<%@page import="kr.or.bit.Emp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL(외부 lib) 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Emp e = new Emp();
	e.setEmpno(2000);
	e.setEname("bituser");
	
	HashMap<String,String> hp = new HashMap<>();
	hp.put("data","1004");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
	EL: only출력목적 (제어구조나 변수의 개념이 없다)
	JSTL: EL을 도와서 제어구조나 변수를 사용할 수 있도록 해준다.
 -->
 
 	<h3>기존방식</h3>
 	<%=e %><br>
 	<%=e.getEmpno() %><br>
 	<%=e.getEname() %><br>
 	<hr>
 	<h3>EL 출력</h3>
 	EL: ${e}<br>
 	EL은 자바의 객체에 대한 출력을 못한다(자바 객체 직접 접근 불가)<br>
 	EL: ${e.getEmpno()}<br>
 	<hr>
 	<h3>해결방법은?</h3>
 	1. reqeust 또는 session객체에 담기 <br>
 	2. JSTL 사용해서 처리 <br>
 	<h3>JSTL(core): 변수 생성, 제어문 사용 가능 (자바코드 없이...)</h3>
 	<c:set var="m" value="<%=e%>" />
 	JSTL을 사용해서 m을 생성 (그 변수 출력): ${m}<br>
 	<br>
 	(비권장방식) getter 함수: ${m.getEmpno()}<br>
 	<!-- 아래의 방식은 실제 emp 클래스에 gette함수가 있어야만 사용 가능 -->
 	EL 출력(m.memberfield명 -> 자동으로 getter함수 호출): ${m.empno}<br>
 	EL 출력(m.memberfield명 -> 자동으로 getter함수 호출): ${m.ename}<br>
 	<hr>
 	<c:set var="username" value="${m.ename}" />
 	변수값 출력: ${username}<br>
 	<hr>
 	<h3>JSTL 변수를 만들고 scope에 대한 정의를 할 수 있다.</h3>
 	<c:set var="job" value="농구선수" scope="request"></c:set>
 	당신의 직업은: ${job}<br>
 	만약, include나 forward한 페이지가 있다면 그 페이지에서 EL을 사용해서 job변수 출력 가능<br>
 	
 	<hr>
 	<c:set var="job2" value="야구선수" scope="request" />
 	값 출력: ${job2}<br>
 	<hr>
 	만든 변수 삭제 가능(잘 사용하지 않는다)<br>
 	<c:remove var="job2"/>
 	job2 변수 삭제 ${job2}<br> <!-- 변수가 삭제되었으나, 오류가 아니라 단지 출력이 안나오는 것. -->
 	<hr>
 	EL / hp 객체 직접접근: ${hp} <br>
 	<c:set var="vhp" value="<%=hp%>" />
 	hp객체: ${vhp}<br>
 	hp객체: ${vhp.data}<br>
 	
 	<!-- 
 	hp.put("color","red");
 	JSTL 통해서 가능하지만, 잘 사용하지 않는다
 	 -->
 	<c:set target="${vhp}" property="color" value="red" />
 	hp객체: ${vhp}<br>
</body>
</html>







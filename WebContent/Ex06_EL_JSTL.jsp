<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="kr.or.bit.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

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
	<h3>JSTL for문</h3>
	<!-- 
		java코드
		int sum = 0;
		for(int i =0; i <= 100; i++){
			sum+=i;
		}
		for(String s : list){} 
	 -->
	 
	 <c:forEach var="i" begin="1" end="10">
	 	<c:set var="sum" value="${sum+i}" />
	 	<b>${i}</b> / <b>${sum}</b>
	 	<br>
	 </c:forEach>
	 sum 누적값: ${sum}
	 <hr>
	 <h3>구구단 5단 출력하기 (forEach사용)</h3>
	 <ul>
		 <c:forEach var="i" begin="1" end="9">
		 	<li> 5 X ${i} = ${5*i}</li>
		 </c:forEach>
	 </ul>
	 
	 <hr>
	 <h3>EL & JSTL 사용해서 구구단 출력하기</h3>
	 <table border="1">
	 <c:forEach var="i" begin="2" end="9">
	 	<c:forEach var="j" begin="0" end="9">
	 		<c:choose>
	 			<c:when test="${j == 0}">
	 				<tr bgcolor="gold"><th>${i}단</th></tr>
	 			</c:when>
	 			<c:otherwise>
	 				<tr><td>${i}x${j}=${i*j}</td></tr>
	 			</c:otherwise>
	 		</c:choose>
	 	</c:forEach>
	 </c:forEach>
	 </table>
	 <hr>
	 <h3>JSTL forEach 사용하기</h3>
	 <%
	 	int[] arr = new int[]{10,20,30,40,50};
	 	for(int i : arr) {
	 		out.print("출력값: <b><i>" + i + "</i></b><br>");
	 	}
 	 %>
 	 
 	 <h3>EL -> JAVA 객체에 직접 접근 불가능 >> JSTL 통해서 접근</h3>
 	 arr 객체 배열에 접근 불가: ${arr}<br>
 	 
 	 <c:set var="intarr" value="<%= arr %>" />
 	 EL 접근: ${intarr} <br>
 	 <hr>
 	 <c:forEach var="i" items="${intarr}"> <!-- ### items ### -->
 	 	배열값: ${i}<br>
 	 </c:forEach>
 	 <hr>
 	 <h3>단순하게 사용가능</h3>
 	 <c:forEach var="i" items="<%=arr%>"> <!-- 따로 담아두지 않아도 사용 가능하다~~ -->
 	 	배열값2: ${i}<br>
 	 </c:forEach>
 	 <hr>
 	 <h3>재미삼아서(가능은 하지만 가급적 사용하지 말 것)</h3>
 	 <c:forEach var="i" items="<%= new int[]{1,2,3,4,5} %>">
 	 	배열값3: ${i}<br>
 	 </c:forEach>
 	 
 	 <h3>forEach 속성 활용하기</h3>
 	 <c:forEach var="i" items="${intarr}" varStatus="status">
 	 	index: ${status.index}&nbsp;&nbsp;&nbsp; <!-- &nbsp : 스페이스 -->
 	 	count: ${status.count}&nbsp;&nbsp;&nbsp;
 	 	value: ${i}<br>
 	 </c:forEach>
 	 <hr>
 	 <h3>TODAY POINT (게시판 화면 구성시 사용..)</h3>
 	 <%
 	 	//사원 정보를 담는 테이블 DB
 	 	//JAVA코드: List<Emp> getEmpList() { 구현되는 코드 }
 	 	List<Emp> emplist = new ArrayList<>();
 	 	emplist.add(new Emp(100,"A"));
 	 	emplist.add(new Emp(200,"B"));
 	 	emplist.add(new Emp(300,"C"));
 	 	
 	 	//return emplist;
 	 	
 	 	//함수의 리턴값을 받아서
 	 	for(Emp e : emplist){
 	 		out.print(e.getEmpno() + " / " + e.getEname() + "<br>");
 	 	}
 	 	
 	 	//JSP 페이지에서 테이블 태그를 결합해서 이쁘게 출력
 	 	request.setAttribute("list", emplist);
 	 	//include, forward된 페이지에서 ... request.getAttribute 가능
 	 	//EL > reqeustScope.list 가능
 	 %>
 	 
 	 <h3>게시판 데이터 출력(EL, JSTL) / set 사용</h3>
 	 <c:set var="list" value="<%= emplist %>" />
 	 <table border="1">
 	 	<tr><td>사번</td><td>이름</td></tr>
 	 	<c:forEach var="emp" items="${list}">
 	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
 	 	</c:forEach>
 	 </table>
 	 
 	 <h3>게시판 데이터 출력(EL, JSTL)</h3>
 	 <table border="1">
 	 	<tr><td>사번</td><td>이름</td></tr>
 	 	<c:forEach var="emp" items="<%= emplist %>">
 	 		<tr><td>${emp.empno}</td><td>${emp.ename}</td></tr>
 	 	</c:forEach>
 	 </table>
 	 
 	 <h3>Java Map 객체 EL,JSTL 사용해서 출력</h3>
 	 <%
 	 	Map<String, Object> hm = new HashMap<>();
 	 	hm.put("name","hong");
 	 	hm.put("pwd",1004);
 	 	hm.put("date", new Date());
 	 %>
 	 <c:set var="hm" value="<%=hm%>" />
 	 <c:forEach var="obj" items="${hm}">
		${obj.key} -> ${obj.value}<br> 	 
 	 </c:forEach>
 	 
 	 key:name : ${hm.name}<br>
 	 key:pwd : ${hm.pwd}<br>
 	 key:date : ${hm.date}<br>
 	 
 	 
</body>
</html>






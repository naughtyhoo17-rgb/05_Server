<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- JSP용 주석
	
	<%@ %> : 지시자 태그 => JSP 페이지의 전반적 속성 설정에 사용
	
	<% %> : 스크립틀릿 => 내부에 자바코드 작성 가능
	
	<%= %> : 표현식/출력식 => 자바, 서버에서 받아온 값을 표현(출력)할 때 사용
	
	JSP (Java Server Page) : Java코드가 포함된 HTML 코드
	
	 --%>

	<h3 style="color: hotpink;"><%= request.getParameter("inputName") %>님, 메뚜기월드에 오신걸 환영합니다.</h3>

	<ul>
		<li>id : <%= request.getParameter("inputId") %></li>
		<li>pw : <%= request.getParameter("inputPw") %></li>
	</ul>
	
	<% if( request.getParameter("intro").equals("") ) { %>
		<h4>자기소개</h4>
		<p><%= request.getParameter("intro") %></p>>
	<% } %>
	
	
	
	
</body>
</html>
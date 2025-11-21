<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>${todo.todoTitle}수정 페이지</title>
</head>
<body>

	<h1></h1>
	
	<h4>할 일 수정</h4>
	
	
	<form action="/todo/update" method="post" id="updateForm">
		<div>
			제목 : <input type="text" name="title" value="${todo.todoTitle}">
		</div>
		<div>
			<textarea name="detail" rows="3" cols="50"
			placeholder="상세 내용..">${todo.todoDetail}</textarea>
		</div>
		
		<%-- 
			todoNo도 수정 요청 시 parameter로 제출해야 함!
			why? => 어떤 todoNo를 가진 행을 수정할 것인지 SQL의 WHERE절에서 필요
			=> 화면 상에 노출될 필요 없기 때문에 hidden 처리
			
			ex)			
			param : url(/todo/update?todoNo=1)에 있는 todoNo값을
			EL 표현식에서 ${param.key} => ${param.todoNo} -> 1 반환
		--%>
		<input type="hidden" name="todoNo" value="${param.todoNo}">
		
		<button>수정 완료</button>
	</form>
	
	<c:if test="${not empty sessionScope.message}">
		<script>
		
			alert("${message}");
			
		</script>
		
		<c:remove var="message" scope="session"/>
	</c:if>
	
	
</body>
</html>
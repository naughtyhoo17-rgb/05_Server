<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>EL 확인 1</title>
</head>
<body>
	<h3>전달받은 parameter 출력하기</h3>
	<pre>
- \${param.key} : key값 일치하는 parameter의 value값 얻어오기
- \${paramValues.key} : key값 일치하는 parameter '모두' 얻어오기 => 배열 형태
	</pre>
	
	<ul>
		<%-- EL은 문자열 비교 ==(비교 연산자) 사용 가능! --%>
		<li>${param.str == "abc"}</li>
		<%-- HTML에서 얻어온 데이터는 모두 String,
			EL에서 연산되는 자료형이 다를 경우 자동형변환 진행 후 비교해줌! --%>
		<li>${param.intNum == 100}</li>
		<li>${param.doubleNum == 3.14}</li>
	</ul>
	
	<hr>
	
	<h3>같은 key값을 지닌 parameter 얻어오기</h3>
	
	<ul>
		<%-- check 여러 개 전달된 경우 => 첫 번째 param값만 출력 --%>
		<li>param.check : ${param.check}</li>
		<%-- check 여러 개 전달된 경우 => String[]의 주소값 출력 --%>
		<li>paramValues.check : ${paramValues.check}</li>
		
		<li>paramValues.check[0] : ${paramValues.check[0]}</li>
		<li>paramValues.check[1] : ${paramValues.check[1]}</li>
		<li>paramValues.check[2] : ${paramValues.check[2]}</li>
	</ul>
	
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>

</head>
<body>
	<h3>방명록 삭제를 위해서 이름과 비밀번호를 확인합니다</h3>

	
	<form action="gbc" method="get">
		
		이름 : 	<input type="text" name="name">
		비밀번호 : <input type="text" name="password"> 
				<input type="hidden" name="action" value="delete">
				<input type="hidden" name="no" value="${param.no }">
		<br>
		<button type="submit">확인</button>
	</form>	
	
	<br><br>
	<a href = "gbc?action=list">리스트로 돌아가기</a>
</body>
</html>
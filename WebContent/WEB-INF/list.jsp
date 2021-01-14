<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.javaex.guestdao.*" %>
<%@ page import="com.javaex.guestvo.*" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
</head>
<body>

	<form action="gbc" method="get">
		<input type = "hidden" name = "action" value="insert">
		<table border='1'>
	
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
			
			<tr>
				<td colspan='4'><textarea name="content" cols='60' rows='15'></textarea></td>		
			</tr>
		
			<tr>
				<td><button type="submit">확인</button></td>
			</tr>
	
		</table>
	</form>
	
	<c:forEach items="${guestList}" var="list">
		<table border='1'>
	
				<tr>	
					<td>${list.no}</td>
					<td>${list.name }</td>
					<td>${list.date }</td>
					<td>
						<a href="./gbc?action=delForm&no=${list.no }">삭제</a>
						<a href="./gbc?action=upForm&no=${list.no }">수정</a>
					</td>
				</tr>
				
				<tr>
					<td colspan='4'>${list.content }</td>		
				</tr>
			
				
		
			</table>
	
	</c:forEach>
	
	
	
</body>
</html>
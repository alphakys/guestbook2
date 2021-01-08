<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.javaex.guestbook.*" %>

<%
int no = Integer.parseInt(request.getParameter("no"));

GuestVo gv = (GuestVo)request.getAttribute("guest");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
		
		<h3>수정을 하기 위해서 비밀번호를 입력해주세요</h3><br>
		<p>비밀번호가 틀릴시 현재 화면으로 되돌아옵니다</p>
		
		<form action="gbc">
		
		<input type = "hidden" name = "action" value="update">
		<input type = "hidden" name = "no" value="<%=no%>">
		
		<table border='1'>
	
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="<%=gv.name%>"></td>
				<td>비밀번호</td>
				<td><input type="text" name="password"></td>
			</tr>
			
			<tr>
				<td colspan='4'><textarea name="content" cols='60' rows='15'></textarea></td>		
			</tr>
		
			<tr>
				<td><button type="submit">수정하기</button></td>
			</tr>
	
		</table>
	</form>
	
	
	<br><br>
	<a href = "gbc?action=list">리스트로 돌아가기</a>
	
	
</body>
</html>
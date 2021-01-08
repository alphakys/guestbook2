<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% int no = Integer.parseInt(request.getParameter("no")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
		<form action="gbc">
		
		<input type = "hidden" name = "action" value="update">
		<input type = "hidden" name = "no" value="<%=no%>">
		
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
				<td><button type="submit">수정하기</button></td>
			</tr>
	
		</table>
	</form>
	
</body>
</html>
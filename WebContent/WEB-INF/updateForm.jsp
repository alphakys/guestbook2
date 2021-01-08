<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
		<form action="gbc">
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
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.javaex.guestdao.*" %>
<%@ page import="com.javaex.guestvo.*" %>
<%@ page import="java.util.List" %>


<%  List<GuestVo> gList = (List<GuestVo>)request.getAttribute("guestList"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
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
	
	
	<%for(int i=0; i<gList.size(); i++){ %>
			<table border='1'>
	
				<tr>
					<td><%=gList.get(i).no%></td>
					<td><%=gList.get(i).name%></td>
					<td><%=gList.get(i).date%></td>
					<td>
						<a href="./gbc?action=delForm&no=<%=gList.get(i).no%>">삭제</a>
						<a href="./gbc?action=upForm&no=<%=gList.get(i).no%>">수정</a>
					</td>
				</tr>
				
				<tr>
					<td colspan='4'><%=gList.get(i).content%></td>		
				</tr>
			
				
		
			</table>
	
	<%} %>
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
int no = Integer.parseInt(request.getParameter("no")); 

int result;

try{
	
	result = (Integer)request.getAttribute("result");
}
catch(NullPointerException e){
	result=1;
}


%>




<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Delete</title>

</head>
<body>
	<h3>방명록 삭제를 위해서 이름과 비밀번호를 확인합니다</h3>
	
	<%if(result==0){%>
	
	비밀번호가 틀렸습니다 다시 입력해주세요
	
	<%} %>
	
	<form action="gbc">
		
		이름 : 	<input type="text" name="name">
		비밀번호 : <input type="text" name="password"> 
				<input type="hidden" name="action" value="delete">
				<input type="hidden" name="no" value="<%=no%>">
		<br>
		<button type="submit">확인</button>
	</form>	
	
	<br><br>
	<a href = "gbc?action=list">리스트로 돌아가기</a>
</body>
</html>
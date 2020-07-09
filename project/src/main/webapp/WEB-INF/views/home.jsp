<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$('#loginBt').click(function(){
		var id = $('#loginId').val();
		var pw = $('#loginPw').val();
		if(null == id || '' == id){
			alert("아이디를 입력하세요.");
			return;
		}else if(null == pw || '' == pw){
			alert("비밀번호를 입력하세요.");
			return;
		}else{
			$('#loginSubmit').submit();
		}
	});
})
</script>
<head>
	<title>Login</title>
</head>
<body>
<div align ="center">
	<form id = "loginSubmit" name = "loginSubmit" method = "post" action = "<%=request.getContextPath()%>/loginCkeck">
		<h1>Login</h1>
		<input type="text" id = "input001" name = "input001" style= width:100px value ="아이디 :" disabled></input> 
		<input type="text" id = "loginId" name = "loginId"></input><p>
		<input type="text" id = "input002" name = "input002" style= width:100px value ="비밀번호 :" disabled></input> 
		<input type="password" id = "loginPw" name = "loginPw"></input><p>
	 </form>
	 <input type="submit" id = "loginBt" name = "loginBt" style= width:100px value="로그인"/>
</div>
</body>
</html>

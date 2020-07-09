<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<html>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
</style>
<script type="text/javascript">
$(document).ready(function(){
	$("#submit").click(function() {
		var dataArrayToSend = [];
		var dataArrayToSend1 = [];

		$("#list tr").each(function(){
			var len = $(this).find("td").length;
			for(var i=0; i< len; i++){
				dataArrayToSend.push($(this).find("td").eq(i).text());
			}
			dataArrayToSend1.push(dataArrayToSend);
		});
		
		$.ajax({
			contentType: "application/json",
			type: "POST",
			data: JSON.stringify(dataArrayToSend1),
			url: "${pageContext.request.contextPath}/table/tabledataSend",
			success: function(data) {
			console.log('done');
			},
		error: function(jqXHR, textStatus, errorThrown) {
		console.log('error while post');
		}
		});
		});
})
</script>
<head>
	<title>main</title>
</head>
<body>
<div style="width : 70%;">
	님 환영합니다. <input type="button" id = "logoutBt" name = "logoutBt" style= width:100px value="로그아웃"/><p>
	<div align = "right">
		<input type="button" id = "writeBt" name = "logoutBt" style= width:100px value="글쓰기"/>
		<input type="button" id = "approvalBt" name = "approvalBt" style= width:100px value="대리결재"/>&emsp;
	</div>
	<p>
	<div style="width : 100%; border: 1px solid #000000;">
		<form id = "searchSubmit" name = "searchSubmit" method = "post" action = "<%=request.getContextPath()%>/searchSubmit">
		  &emsp;<select name="levl">
			    <option value="">선택</option>
			    <option value="01">작성자</option>
			    <option value="02">결재자</option>
			    <option value="03">제목+내용</option>
			</select>
			<input type="text" id = "searchText" name = "searchText" style= width:300px placeholder="검색어를 입력하세요"></input>
			<select name="cho">
			    <option value="">결재상태</option>
			    <option value="11">임시저장</option>
			    <option value="12">결재대기</option>
			    <option value="13">결재중</option>
			    <option value="14">결재완료</option>
			    <option value="15">반려</option>
			</select>
			<p>&emsp;
			<input type="text" id = "input01" name = "input01" style= width:100px></input> ~ 
			<input type="text" id = "input02" name = "input02" style= width:100px></input>
			<input type="submit" id = "searchBt" name = "searchBt" style= width:100px value="검색"/>
		</form>
	</div>
	<p>
	<table id="list" style="width:100%">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>결재일</th>
			<th>결재자</th>
			<th>결재상태</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table>
</div>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//과장 또는 부장일경우에 대리결재 가능
	if("${userInfo.CODE_NM}" == "과장" || "${userInfo.CODE_NM}" == "부장"){
		console.log("여기");
		$('#approvalBt').show();
	}else{
		$('#approvalBt').hide();
	}
	
	//게시글 가져오기
	$.ajax({
        type: "GET",
        url: "listBoard",
        success: function(data) {
            for (var str in data) {
                //tr 태그를 생성해서 id에 tobody에 추가
                var tr = $("<tr></tr>").appendTo("#tbody");
                //tr에 td를 추가 후 내용을 데이터 값
                $("<td></td>").text(data[str]['LIST_NUM']).appendTo(tr);
                $("<td></td>").text(data[str]['NAME']).appendTo(tr);
                $("<td></td>").text(data[str]['SUBJECT']).appendTo(tr);
                $("<td></td>").text(FormatToUnixtime(data[str]['REG_DATE'])).appendTo(tr);
                $("<td></td>").text(FormatToUnixtime(data[str]['CHO_DATE'])).appendTo(tr);
                $("<td></td>").text(data[str]['CHO_NAME']).appendTo(tr);
                $("<td></td>").text(data[str]['CODE_NM']).appendTo(tr);
            }
        },
        error: function(error) {
            alert("오류 발생" + error);
        }
    });
	
	//유닉스 타임스템프를 년 월 일 시 분 초로 변경하기 위한 함수
    function FormatToUnixtime(unixtime) {
    	var u = new Date(unixtime);
        return u.getUTCFullYear() +
            '.' + ('0' + u.getUTCMonth()).slice(-2) +
            '.' + ('0' + u.getUTCDate()).slice(-2)
    };
	
	//로그아웃 버튼 처리
	$("#logoutBt").click(function() {
		window.location.href="/logout";
	});
	
	//글쓰기 버튼 처리
	$("#writeBt").click(function() {
		window.location.href="/write";
	});
	
	//검색버튼 처리
	$("#searchBt").click(function() {
		var searchText = $("#searchText").val();
		var levl = $("#levl").val();
		
		if(searchText != "" && levl == ""){
			alert("검색유형을 선택하세요");
			return;
		}
		var searchData = {
				levl : $("#levl").val(),
				cho : $("#cho").val(),
				searchText : $("#searchText").val(),
				strDate : $("#strDate").val(),
				endDate : $("#endDate").val()
			};
		$.ajax({
			type: "GET",
			data: searchData,
			dataType : "JSON",
			url: "listBoard",
			async: false,
			success: function(data) {
				$('td').remove();
				for (var str in data) {
	                //tr 태그를 생성해서 id에 tobody에 추가
	                var tr = $("<tr></tr>").appendTo("#tbody");
	                //tr에 td를 추가 후 내용을 데이터 값
	                $("<td></td>").text(data[str]['LIST_NUM']).appendTo(tr);
	                $("<td></td>").text(data[str]['NAME']).appendTo(tr);
	                $("<td></td>").text(data[str]['SUBJECT']).appendTo(tr);
	                $("<td></td>").text(FormatToUnixtime(data[str]['REG_DATE'])).appendTo(tr);
	                $("<td></td>").text(FormatToUnixtime(data[str]['CHO_DATE'])).appendTo(tr);
	                $("<td></td>").text(data[str]['CHO_NAME']).appendTo(tr);
	                $("<td></td>").text(data[str]['CODE_NM']).appendTo(tr);
	            }
			},
			error: function(error) {
	            alert("오류 발생" + error);
			}
		});
	});
})
</script>
<head>
	<title>게시판</title>
</head>
<body>
<div style="width : 70%;">
	${userInfo.NAME}(${userInfo.CODE_NM}) 님 환영합니다. <input type="button" id = "logoutBt" name = "logoutBt" style= width:100px value="로그아웃"/><p>
	<div align = "right">
		<input type="button" id = "writeBt" name = "logoutBt" style= width:100px value="글쓰기"/>
		<input type="button" id = "approvalBt" name = "approvalBt" style= width:100px value="대리결재"/>&emsp;
	</div>
	<p>
	<div style="width : 100%; border: 1px solid #000000;">
		<form id = "searchSubmit" name = "searchSubmit" method = "post" action = "<%=request.getContextPath()%>/searchSubmit">&emsp;
		  	<select id='levl' name="levl">
			    <option value="">선택</option>
			    <option value="01">작성자</option>
			    <option value="02">결재자</option>
			    <option value="03">제목+내용</option>
			</select>
			<input type="text" id = "searchText" name = "searchText" style= width:300px placeholder="검색어를 입력하세요"></input>
			<select id='cho' name="cho">
			    <option value="">결재상태</option>
			    <option value="a001">임시저장</option>
			    <option value="b001">결재대기</option>
			    <option value="c001">결재중</option>
			    <option value="d001">결재완료</option>
			    <option value="e001">반려</option>
			</select>
			<p>&emsp;
			<input type="date" id = "strDate" name = "strDate" style= width:150px></input> ~ 
			<input type="date" id = "endDate" name = "endDate" style= width:150px></input>
			<input type="button" id = "searchBt" name = "searchBt" style= width:100px value="검색"/>
		</form>
	</div>
	<p>
	<table id="list" style="width:100%">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>작성일</th>
				<th>결재일</th>
				<th>결재자</th>
				<th>결재상태</th>
			</tr>
		</thead>
		<tbody id="tbody">
        </tbody>
	</table>
</div>
</body>
</html>

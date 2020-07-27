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
  #input004{ 
	vertical-align: top;
	}
</style>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//취소 버튼 처리
	$("#cancel").click(function() {
		window.history.back();
	});
	//test
	
	//게시글 이력 가져오기
// 	$.ajax({
//         type: "GET",
//         url: "listHistBoard",
//         success: function(data) {
//             for (var str in data) {
//                 //tr 태그를 생성해서 id에 tobody에 추가
//                 var tr = $("<tr></tr>").appendTo("#tbody");
//                 //tr에 td를 추가 후 내용을 데이터 값
//                 $("<td></td>").text(data[str]['LIST_NUM']).appendTo(tr);
//                 $("<td></td>").text(FormatToUnixtime(data[str]['CHO_DATE'])).appendTo(tr);
//                 $("<td></td>").text(data[str]['CHO_NAME']).appendTo(tr);
//                 $("<td></td>").text(data[str]['CODE_NM']).appendTo(tr);
//             }
//         },
//         error: function(error) {
//             alert("오류 발생" + error);
//         }
//     });
	
	//유닉스 타임스템프를 년 월 일 시 분 초로 변경하기 위한 함수
    function FormatToUnixtime(unixtime) {
    	var u = new Date(unixtime);
        return u.getUTCFullYear() +
            '.' + ('0' + u.getUTCMonth()).slice(-2) +
            '.' + ('0' + u.getUTCDate()).slice(-2)
    };
})
</script>
<head>
	<title>글쓰기</title>
</head>
<body>
<div style="width : 70%;">
	<table id="check" style="width:100%">
		<thead>
			<tr>
				<th>결재요청</th>
				<th>과장</th>
				<th>부장</th>
			</tr>
			<tbody>
				<td><input type="checkbox" name="checkbox1" value="chk001"></td>
				<td><input type="checkbox" name="checkbox2" value="chk002"></td>
				<td><input type="checkbox" name="checkbox3" value="chk003"></td>
        	</tbody>
		</thead>
		<tbody id="tbody">
        </tbody>
	</table>
	<p>
	<div>
		<input type="text" id = "input001" name = "input001" style= width:100px value ="번호 :" disabled></input> 
		<input type="text" id = "loginId" name = "loginId"></input><p>
		<input type="text" id = "input002" name = "input002" style= width:100px value ="작성자 :" disabled></input> 
		<input type="text" id = "loginPw" name = "loginPw"></input><p>
		<input type="text" id = "input003" name = "input001" style= width:100px value ="제목 :" disabled></input> 
		<input type="text" id = "loginId" name = "loginId"></input><p>
		<input type="text" id = "input004" name = "input002" style= width:100px value ="내용 :" disabled></input> 
		<textarea cols="50" rows="10"></textarea>
	</div>
	<p>
	<div align = "center">
		<input type="button" id = "writeBt" name = "logoutBt" style= width:100px value="반려"/>&emsp;
		<input type="button" id = "approvalBt" name = "approvalBt" style= width:100px value="임시저장"/>&emsp;
		<input type="button" id = "approvalBt" name = "approvalBt" style= width:100px value="결재"/>
		<input type="button" id = "cancel" name = "cancel" style= width:100px value="취소"/>
	</div>
	<p>
	<table id="list" style="width:100%">
		<thead>
			<tr>
				<th>번호</th>
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

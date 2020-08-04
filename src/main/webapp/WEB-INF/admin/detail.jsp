<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css" >
<title>경비 등록/수정</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
	

</head>
<body>

<!-- 업데이트 -->
<div class="container mb-5 mt-3">
<h2>회원정보</h2>
<img src='${pageContext.servletContext.contextPath}/upload/user/${user.image}' height='150' style="border-radius: 70%;">
<br><br>
<table class="table table-bordered">
    <tr>
       <td>아이디</td>
       <td>${user.id}</td>
    </tr>
    <tr>
       <td>사용내역</td>
       <td>${user.name}</td> 
   </tr>
</table>


<h2>사용기록</h2>

<table class="table table-bordered text-center">
<td><a type="button" value="추가" onclick="addDiv(${user.userNo});">로그기록</a></td>
<td><a type="button" value="추가1" onclick="addDiv2(${user.userNo});" id="no">경비처리기록</a></td>

</table>
<div id="elList"></div>


<input type="submit" value="확인" onclick="window.close()" >
<input type="button" value="닫기" onclick="window.close()">
<input type="button" value="삭제" onclick="location.href='../expense/delete?no='+'${expense.expenseNo}'; window.close();">
<script src="../../script/admin.js"></script>
</body>
</html>
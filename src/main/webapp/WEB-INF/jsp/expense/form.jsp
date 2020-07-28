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
<div class="container mb-5 mt-3">
<form action='add' method='post' enctype='multipart/form-data' target="listPage">
<h2>경비 등록/ 수정</h2>
<table class="table table-bordered">
    <tr>
       <td>사용내역</td>
       <td><select name="name">
    <option value="" selected> 선택</option>
    <option value="식대(야근)">식대(야근)</option>
    <option value="택시비(야근)">택시비(야근)</option>
    <option value="택시비(회식)">택시비(회식)</option>
    <option value="사무용품구매">사무용품구매</option>
    <option value="교육비">교육비</option>
    <option value="접대비">접대비</option>
    </select></td> 
   </tr>
    <tr>
       <td>사용일</td>
       <td><input name="useDate" type="date"></td>
   </tr>
    <tr>
       <td>금액</td>
       <td><input name="usePrice" type="text"></td>
   </tr>
    <tr>
       	<td>영수증</td>
    	<td><input name="imageFile" type="file"></td>
  </tr>

</table>
  <input name="registrationDate" type="date" style="display: none" id="currentDate">
    <script>
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
</script> 
<input type="submit" value="확인" onclick="window.close()" >
<input type="button" value="닫기" onclick="window.close()">
</form>
</div>
</body>
</html>
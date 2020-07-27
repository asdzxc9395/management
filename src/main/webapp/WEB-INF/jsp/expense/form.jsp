<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action='add' method='post' enctype='multipart/form-data' target="listPage">
<h2>경비 등록/ 수정</h2>
<table border="8">
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

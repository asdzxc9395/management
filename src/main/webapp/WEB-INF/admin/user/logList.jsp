<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   


<table class="table table-hover table-bordered text-center" style="width: 100%;" id="logList">
   <thead>
    	<tr>
       		<th>로그인</th>
       		<th>로그아웃</th>
   		</tr>
   </thead>
   <c:forEach items="${lList}" var="item">
   <tbody>
  <tr>
    <td>${item.logIn}</td> 
    <td>${item.logOut}</td> 
  </tr>
</tbody>
</c:forEach>
</table>
<script src="../../script/admin.js"></script>

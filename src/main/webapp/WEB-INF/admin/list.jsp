<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="header.jsp" />
<div class="container" style="width: 600px;">
<table class="table table-hover table-bordered" style="width: 100%;" id="logList">
   <thead>
    	<tr>
       	    <th>순번</th>
       		<th>이름</th>
       		<th>아이디</th>
   		</tr>
   </thead>
   <c:forEach items="${uList}" var="item">
   <tbody>
  <tr onclick="update(${item.userNo})" id="no">
    <td>${item.userNo}</td> 
    <td>${item.id}</td> 
    <td>${item.name}</td> 
  </tr>
</c:forEach>
</tbody>
</table>
</div>
<script src="../../script/admin.js"></script>
</body>
</html>
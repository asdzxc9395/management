<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   


<table class="table table-hover table-bordered mydatatable" style="width: 100%;" id="expenseList">
   <thead>
    	<tr>
       		<th>사용일</th>
       		<th>사용내역</th>
       		<th>사용금액</th>
       		<th>승인금액</th>
       		<th>처리상태</th>
   		</tr>
   </thead>
   <c:forEach items="${eList}" var="item">
   <tbody>
   <tr onclick="addDiv3(${item.expenseNo})">
 	<td>${item.useDate}</td> 
    <td>${item.name}</td> 
    <td>${item.usePrice}</td> 
    <td>${item.approvePrice}</td>
    <c:choose>
    <c:when test="${item.processStatus eq '승인'}">
       <td>처리</td>
    </c:when>
    <c:otherwise><td>미처리</td></c:otherwise>
</c:choose>
  </tr>
</c:forEach>
</tbody>
</table>
<script src="../../script/admin.js"></script>

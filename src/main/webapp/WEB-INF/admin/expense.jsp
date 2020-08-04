<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="header.jsp" />
<div class="container">
 <h2>미처리 총${size}건</h2>
<table class="table table-hover table-bordered" style="width: 100%;">
   <thead>
    	<tr>
       	    <th>순번</th>
       		<th>사용내역</th>
       		<th>사용금액</th>
       		<th>승인금액</th>
       		<th>처리상태</th>
       		<th>등록일</th>
   		</tr>
   </thead>
   <c:forEach items="${expense}" var="item">
   <tbody>
  <tr onclick="update(${item.expenseNo})" id="no">
    <td>${item.expenseNo}</td> 
    <td>${item.name}</td> 
    <td>${item.usePrice}</td> 
    <td>${item.approvePrice}</td>
    <c:choose>
    	<c:when test="${item.processStatus eq '승인'}">
     	  <td>처리</td>
  	    </c:when>
   	 <c:otherwise><td>미처리</td></c:otherwise>
	</c:choose>    
    <td>${item.registrationDate}</td>
  </tr>
</c:forEach>
</tbody>
  <tfoot>
  <tr>
  <th>합계</th>
       <th></th>
       <th></th>
       <th>${usePrice}</th>
       <th>${approvePrice}</th>
       <th></th>
       <th></th>
  </tr>
  </tfoot>
</table>
</div> 
<script src="../../script/event.js"></script>
</body>
</html>
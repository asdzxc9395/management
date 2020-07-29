<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="../header.jsp" />

<div class="container mb-5 mt-3">
 <h2 class="bList_title"> 총${size}건</h2>
 <form id="form1" name="form1" method="post" enctype="multipart/form-data">
    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드</button>
	<button type="button" onclick="add()">등록</button>
</form>
<table class="table table-hover table-bordered mydatatable" style="width: 100%;">

   <thead>
    	<tr>
       	    <th>순번</th>
       		<th>사용일</th>
       		<th>사용내역</th>
       		<th>사용금액</th>
       		<th>승인금액</th>
       		<th>처리상태</th>
       		<th>등록일</th>
   		</tr>
   </thead>
   <c:forEach items="${list}" var="item">
   <tbody>
  <tr onclick="update(${item.expenseNo})" id="no">
    <td>${item.expenseNo}</td> 
    <td>${item.useDate}</td> 
    <td>${item.name}</td> 
    <td>${item.usePrice}</td> 
    <td>${item.approvePrice}</td>
    <td>${item.processStatus}</td>
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

<script type="text/javascript">
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "downloadExcelFile2";
        f.submit();
    }
</script>
<script src="../../script/event.js"></script>
</body>
</html>
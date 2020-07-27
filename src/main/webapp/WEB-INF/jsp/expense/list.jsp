<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="../header.jsp" />

<div id="list">
 <h2 class="bList_title">총${size}건</h2>
<table border="8">
    <tr>
       <th width="5%" height="15%">순번</th>
       <th width="16%">사용일</th>
       <th width="20%">사용내역</th>
       <th width="10%">사용금액</th>
       <th width="10%">승인금액</th>
       <th width="20%">처리상태</th>
       <th width="16%">등록일</th>
   </tr>
   <c:forEach items="${list}" var="item">
  <tr>
    <td>${item.expenseNo}</td> 
    <td>${item.useDate}</td> 
    <td>
    <a onclick="update(${item.expenseNo})" id="no">${item.name}</a>
    </td> 
    <td>${item.usePrice}</td> 
    <td>${item.approvePrice}</td>
    <td>${item.processStatus}</td>
    <td>${item.registrationDate}</td>
  </tr>
</c:forEach>
  <tr>
  <th width="5%" height="15%">합계</th>
       <th width="16%"></th>
       <th width="20%"></th>
       <td width="10%">${usePrice}</td>
       <td width="10%">${approvePrice}</td>
       <th width="20%"></th>
       <th width="16%"></th>
  </tr>
</table>
</div> 
<!-- 엑셀 다운로드 -->
<script type="text/javascript">
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "downloadExcelFile";
        f.submit();
    }
    function add(){
    	window.name ="listPage"
        var url="../expense/form";
        window.open(url,"addForm","width=400,height=300,left=600");
    }
    function update(no){
    	window.name ="listPage"
        var url="../expense/detail";
        window.open(url + "?no=" + no,"updateForm","width=400,height=300,left=600");
    }
    function popupClose(form) {
        form.target = opener.name;
        form.submit();
        if (opener != null) {
            opener.insert = null;
            self.close();
        }
    }
</script>
<form id="form1" name="form1" method="post" enctype="multipart/form-data">
    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드</button>
</form>
<div id="add">
<button type="button" onclick="add()">등록</button>
</div>
<!-- 엑셀 다운로드 끝 -->
<a href="../auth/logout">로그아웃</a> 	
</body>
</html>
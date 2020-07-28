<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>   
<jsp:include page="../header.jsp" />

<div class="container mb-5 mt-3">
 <h2>총${size}건</h2>
 <form id="form1" name="form1" method="post" enctype="multipart/form-data">
    <button type="button" onclick="doExcelDownloadProcess()">엑셀다운로드</button>
</form>
<button type="button" onclick="add()">등록</button>
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
<!-- 엑셀 다운로드 -->
<script type="text/javascript">
	$('.mydatatable').DataTable({
		ordering: false,
		searching: false,
		paging: false,
		lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
		createdRow: function(row, data, index) {
			if(data[5].replace() * 1 > 22) {
				$('td', row).eq(5).addClass('text-success');
			}
		}
	});
    function doExcelDownloadProcess(){
        var f = document.form1;
        f.action = "downloadExcelFile";
        f.submit();
    }
    function add(){
    	window.name ="listPage"
        var url="../expense/form";
        window.open(url,"addForm","width=500,height=400,left=600");
    }
    function update(no){
    	window.name ="listPage"
        var url="../expense/detail";
        window.open(url + "?no=" + no,"updateForm","width=800,height=800,left=600");
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
<!-- 엑셀 다운로드 끝 -->


</body>
</html>
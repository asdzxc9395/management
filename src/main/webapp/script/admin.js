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
		var url="../admin/form";
	window.open(url,"addForm","width=500,height=400,left=600");
}
function update(no){
	window.name ="listPage"
		var url="../admin/detail";
	window.open(url + "?no=" + no,"updateForm","width=800,height=800,left=600");
}
function updateExpense(no){
	window.name ="listPage"
		var url="../admin/detailExpense";
	window.open(url + "?no=" + no,"updateExpenseForm","width=800,height=800,left=600");
}
function popupClose(form) {
	form.target = opener.name;
	form.submit();
	if (opener != null) {
		opener.insert = null;
		self.close();
	}
}
function addDiv(no) {
	var url = "logList?no"+"="+no+" #logList";
		$( '#elList' ).load(url);
	}
function addDiv2(no) {
	var url = "expenseList?no"+"="+no+" #expenseList";
	$( '#elList' ).load(url);
}
function addDiv3(no) {
	var url = "expenseDetail?no"+"="+no+" #detailList";
	$( '#elList' ).load(url);
}


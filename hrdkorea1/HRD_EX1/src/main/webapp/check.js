/**
 * 
 */
 function joinCheck(){
	if (frm.custname.value.length ==0 ){
		alert("이름이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	}
	return true;
}
function search(){
	window.location = "list.jsp";
}
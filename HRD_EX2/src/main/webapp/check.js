function addCheck() {
	
	if (document.frm.id.value.length == 0) {
		alert("교과목 코드가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}
	
	if (document.frm.name.value.length == 0) {
		alert("과목명이 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}
	
	if (document.frm.credit.value.length == 0) {
		alert("학점이 입력되지 않았습니다.");
		frm.credit.focus();
		return false;
	}
	
	if (document.frm.lecturer.value.length == 0) {
		alert("담당강사가 입력되지 않았습니다.");
		frm.lecturer.focus();
		return false;
	}
	
	if (document.frm.week.value.length == 0) {
		alert("요일이 입력되지 않았습니다.");
		frm.week.focus();
		return false;
	}
	
	if (document.frm.start_hour.value.length == 0) {
		alert("시작 시간이 입력되지 않았습니다.");
		frm.start_hour.focus();
		return false;
	}
	
	if (document.frm.end_hour.value.length == 0) {
		alert("종료 시간이 입력되지 않았습니다.");
		frm.end_hour.focus();
		return false;
	}
	
	alert("교과목 추가가 완료되었습니다.")
	return true;
}

function search() {
	window.location = "list.jsp";	
}

function modify() {
	
	if (document.frm.id.value.length == 0) {
		alert("교과목 코드가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}
	
	if (document.frm.name.value.length == 0) {
		alert("과목명이 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}
	
	if (document.frm.credit.value.length == 0) {
		alert("학점이 입력되지 않았습니다.");
		frm.credit.focus();
		return false;
	}
	
	if (document.frm.lecturer.value.length == 0) {
		alert("담당강사가 입력되지 않았습니다.");
		frm.lecturer.focus();
		return false;
	}
	
	if (document.frm.week.value.length == 0) {
		alert("요일이 입력되지 않았습니다.");
		frm.week.focus();
		return false;
	}
	
	if (document.frm.start_hour.value.length == 0) {
		alert("시작 시간이 입력되지 않았습니다.");
		frm.start_hour.focus();
		return false;
	}
	
	if (document.frm.end_hour.value.length == 0) {
		alert("종료 시간이 입력되지 않았습니다.");
		frm.end_hour.focus();
		return false;
	}
	
	alert("교과목 수정이 완료되었습니다.")
	return true;
}

function rs() {
	alert("교과목 수정이 취소되었습니다.");
}
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "style.css">
<script src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2> 교과목 추가</h2>
<form method = "post" action = "action.jsp" name = "frm">
<input type = "hidden" name = "mode"  value = "modify.jsp">
<table border = "1">
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String name = "";
String credit = "";
String lecturer = "";
String week = "";
String sh = "";
String eh = "";
try{
	Connection conn = Util.getConnection();
	String sql = "SELECT * FROM course_tbl where id = ?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	ResultSet rs = pstmt.executeQuery();
	if(rs.next()){
		name = rs.getString(2);
		credit = rs.getString(3);
		lecturer = rs.getString(4);
		week = rs.getString(5);
		sh = rs.getString(6);
		eh=rs.getString(7);
	}
}
catch(Exception e){
	e.printStackTrace();
}
%>
	
	<tr><td>과목 코드</td>
		<td><input type = "text" name = "id" value = <%=id %>></td></tr>
	<tr><td>과목명</td>
		<td><input type = "text" name = "name" value= "<%=name %>"></td></tr>
	<tr><td>학점</td>
		<td><input type = "text" name = "credit" value= "<%=credit %>"></td></tr>
	<tr><td>담당강사</td>
		<td><select name = "lecturer" style = "width : 100%">
		<option value = ""> 담당강사 선택</option>
		<option value = "1"> 김교수</option>
		<option value = "2"> 이교수</option>
		<option value = "3"> 박교수</option>
		<option value = "4"> 우교수</option>
		<option value = "5"> 최교수</option>
		<option value = "6"> 임교수</option>
		</select>
		</td></tr>
	<tr><td>요일</td>
		<td>
		<input type = "radio" name = "week" value = "1"> 월
		<input type = "radio" name = "week" value = "2"> 화
		<input type = "radio" name = "week" value = "3"> 수
		<input type = "radio" name = "week" value = "4"> 목
		<input type = "radio" name = "week" value = "5"> 금
		
		</td></tr>
	<tr><td>시작 시간</td>
		<td><input type = "text" name = "sh" value= "<%=sh %>"></td></tr>
	<tr><td>종료 시간</td>
		<td><input type = "text" name = "eh" value= "<%=eh %>"></td></tr>
	<tr>
	<td colspan = "2">
	<input type = "submit" value = "수정" onclick = "return addCheck()">
	<input type = "button" value = "취소" onclick = "return search()">
	&nbsp;&nbsp;&nbsp;
	</td>
	</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<script type="text/javascript" src="check.js"></script>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2 class="title">교과목 추가</h2>
		<form method="post" action="action.jsp" name="frm">
		<input type="hidden" name="mode" value="insert">
		<table border="1" class="insert">
			<tr>
				<td>과목 코드</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<option value="">담당강사선택</option>
						<%
						request.setCharacterEncoding("UTF-8");
						try {
							Connection conn = Util.getConnection();
							String sql = "SELECT * FROM lecturer_tbl";
							
							PreparedStatement pstmt  = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							
							while(rs.next()) {
						%>
						<option value="<%=rs.getInt(1) %>"><%=rs.getString(2) %></option>
						<%
							}
						} catch (Exception e) {
							e.printStackTrace();
						}
						%>
					</select>
				</td>
			</tr>
			<tr>
				<td>요일</td>
				<td>
					<input type="radio" name="week" value="1">월
					<input type="radio" name="week" value="2">화
					<input type="radio" name="week" value="3">수
					<input type="radio" name="week" value="4">목
					<input type="radio" name="week" value="5">금
				</td>
			</tr>
			<tr>
				<td>시작 시간</td>
				<td><input type="text" name="start_hour"></td>
			</tr>
			<tr>
				<td>종료 시간</td>
				<td><input type="text" name="end_hour"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="추가" onClick="return addCheck()">
					<input type="button" value="목록" onClick="return search()">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
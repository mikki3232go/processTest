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
		<h2 class="title">교과목 수정</h2>
		<form method="post" action="action.jsp" name="frm">
		<input type="hidden" name="mode" value="modify">
		<table border="1" class="insert">
		<%
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String name = "";
			String credit = "";
			String lecturer = "";
			String week = "";
			String startHour = "";
			String endHour = "";
			
			try {
				Connection conn = Util.getConnection();
				String sql = "SELECT * FROM course_tbl WHERE id = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				name = rs.getString(2);
				credit = rs.getString(3);
				lecturer = rs.getString(4);
				week = rs.getString(5);
				startHour = rs.getString(6);
				while(startHour.length() < 4) {
					startHour = "0" + startHour;
				}
				endHour = rs.getString(7);
				while(endHour.length() < 4) {
					endHour = "0" + endHour;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
			<tr>
				<td>과목 코드</td>
				<td><input type="text" name="id" value="<%=id %>" readonly></td>
			</tr>
			<tr>
				<td>과목명</td>
				<td><input type="text" name="name" value="<%=name %>"></td>
			</tr>
			<tr>
				<td>학점</td>
				<td><input type="text" name="credit" value="<%=credit %>"></td>
			</tr>
			<tr>
				<td>담당강사</td>
				<td>
					<select name="lecturer">
						<%
						request.setCharacterEncoding("UTF-8");
						try {
							Connection conn = Util.getConnection();
							String sql = "SELECT * FROM lecturer_tbl";
							
							PreparedStatement pstmt  = conn.prepareStatement(sql);
							ResultSet rs = pstmt.executeQuery();
							
							while(rs.next()) {
						%>
						<option value="<%=rs.getInt(1) %>"
						<% if (lecturer.equals(rs.getString(1))) out.println("selected"); %>>
							<%=rs.getString(2) %>
						</option>
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
					<input type="radio" name="week" value="1"
					<% if (week.equals("1")) out.println("checked"); %>>월
					<input type="radio" name="week" value="2"
					<% if (week.equals("2")) out.println("checked"); %>>화
					<input type="radio" name="week" value="3"
					<% if (week.equals("3")) out.println("checked"); %>>수
					<input type="radio" name="week" value="4"
					<% if (week.equals("4")) out.println("checked"); %>>목
					<input type="radio" name="week" value="5"
					<% if (week.equals("5")) out.println("checked"); %>>금
				</td>
			</tr>
			<tr>
				<td>시작 시간</td>
				<td><input type="text" name="start_hour" value="<%=startHour %>"></td>
			</tr>
			<tr>
				<td>종료 시간</td>
				<td><input type="text" name="end_hour" value="<%=endHour %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" onClick="return modify()">
					<input type="reset" value="취소" onClick="return rs()">
				</td>
			</tr>
		</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
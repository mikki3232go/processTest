<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "DBPKG.Util"%>
<%@ page import= "java.sql.*" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "style.css" >
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<section>
<h2>교과목 목록</h2>
<form>
	<table>
		<tr>
		<td>과목코드</td><td>과목명</td><td>학점</td>
		<td>담당강사</td><td>요일</td><td>시작시간</td>
		<td>종료시간</td><td>삭제</td>
		</tr>
<%
	request.setCharacterEncoding("UTF-8");
	
	try{
		Connection con = Util.getConnection();
		String sql =
		"SELECT id, co.name, credit, le.name as lname, week, start_hour, end_hour " +
		"FROM course_tbl co, lecturer_tbl le " +
		"WHERE co.lecturer  = le.idx ORDER BY id";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			
			System.out.println(rs.getString(1));
%>
			
			<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td>삭제</td>
			</tr>
<%
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
	</table>

</form>
		
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
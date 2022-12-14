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
	<table border = "1"> 
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
		"WHERE co.lecuter = le.idx ORDER BY id";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			System.out.println(rs.getString(1));
			String week = rs.getString(5);
			String st = rs.getString(6);
			String et = rs.getString(7);
			
			switch (week){
			case "1":
				week = "월요일";
				break;
			}
			if (st.length()<4) st = "0"+ st;
			st = st.substring(0,2)+"시"+ st.substring(2,4)+"분";
			if (et.length()<4) et = "0"+ et;
			et = et.substring(0,2)+"시"+ et.substring(2,4)+"분";
%>
			
			<tr>
			<td><a href = "modify.jsp?id=<%=rs.getString(1) %>"><%=rs.getString(1)%></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getInt(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=week%></td>
			<td><%=st %></td>
			<td><%=et %></td>
			<td><a href = "action.jsp?id=<%=rs.getString(1) %>&mode=delete">삭제</a></td>
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
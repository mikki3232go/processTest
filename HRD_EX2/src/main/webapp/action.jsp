<%@ page import= "DBPKG.Util" %>
<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String mode = request.getParameter("mode");
	System.out.println("mode:" + mode );	
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String credit = request.getParameter("credit");
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String sh = request.getParameter("sh");
	String eh = request.getParameter("eh");
		
	try{
		Connection conn = Util.getConnection();
		String sql = "";
		PreparedStatement pstmt = null;
		if (mode.equals("insert")){
			System.out.println("insert_OK");	
			sql =	
			"INSERT INTO COURSE_TBL VALUES(?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, credit);
			pstmt.setString(4, lecturer);
			pstmt.setString(5, week);
			pstmt.setString(6, sh);
			pstmt.setString(7, eh);
			pstmt.executeUpdate();
		%>
	<jsp:forward page="insert.jsp"></jsp:forward>
		<%
		}
		else if(mode.equals("modify")) {
			sql ="UPDATE COURSE_TBL SET name =?, credit =?, lecturer = ?,week=?,start_hour =?,end_hour =? "+
				"WHERE id = ?"	;
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, credit);
			pstmt.setString(3, lecturer);
			pstmt.setString(4, week);
			pstmt.setString(5, sh);
			pstmt.setString(6, eh);
			pstmt.setString(7,id);
			pstmt.executeUpdate();
			
		
		%>
		<jsp:forward page="modify.jsp"></jsp:forward>
		
		<%
		}
		else if (mode == "delete"){
			sql = "DELETE * FROM COURSE_TABLE WHERE id = ?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1,id);
			pstmt.executeUpdate();
		%>
		<jsp:forward page="list.jsp"></jsp:forward>
		<%	
		}
		
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href = "style2.css">
<script src = "check.js"></script>
<style>
form table tr{
	margin: 5px 0;
}
form table{
	border:none;
}				 
label{
	float:left;
	width : 200px;
}
input{
	width: 200px;
	
}
input[type=submit],input[type=button]{
	float : left;
	width: 60px;
	margin : 3px
}

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<p></p>
	<h1>홈쇼핑 회원 등록</h1>
	<form method ="post" action ="action.jsp" name = "frm"> <!--"action.jsp" -->
	<input type = "hidden" name="mode" value="insert"></input>
	<table>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement stmt = null;
		String custno = "";
		try{
			conn = Util.getConnection();
			stmt = conn.createStatement();
			String sql = "select max(custno)+1 as custno from tbl_member_202205";
			ResultSet rs = stmt.executeQuery(sql);
			rs.next();
			custno = rs.getString("custno");
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
	 %>
	  <tr><td> 회원번호(자동등록)</td>
	   <td><input type = "text" name="custno" value="<%=custno%>" readonly></input></td></tr>
	   <tr><td><label> 회원성명</label><td>
	   <input type = "text" name="custname" value=""></input></tr>
	   
	   <tr><td><label> 회원전화</label></td>
	   <td><input type = "text" name="phone" value=""></input></td></tr>
	   
	   <tr><td><label> 회원주소</label></td>
	   <td><input type ="text" name="address" value=""></input></td></tr>
	   
	   <tr><td><label> 가입일자</label></td>
	   <td><input type ="text" name="joindate" value=""></input></td></tr>
	   
	   <tr><td><label> 고객등급</label></td>
	   <td><input type = "text" name="grade" value=""></input></td></tr>
	   
	   <tr><td><label> 도시코드</label></td>
	   <td><input type = "text" name="city" value=""></input></td></tr>
		
		</table>
	   <input type = "submit" name="" value="등록" onclick ="return joinCheck()"></input>
	   
	   <input type = "button" name="" value="조회" onclick="return serch()"></input>
	
	</form>
	
	
	
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
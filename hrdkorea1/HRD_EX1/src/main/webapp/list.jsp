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

	<input type = "hidden" name="mode" value="modify"></input>
	<table>
	  <tr>
		  <td> 회원번호</td><td>회원성명</td><td> 전화번호</td><td>주소</td>
		  <td> 가입일자</td><td>고객등급</td><td> 거주지역</td>
	  </tr>
  <%
	// DB 접속, sql변수, form응답변수를 자바 변수에 저장
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	Statement stmt = null;
	String grade ="";
	//try문에 접속 ,sql 생성 실행
	
try{
	conn = Util.getConnection();
	
	String sql = "SELECT * FROM tbl_member_202205 ORDER BY custno" ;
	PreparedStatement pstmt = conn.prepareStatement(sql) ;
	ResultSet rs = pstmt.executeQuery() ;
	                
	  while(rs.next()){
	  String custno = rs.getString("custno");  
	  %>
	  <tr>

        <td><a href="modify.jsp?custno=<%=rs.getString(1) %>"> <%=rs.getString(1) %></a></td>
	  	<td> <%=rs.getString(2) %></td>
	  	<td> <%=rs.getString(3) %></td>
	  	<td> <%=rs.getString(4) %></td>
	  	<td> <%=rs.getString(5) %></td>
	  	<td> <%=rs.getString(6) %></td>
	  	<td> <%=rs.getString(7) %></td>
	 </tr>
	 <% 
	 }
}
catch(Exception e){
			e.printStackTrace();
			
}
	 %>
		</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
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
<script >
function modify(){
	alert("회원정보 수정 완료");
	document.frm2.submit();
}
</script>
<jsp:include page="header.jsp"></jsp:include>
<section>
<p></p>
	<h1>홈쇼핑 회원정보 수정</h1>
	<form method ="post" action ="action.jsp" name = "frm2"> <!--"action.jsp" -->
	<input type = "hidden" name="mode" value="modify"></input>
	<table border ="1" style ="boder-collapse:collapse" >
	<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		String custno = request.getParameter("custno");//
		System.out.println("조회번호" + custno);
		try{
			conn = Util.getConnection();
			String sql = "SELECT * FROM tbl_member_202205 WHERE custno= ? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custno);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
	%>
		
	  <tr><td> 회원번호</td>
	   <td><input type = "text" name="custno" value="<%=custno%>" readonly></input></td></tr>
	   
	   <tr><td><label> 회원성명</label><td>
	   
	   <input type = "text" name="custname" value="<%=rs.getString(2)%>"></input></tr>
	   
	   <tr><td><label> 회원전화</label></td>
	   <td><input type = "text" name="phone" value="<%=rs.getString(3)%>"></input></td></tr>
	   
	   <tr><td><label> 회원주소</label></td>
	   <td><input type ="text" name="address" value="<%=rs.getString(4)%>"></input></td></tr>
	   
	   <tr><td><label> 가입일자</label></td>
	   <td><input type ="date" name="joindate" value="<%=rs.getString(5)%>"></input></td></tr>
	   
	   <tr><td><label> 고객등급</label></td>
	   <td><input type = "text" name="grade" value="<%=rs.getString(6)%>"></input></td></tr>
	   
	   <tr><td><label> 도시코드</label></td>
	   <td><input type = "text" name="city" value="<%=rs.getString(7)%>"></input></td></tr>
	   <%
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
	 %>
		</table>
	   <input type = "submit" name="" value="수정" onclick ="return modify()"></input>
	   
	   <input type = "button" name="" value="조회" onclick="window.location='list.jsp'"></input>
	
	</form>
	
	
	
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
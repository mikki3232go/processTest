<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    
    <section>
        <h2><b>홈쇼핑 회원 등록</b></h2><br>
        <form method="post" action="action.jsp" name="frm">  	
			<input type="hidden"  name="mode" value="insert">
            <table>
            <%
            //한글로 입력받을 때
            request.setCharacterEncoding("UTF-8"); //request웹 브라우저에서 JSP 페이지로 전달되는 정보의 모임
            Connection conn = null;
            Statement stmt = null;
            String custno = "";
            try{
            	conn = Util.getConnection();
            	stmt = conn.createStatement();	//sql 실행하기 위한 변수
            	String sql = "select max(custno)+1 as custno from tbl_member_202205";
            	ResultSet rs =stmt.executeQuery(sql);
            	rs.next();
            	custno = rs.getString("custno");
            	
            } catch(Exception e){
            	e.printStackTrace();
            }
            %>
                
            <tr>
                <td>회원번호(자동등록)</td>
                <td><input type="text" name="custno" value = "<%=custno %>" readonly></td>
            </tr>
            <tr>
                <td>회원성명</td>
                <td><input type="text" name="custname"></td>
            </tr>
            <tr>
                <td>회원전화</td>
                <td><input type="text" name="phone"></td>
            </tr>
            <tr>
                <td>회원주소</td>
                <td><input type="text" name="address"></td>
            </tr>
            <tr>
                <td>가입일자</td>
                <td><input type="text" name="joindate"></td>
            </tr>
            <tr>
                <td>고객등급[A:VIP, B:일반, C:직원]</td>
                <td><input type="text" name="grade"></td>
            </tr>
            <tr>
                <td>도시코드</td>
                <td><input type="text" name="city"></td>
            </tr>
            <tr>
                <td colspan="2">
                <input type="submit" value="등록" onclick="return joinCheck()">
                <input type="button" value="조회" onclick="return search()">
                </td>
            </tr>
            </table>
        </form>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
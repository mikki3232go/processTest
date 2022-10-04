<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript" src="check.js"></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
   
    <section>
        <h2><b>홈쇼핑 회원 등록</b></h2><br>
        <form method="post" action="action.jsp" name="" id="frm">  	
			<input type="hidden"  name="mode" value="insert">
            <table>
            <tr>
                <td>회원번호(자동등록)</td>
                <td>회원성명</td>
                <td>고객등급</td>
                <td>매출</td>
            </tr>
             <%
            //한글로 입력받을 때
            request.setCharacterEncoding("UTF-8");
            Connection conn = null;
            Statement stmt = null;
            String custno = "";
            String grade = "";
            String name = "";
            String price = "";
            try{
            	conn = Util.getConnection();
            	stmt = conn.createStatement();	//sql 실행하기 위한 변수
            	String sql =  "select me.custno,me.custname,me.grade,sum(price) price " +
            			      "from tbl_member_202205 me,tbl_money_202205 mo " +
            				  "where me.custno = mo.custno " +
            				  "group by me.custno, me.custname, me.grade "+ //select절과 똑같아야 한다.
            				  "order by sum(mo.price) desc";
            	ResultSet rs =stmt.executeQuery(sql);
            	while(rs.next()){
            		grade = rs.getString("grade");
            	 	custno = rs.getString("custno") ;
                	name =rs.getString("custname") ;
                	price =rs.getString("price");
            		switch(grade){
            		case "A":
            			grade = "VIP";
            			break;
            		case "B":
            			grade = "일반";
            			break;
            		case "C":
            			grade = "직원";
            			break;
            		}
            	
            %>
            <tr>
            	<td><%=custno %> </td>
            	<td><%=name %> </td>
            	<td><%=grade %> </td>
            	<td><%=price %> </td>
            </tr>
<% 
      } //while 문 
            	            	
            } catch(Exception e){
            	e.printStackTrace();
            }
%>
            </table>
        </form>
    </section>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
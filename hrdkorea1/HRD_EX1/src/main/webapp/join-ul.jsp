<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" href = "style2.css">
<style>
form ul li{
	margin: 5px 0;
}
form ul{
	list-style:none;
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
	<form method ="post" action = "action.jsp" name = frm>
	
	<ul>
	  <li><label> 회원번호(자동등록)</label>
	   <input type = "text" name="" value=""></input></li>
	   <li><label> 회원성명</label>
	   <input type = "text" name="" value=""></input></li>
	   <li><label> 회원전화</label>
	   <input type = "text" name="" value=""></input></li>
	   <li><label> 회원주소</label>
	   <input type = "text" name="" value=""></input></li>
	   <li><label> 가입일자</label>
	   <input type = "text" name="" value=""></input></li>
	   <li><label> 고객등급</label>
	   <input type = "text" name="" value=""></input></li>
		<p></p>
		</ul>
	   <input type = "submit" name="" value="등록"></input>
	   
	   <input type = "button" name="" value="조회"></input>
	
	</form>
	
	
	
</section>
<jsp:include page="footer.jsp"></jsp:include>

</body>

</html>
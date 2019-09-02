<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn=null;
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String user = "hospital";
	String pass = "1234";	
	
	try{
   		Class.forName("oracle.jdbc.driver.OracleDriver");
   		conn = DriverManager.getConnection(url,user,pass);
   		out.println("연결성공");
   		conn.close();
	}catch(Exception e){
   		out.println("연결실패");
   		e.printStackTrace();
}
%>
</body>
</html>
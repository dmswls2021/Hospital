<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pnum = request.getParameter("pnum1") + "-" + request.getParameter("pnum2");
	String tel = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
 	String address = request.getParameter("address");
	
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hospital";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "insert into patient values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pnum);
		pstmt.setString(2, name);
		pstmt.setString(3, tel);
		pstmt.setString(4, address);
    	pstmt.executeUpdate();
    
    	out.println("<script>");
       	out.println("alert('등록 되었습니다.')");
       	out.println("location.href='index.jsp'");
       	out.println("</script>");
       	
 	}catch(Exception e){
    	e.printStackTrace();    
 		
    	out.println("<script>");
   		out.println("alert('등록에 실패했습니다.')");
   		out.println("location.href='join.jsp'");
   		out.println("</script>");
 	}finally{
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>
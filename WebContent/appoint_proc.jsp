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
	String date = 
			request.getParameter("year") + "/" + 
			request.getParameter("month") + "/" + 
			request.getParameter("day") + " " + 
			request.getParameter("time") + ":00:00";
	
	
	
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	ResultSet rs = null;
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hospital";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "select * from doctor where name = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
    	rs = pstmt.executeQuery();
    	
    	
    	
 	}catch(Exception e){
    	e.printStackTrace();    
 		
    	out.println("<script>");
   		out.println("alert('정보를 불러오는데 실패했습니다.')");
   		out.println("location.href='index.jsp'");
   		out.println("</script>");
 	}finally{
 		try{rs.close();}catch(Exception e){}
 		try{pstmt.close();}catch(Exception e){}
 		try{conn.close();}catch(Exception e){}
 	}
%>
</body>
</html>
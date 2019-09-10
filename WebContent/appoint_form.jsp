<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
</head>
<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">진료 예약</font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="join_proc.jsp" name="appoint" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">주민등록번호</td>
                    <td class="ltext">
                        <input type="text" name="pnum1" maxlength="6"> - <input type="text" name="pnum2" maxlength="7">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">담당의</td>
                    <td class="lltext">
                        <select name="name" style="width: 200px;">
<%
 	request.setCharacterEncoding("UTF-8");
	
 	Connection conn=null; //DB연결
 	PreparedStatement pstmt=null; //SQL문
 	ResultSet rs = null;
 
 	try{
		String url="jdbc:oracle:thin:@localhost:1521:xe";
		String user="hospital";
		String password="1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, password);
	
		String sql = "select name from doctor";
		pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();   
    	while(rs.next()){
%>
			<option value=<%= rs.getString("name") %>>
				<%= rs.getString("name") %>
			</option>
<%    	}
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
                        </select>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="예약" class="btn"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소" onclick="location.href='index.jsp'" class="btn">
        </form>
    </div>
</body>
</html>
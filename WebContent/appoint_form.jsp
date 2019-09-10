<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script>
var today = new Date();

function checkValue(){
	var day = document.appoint.year.value + document.appoint.month.value + document.appoint.day.value;
	if(!document.appoint.pnum1.value){
        alert("주민등록번호를 입력하세요.");
        return false;
    }
    
    if(!document.appoint.pnum2.value){
        alert("주민등록번호를 입력하세요.");
        return false;
    }
    
    if(day <= today){
        alert("오늘 이후의 날짜로 예약해주세요");
        return false;
    }
    
    var pnum = parseInt(document.appoint.pnum2.value);
	
    if(pnum >= 5000000){
        alert("주민등록번호를 확인하세요.");
        return false;
    }
}
</script>
</head>
<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">진료 예약</font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="appoint_proc.jsp" name="appoint" onsubmit="return checkValue()">
            <table>
                <tr>
                    <td id="title">주민등록번호</td>
                    <td class="ltext">
                        <input type="text" name="pnum1" maxlength="6"> - <input type="text" name="pnum2" maxlength="7">
                    </td>
                </tr>
                <tr>
                    <td id="title">예약일</td>
                    <td class="text">
               			<%
               				Calendar cal = Calendar.getInstance();
               		 
               				//현재 년도, 월, 일
               				int year = cal.get ( cal.YEAR );
               			%>
                        <select name="year">
                        	<option value="<%= year %>"> <%= year %> </option>
                        	<option value="<%= year + 1 %>"> <%= year + 1 %> </option>
                        </select>년
                        
                        <select name="month">
                        	<% 
                        		int i = 1;
                        	%>
                    			<option value="<%= i %>"> <%= i %> </option>
                    		<%
                        		while(i < 12){
                        	%>
                        		<option value="<%= i + 1 %>"> <%= i + 1 %> </option>
                        	<%	
                        			i++;
                        		}	%>
                        </select>월
                        
                        <select name="day">
                        	<% 
                        		int j = 1;
                        	%>
                    			<option value="<%= j %>"> <%= j %> </option>
                    		<%
                        		while(j < 31){
                        	%>
                        		<option value="<%= j + 1 %>"> <%= j + 1 %> </option>
                        	<%
                        			j++;
                        		}	%>
                        </select>일
                        
                        <select name="time">
                        	<% 
                        		int t = 9;
                        	%>
                    			<option value="<%= t %>"> <%= t %> </option>
                    		<%
                        		while(t < 22){
                        	%>
                        		<option value="<%= t + 1 %>"> <%= t + 1 %> </option>
                        	<%
                        			t++;
                        		}	%>
                        </select>시
                    </td>
                </tr>
<script>
function d(){
	var day = document.appoint.year.value + document.appoint.month.value + document.appoint.day.value;
	var week = ['일', '월', '화', '수', '목', '금', '토'];
	var dayOfWeek = week[new Date(day).getDay()];
	console.log(dayOfWeek);
}

function init() {
	d();
	setInterval(d, 3000);
}

init();
</script>
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
	
		String sql = "select * from doctor";
		pstmt = conn.prepareStatement(sql);
    	rs = pstmt.executeQuery();   
    	
    	while(rs.next()){
    		String wdate = rs.getString("work_date");
    		String date[] = wdate.split("/");
    		
    		for(int d=0;d<date.length;d++){
    			
    		}
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
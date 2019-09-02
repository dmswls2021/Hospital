<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String contentPage = request.getParameter("CONTENTPAGE");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 접수</title>
<style type="text/css">
.temp{
	height: 98%;
	width: 100%;
}

.temp td{
	border: none;
}
</style>
</head>
<body>
<table class="temp">
	<tr>
		<td width="20%">
			<jsp:include page="side.jsp"/>
		</td>
		<td width="85%">
			<jsp:include page="<%= contentPage %>" flush="false"/>
		</td>
	</tr>
</table>
</body>
</html>
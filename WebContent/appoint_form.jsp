<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">진료 예약</font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="join_proc.jsp" name="userInfo" onsubmit="return checkValue()">
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
                        <select>
                        	
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td id="title">주소</td>
                    <td class="text">
                        <input type="text" name="address" maxlength="50">
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="가입" class="btn"/> &nbsp;&nbsp;&nbsp; <input type="button" value="취소" onclick="location.href='index.jsp'" class="btn">
        </form>
    </div>
</body>
</html>
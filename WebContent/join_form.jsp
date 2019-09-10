<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="table.css">
<script type="text/javascript">
    // 필수 입력정보인 아이디, 비밀번호가 입력되었는지 확인하는 함수
	function checkValue()
    {        
        if(!document.userInfo.name.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.pnum1.value){
            alert("주민등록번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.pnum2.value){
            alert("주민등록번호를 입력하세요.");
            return false;
        }
        
        var pnum = parseInt(document.userInfo.pnum2.value);
    	
        if(pnum >= 5000000){
            alert("주민등록번호를 확인하세요.");
            return false;
        }
        if(!document.userInfo.tel1.value){
            alert("전화번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.tel2.value){
            alert("전화번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.tel3.value){
            alert("전화번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.address.value){
            alert("주소를 입력하세요.");
            return false;
        }
    }
</script>
</head>
<body>
	<div id="wrap">
        <br><br>
        <b><font size="6" color="gray">회원등록</font></b>
        <br><br><br>
        <!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
        <!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 join_proc.jsp -->
        <form method="post" action="join_proc.jsp" name="userInfo" onsubmit="return checkValue()">
            <table >                
                <tr>
                    <td id="title">이름</td>
                    <td class="text">
                        <input type="text" name="name" maxlength="5">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">주민등록번호</td>
                    <td class="ltext">
                        <input type="text" name="pnum1" maxlength="6"> - <input type="text" name="pnum2" maxlength="7">
                    </td>
                </tr>
                
                <tr>
                    <td id="title">전화번호</td>
                    <td class="lltext">
                        <input type="text" name="tel1" maxlength="3"> - <input type="text" name="tel2" maxlength="4"> - <input type="text" name="tel3" maxlength="4">
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
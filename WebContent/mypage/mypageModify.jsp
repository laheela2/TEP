<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript">
function check(){
	 var join=document.userinput

	    if(join.m_name.value==""){
	    	alert("이름을 입력해주세요");
	    	join.m_name.focus();
	    	return false;
	    }
	    else if(join.m_nickname.value==""){
	    	alert("닉네임을 입력해주세요");
	    	join.m_nickname.focus();
	    	return false;
	    }
	    else if(join.m_password.value==""){
	    	alert("비밀번호를 입력해주세요");
	    	join.m_password.focus();
	    	return false;
	    }
	    else if(join.m_phone.value==""){
	    	alert("핸드폰 번호를 입력해주세요");
	    	join.m_phone.focus();
	    	return false;
	    }

	    if(userinput.m_password.value.length < 4){
	    	alert("최소 4자리 이상 입력해주세요!");
	    	userinput.m_password.value= "";
	   	 	userinput.m_password.focus();
	   	 	return false;
	  	}
	    
		var f=document.userinput;
		f.submit();
}
</script>

</head>
<body>
<table align="center" width="834" border="0" cellspacing="0" cellpadding="0">

	<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;회원 탈퇴</strong></td>
	</tr>

</table>
<br>
<form action="modifyMember.action" name="userinput" method="post">
<table align="center" width="390" border="0" cellspacing="0" cellpadding="0">

	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>ID</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;${session.session_m_email }
		<s:hidden name="id" value="%{session.session_m_email }"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>비밀번호</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;<input type="password" name="m_password" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>비밀번호 확인</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
			&nbsp;&nbsp;<input type="password" name="m_password1" maxlength="20"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>이름</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_name" theme="simple" value="%{resultClass.m_name}" maxlength="40"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
		
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="e9e9e9" width="135"><font size="2"><strong>닉네임</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_nickname" theme="simple"  value="%{resultClass.m_nickname}" maxlength="13"/><!--  -->
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>핸드폰 번호</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_phone" theme="simple" value="%{resultClass.m_phone}" maxlength="13"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>소속</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_company" theme="simple" value="%{resultClass.m_company}" maxlength="13"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>선호 지역</strong></font></td>
		<td width="255" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_fav_area" theme="simple" value="%{resultClass.m_fav_area}" maxlength="70"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" bgcolor="#e9e9e9" width="135"><font size="2"><strong>선호 분야</strong></font></td>
		<td width="300" bgcolor="#FFFFFF">
		&nbsp;&nbsp;<s:textfield name="m_fav_field" theme="simple" value="%{resultClass.m_fav_field}" maxlength="70"/>
		</td>
	</tr>
	
	<tr bgcolor="#888888">
		<td height="1" colspan="2"></td>
	</tr>
	
</table>

<br>
<br>

<table align="center" width="385" border="0" cellspacing="0" cellpadding="0">
	
	<tr>
		<td align=center>
			<input type="reset" value="리셋" class="inputb"/>
			<input type="button" value="수정" onclick="check()">
		</td>
	</tr>
	
</table>
</form>
</body>
</html>
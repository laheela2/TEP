<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style type="text/css">
table.board{
	width: 900px;
	text-align: center;
}
table.board td{
	padding:5px;
}
tr.board_head_tr{
	background-color: #FFEDED;
	font-family: sans-serif;
	font-size: small;
	font-weight: bold;
}
tr.board_head_tr td{
	border-top: 3px solid red;
	border-bottom: 0.5px solid red;
	height: 30px;
}
td.board_subject{
	text-align: left;
	padding-left:5px;
}
td.board_subject a{
	text-decoration: none;
	color: gray;
}
td.board_subject a:HOVER{
	color: red;
}
tr.board_content_tr{
	font-family: sans-serif;
	font-size: small;
	color: gray;
}
tr.board_content_tr td{
	border-bottom: 0.3px solid red;
	height: 25px;
}
font.board_subject_kind{
	color: red;
	font-family: sans-serif;
	font-size: x-small;
	padding-right:5px;
}
</style>
</head>
<body>
<table class="board" align=center cellspacing=0>
<tr class="board_head_tr">
<td>번호</td>
<td>카테고리</td>
<td width="55%">제목</td>
<td>작성자</td>
<td>등록일</td>
</tr>

<s:iterator value="list" status="stat">
	<s:url id="boardHelpDetailURL" action="boardHelpDetail2">
		<s:param name="bh_no">
			<s:property value="bh_no"/>
		</s:param>
	</s:url>
	<tr class="board_content_tr">
	<td><s:property value="bh_no"/></td>
	<td><s:property value="bh_category1"/></td>
	<td class="board_subject">
		<s:a cssClass="" href="%{boardHelpDetailURL}">
		<s:property value="bh_subject"/>
		</s:a>
	</td>
	<td><s:property value="bh_name"/></td>
	<td><s:date name="bh_date" format="yyyy.MM.dd"/></td>
	</tr>
</s:iterator>

<s:if test="list.size() <= 0">
	<tr>
	<td colspan="5" align="center"><h3>등록된 게시물이 없습니다.</h3></td>
	</tr>
</s:if>

<!-- 페이징 -->
<tr>
<td colspan="5" width="100%" align="center" style="padding-top:20px;padding-bottom:10px">
<s:property value="pagingHtml" escape="false"/>
<s:if test="#session.session_m_email != null">
<input type="button" value="글쓰기" onclick="location.href='helpWriteForm.action'"  style="float:right;margin-top: -6px;">
</s:if>
</td>
</tr>

<!-- 게시판 검색 -->
<tr>
<td colspan="5" align="center">
	<form method="post" action="boardHelp.action">
		<table>
		<tr>
		<td>
		<select name="searchKey">
			<option value="0" selected="selected">제목</option>
			<option value="1">제목+내용</option>
			<option value="2">작성자</option>
		</select>
		</td>
		<td><input type="text" name="searchWord" size="15" maxlength="50" /></td>
		<td><input type="submit" value="검색" /></td>
		</tr>
		</table>
	</form>
</td>
</tr>

</table>
</body>
</html>
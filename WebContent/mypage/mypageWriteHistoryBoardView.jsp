<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/TEP/static/css/root.css" type="text/css">
<style type="text/css">

table.board {
	width: 920px;
	text-align: center;
	margin-right:6px;
}

table.board td {
	padding: 5px;
}

tr.board_head_tr {
	background-color: #FFEDED;
	font-family: sans-serif;
	font-size: small;
	font-weight: bold;
}

tr.board_head_tr td {
	border-top: 3px solid red;
	border-bottom: 0.5px solid red;
	height: 25px;
}



/* 					
					
					a{
						text-decoration: none;
						color:gray;
					}
					a:HOVER{
						color: red;
					}
 */


tr.board_content_tr{
	font-family: sans-serif;
	font-size: small;
	color: gray;
}
 tr.board_content_tr td{
	border-top: 0.1px solid red;
	border-bottom: 0.8px solid red;
	height: 10px;
} 

tr.board_content_tr td{
	text-align: center;
	padding-left:5px;
}

				tr.board_content_tr a{
					text-decoration: none;
					color: gray;
				}
				tr.board_content_tr a:HOVER{
					color: red;
				}



</style>
</head>

<body>
	<br>
	<table align="center" width="834" border="0" cellspacing="0"
		cellpadding="0">

		<tr height="25">
			<td bgcolor="#FF2929" align="left" colspan="1" width="10"></td>
			<td align="left" colspan="3"><strong>&nbsp;&nbsp;게시판</strong></td>
		</tr>

	</table>
	<br>
	<table class="board" align=center cellspacing=0>
		<tr class="board_head_tr">
			<td>번호</td>
			<td width="55%">제목</td>
			<td>작성자</td>
			<td>등록일</td>
			<td>조회수</td>
	
		</tr>


		<s:iterator value="Blist" status="stat">
			<s:url id="boardDetailURL" action="boardDetail">
					<s:param name="b_no">
						<s:property value="b_no" />
					</s:param>
				</s:url>
				<tr class="board_content_tr">
				
				<td><s:property value="b_no" /></td>

				<td><s:a href="%{boardDetailURL}">
						<s:property value="b_subject" />
					</s:a></td>

				<td><s:property value="b_name" /></td>
				<td><s:date name="b_date" format="yyyy.MM.dd" /></td>
				<td><s:property value="b_readcount" /></td>
			</tr>
		</s:iterator>

		<s:if test="Blist.size() <= 0">
			<tr>
				<td colspan="5" align="center"><h3>등록된 게시물이 없습니다.</h3></td>
			</tr>
		</s:if>

		<!-- 페이징 -->
		<tr>
			<td colspan="5" width="100%" align="center" style="padding-top:20px;padding-bottom:10px">
		<s:property value="pagingHtml" escape="false" /></td>
		</tr>


		<!-- 게시판 검색 -->
		<tr>
			<td colspan="5" align="center">
				<form method="post" action="writeHistoryBoard.action">
					<table>
						<tr>
							<td><select name="searchKeyB">
									<option value="0" selected="selected">제목</option>
									<option value="1">제목+내용</option>
									<!-- <option value="2">작성자</option> -->
							</select></td>
							<td><input type="text" name="searchWordB" size="15"
								maxlength="50" /></td>
							<td><input type="submit" value="검색" /></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>

	</table>
</body>
</html>
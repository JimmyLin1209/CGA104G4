<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.store.model.*"%>

<%
StoreService storeSvc = new StoreService();
List<StoreVO> list = storeSvc.getAll();
pageContext.setAttribute("list", list);
%>



<html>
<head>
<title>所有店家資料</title>

<style>
table#table-1 {
	background-color: lightyellow;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	word-break: keep-all;
	word-wrap: break-word;
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>所有店家資料</h3>
				<h4>
					<a href="select_page.jsp">回首頁</a>
				</h4>
			</td>
		</tr>
	</table>

	<table>
		<tr>
			<th>會員編號</th>
			<th>會員帳號</th>
			<th>會員密碼</th>
			<th>會員名稱</th>
			<th>會員統編</th>
			<th>負責人</th>
			<th>店家電話</th>
			<th>店家傳真</th>
			<th>店家地址</th>
			<th>聯絡人</th>
			<th>聯絡人電話</th>
			<th>聯絡人地址</th>
			<th>店家信箱</th>
			<th>修改</th>
			<th>刪除</th>
		</tr>
		<%@ include file="page1.file"%>
		<c:forEach var="storeVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<tr>
				<td>${storeVO.storeId}</td>
				<td>${storeVO.storeAcc}</td>
				<td>${storeVO.storePwd}</td>
				<td>${storeVO.storeName}</td>
				<td>${storeVO.storeGui}</td>
				<td>${storeVO.storeRep}</td>
				<td>${storeVO.storeTel}</td>
				<td>${storeVO.storeFax}</td>
				<td>${storeVO.storeAd}</td>
				<td>${storeVO.storeCon}</td>
				<td>${storeVO.storeConTel}</td>
				<td>${storeVO.storeConAd}</td>
				<td>${storeVO.storeEmail}</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/store/store.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="storeId" value="${storeVO.storeId}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/store/store.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="刪除"> <input type="hidden"
							name="storeId" value="${storeVO.storeId}"> <input
							type="hidden" name="action" value="delete">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>
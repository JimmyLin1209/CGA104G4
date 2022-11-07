<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.orders.model.*"%>
<html>
<head>
<title>訂單管理</title>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
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

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td><h3>訂單管理</h3></td>
		</tr>
	</table>

	<h3>歷史訂單查詢:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href="listAllOrders.jsp">歷史訂單列表</a><br>
		<br></li>

		<li>
			<FORM METHOD="post" ACTION="orders.do">
				<b>輸入訂單編號 (如1):</b> <input type="text" name="ordId"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="ordersSvc" scope="page"
			class="com.orders.model.OrdersService" />

		<li>
			<FORM METHOD="post" ACTION="orders.do">
				<b>選擇訂單編號:</b> <select size="1" name="ordId">
					<c:forEach var="ordersVO" items="${ordersSvc.all}">
						<option value="${ordersVO.ordId}">${ordersVO.ordId}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>


	<h3>訂單管理</h3>

	<ul>
		<li><a href='addOrders.jsp'>新增一筆訂單</a></li>
	</ul>

</body>
</html>
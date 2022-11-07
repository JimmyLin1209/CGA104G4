<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.orders.model.*"%>


<%
	OrdersVO ordersVO = (OrdersVO) request.getAttribute("ordersVO");
%>

<html>
<head>
<title>訂單資料 - listOneOrders.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
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
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
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
	<tr><td>
		 <h3>訂單資料 - ListOneOrders.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>商家編號</th>
		<th>結帳金額</th>
		<th>訂單狀態</th>
		<th>訂單成立日期</th>
		
	</tr>
	<tr>
		<td><%=ordersVO.getOrdId()%></td>
		<td><%=ordersVO.getMemId()%></td>
		<td><%=ordersVO.getStoreId()%></td>
		<td><%=ordersVO.getOrdAmt()%></td>
		<td><%=ordersVO.getOrdStat()%></td>
		<td><%=ordersVO.getOrdTime()%></td>
		
	</tr>
</table>

</body>
</html>
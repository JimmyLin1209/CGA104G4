<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.detail.model.*"%>

<jsp:useBean id="ordersSvc" scope="page" class="com.orders.model.OrdersService" />

<html>
<head><title>�Ҧ��q�� - listAllOrders.jsp</title>

<style>
  table#table-1 {
	background-color: orange;
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
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body>

<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��q�� - listAllOrders.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th>�Ӯa�s��</th>
		<th>�q����B</th>
		<th>�q�檬�A</th>
		<th>�q�榨�߮ɶ�</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�߭q�����</th>
	</tr>
	
	<c:forEach var="ordersVO" items="${ordersSvc.all}">
		<tr>
			<td>${ordersVO.ordId}</td>
			<td>${ordersVO.memId}</td>
			<td>${ordersVO.storeId}</td>
			<td>${ordersVO.ordAmt}</td>
			<td>${ordersVO.ordStat}</td>
			<td>${ordersVO.ordTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orders/orders.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"   disabled="disabled"> 
			    <input type="hidden" name="ordId" value="${ordersVO.ordId}">
			    <input type="hidden" name="action" value="getOne_For_Update_Orders"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orders/orders.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="ordId" value="${ordersVO.ordId}">
			    <input type="hidden" name="action" value="delete_Orders"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orders/orders.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="ordId" value="${ordersVO.ordId}">
			    <input type="hidden" name="action" value="listDetails_ByOrdId_B"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listDetails_ByOrdId")!=null){%>
       <jsp:include page="listDetails_ByOrdId.jsp" />
<%} %>

</body>
</html>
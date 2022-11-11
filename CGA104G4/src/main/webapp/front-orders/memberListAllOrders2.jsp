<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<table id="table-1">
	<tr><td>
		<h3>�q���T</h3>
		<FORM><input type="hidden" name="action" value="listOrders_ByMemId"></FORM>
	</td></tr>
</table>
<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���m�W</th>
		<th>�q��s��</th>
		<th>�Ӯa�s��</th>
		<th>�Ӯa�W��</th>
		<th>�q����B</th>
		<th>�q�榨�߮ɶ�</th>
		<th>�q�檬�A</th>
		<th>�ӽЫȶD</th>
		<th>�d�߭q�����</th>
	</tr>
	<c:forEach var="ordersVO" items="${ordersSvc.getOrdersByMemId(memId)}">
		<tr>
			<td>${ordersVO.memId}</td>
			<td>${ordersVO.memberVO.memName}</td>
			<td>${ordersVO.ordId}</td>
			<td>${ordersVO.storeId}</td>
			<td>${ordersVO.storeVO.storeName}</td>
			<td>${ordersVO.ordAmt}</td>
			<td>${ordersVO.ordTime}</td>
			<td>
				<c:if test="${ordersVO.ordStat==0}">���b���ݰӮa����</c:if>
				<c:if test="${ordersVO.ordStat==1}">�Ӯa�w����A�q��ǳƤ�</c:if>
				<c:if test="${ordersVO.ordStat==2}">�q��w�Ƨ��A�Ыe�����</c:if>
				<c:if test="${ordersVO.ordStat==3}">�q��w����</c:if>
				<c:if test="${ordersVO.ordStat==4}">�q��w����</c:if>
				<c:if test="${ordersVO.ordStat==5}">�ȶD�B�z��</c:if>
			</td>
			<td>
			   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orders/orders.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ӽЫȶD"> 
			    <input type="hidden" name="ordId" value="${ordersVO.ordId}">
			    <input type="hidden" name="ordStat" value="5">
			    <input type="hidden" name="action" value="updateOrdStat_B"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/orders/orders.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�q�����"> 
			    <input type="hidden" name="ordId" value="${ordersVO.ordId}">
			    <input type="hidden" name="action" value="listDetails_ByOrdId_B"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listDetails_ByOrdId")!=null){%>
       <jsp:include page="memberListDetails_ByOrdId.jsp" />
<%} %>
</body>
</html>
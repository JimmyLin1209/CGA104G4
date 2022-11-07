<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.detail.model.*"%>

<jsp:useBean id="listDetails_ByOrdId" scope="request" type="java.util.Set<DetailVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="ordersSvc" scope="page" class="com.orders.model.OrdersService" />


<html>
<head><title>�q����� - listDetails_ByOrdId.jsp</title>

<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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
<body bgcolor='white'>

<table id="table-2">
	<tr><td>
		 <h3>�q����� - listDetails_ByOrdId.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~�ƶq</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~���</th>
		<th>�q��s��</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	
	<c:forEach var="detailVO" items="${listDetails_ByOrdId}" >
		<tr ${(detailVO.prodId==param.prodId) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����-->
			<td>${detailVO.prodId}</td>
			<td>${detailVO.prodQty}</td>
			<td>${detailVO.prodVO.prodName}</td>
			<td>${detailVO.prodVO.prodPrc}</td>
			<td>${detailVO.ordId}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/detail/detail.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="prodId"      value="${detailVO.prodId}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/detail/detail.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="prodId"      value="${detailVO.prodId}">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"     value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lucky.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  LuckyVO luckyVO = (LuckyVO) request.getAttribute("luckyVO"); //LuckyServlet.java(Concroller), �s�Jreq��luckyVO����
%>

<html>
<head>
<title>�ֳU��� - listOneLucky.jsp</title>

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

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�ֳU��� - ListOneLucky.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�ֳU�s��</th>
		<th>�Ӯa�s��</th>
		<th>�ֳU���A</th>
		<th>�ֳU�W��</th>
		<th>�ֳU���e</th>
		<th>�ֳU����</th>
		<th>�W�[���</th>
	</tr>
	<tr>
		<td><%=luckyVO.getLuckyId()%></td>
		<td><%=luckyVO.getStoreId()%></td>
		<td><%=luckyVO.getLkStat()%></td>
		<td><%=luckyVO.getLkName()%></td>
		<td><%=luckyVO.getLkCont()%></td>
		<td><%=luckyVO.getLkPrc()%></td>
		<td><%=luckyVO.getLkTime()%></td>
	</tr>
</table>

</body>
</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lucky.model.*"%>

<%
	LuckyVO luckyVO = (LuckyVO) request.getAttribute("lucky");
	String storeName = "�����ѥ]"; //���g�����եΡA�����ɧR��***************************************************************�o�̭n��I
%>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
<% 
  java.sql.Date lkTime = null;
  try {
	    lkTime = luckyVO.getLkTime();
   } catch (Exception e) {
	   lkTime = new java.sql.Date(System.currentTimeMillis());
   }
%>
<!-- =========================================�H�W�� datetimepicker �������]�w========================================== -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�s�W�ֳU</title>

<meta charset="UTF-8">
<!-- �T�������� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- GOOGLEFONT -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap">

<!-- �U���O�o�ӼҪO�ݭn��css�Фŧ�� �Y���ƪ��ݭn�Ъ����g�s��css�\�L�h�N�i�H�F -->
<link rel="stylesheet" type="text/css" href="../resources/css/all.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/animate.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="../resources/css/slick-theme.css">
<link rel="stylesheet" type="text/css" href="../resources/css/flaticon.css">
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
<link rel="stylesheet" type="text/css" href="../resources/css/nav.css">
    
<!-- �w�g�w���Jjquery�F���ݭnjquery�i�H�����ϥ� -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<!-- �бN�л\�Ϊ�css��m�����ѤU�� -->
<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/resources/css/jquery.datetimepicker.css />

<style>
.btn-secondary {
	color: #fff;
	background-color: #6c757d;
	border: 1px solid #6c757d;
	border-radius: 5px;
}

.btn-secondary:hover {
	color: #fff;
	background-color: #5c636a;
	border: 1px solid #6c757d;
	border-radius: 5px;
}

table tr td:nth-of-type(odd) {
	display: block;
	padding-left: 20px;
	background: #35544E;
	color: white;
	font-size: 14px;
	line-height: 35px;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
	margin-bottom: 10px;
}

.table tr td input {
/* 	display: block; */
	background: white;
	border: 3px solid #35544E;
	border-left: 1;
	border-radius: 0 2px 2px 0;
	box-shadow: none;
	margin: 0;
	width: 100%;
	color: #35544E;
	margin-bottom: 10px;
	line-height: 27px;
}

.table {
	width: 50%;
	height: auto;
	margin: 2% auto;
	padding: 30px 90px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	background: white;
}

#table-1 {
	margin: auto;
}

#table-1 h1, h4 {
	font-family: '�L�n������';
	color: black;
	font-weight: bolder;
}

#table-1 td {
	width: 39vw;
	text-align: center;
	background-color: #F0F0F0;
	margin: 2% auto;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	padding: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
}

#table-1 a {
	color: #5c636a;
	display: inline;
	text-decoration: none;
}

.radio-container .input {
	width: 5%;
}

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->
  .xdsoft_datetimepicker .xdsoft_datepicker {width:  300px;}
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {height: 151px;}
<!-- =========================================�H�W�� datetimepicker �������]�w========================================== -->
  
</style>

</head>

<body>

<script src="../resources/js/storenav.js"></script>
<!-- �W���ONAV���J �Ф@�w�n��bBODY�}�l����m -->
<!--�U���i�ۥѷs�W���e -->

<div style="padding: 5%"></div>

<table id="table-1">
					<tr><td>
							<h1>�s�W�ֳU</h1>
							<h4><a href="<%=request.getContextPath()%>/front-lucky/select_page.jsp">�^����</a></h4>
					</td></tr>
</table>

<div class="table">

<h3>��Ʒs�W:</h3>
<br>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
		<c:forEach var="message" items="${errorMsgs}">
		<li style="color: red">${message}</li>
		</c:forEach>
		</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lucky/lucky.do" name="form1">
					
<table>

	<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
	<tr>
		<td>�Ӯa:</td>
		<td><%=storeName%></td>
	</tr>
		<tr>
		<td>�ֳU���A:</td>
		<td><input type="TEXT" name="lkStat" size="45"
			 value="<%= (luckyVO==null)? "1" : luckyVO.getLkStat()%>" /></td>
	</tr>
	<tr>
		<td>�ֳU�W��:</td>
		<td><input type="TEXT" name="lkName" size="45" 
			 value="<%= (luckyVO==null)? "�����{��" : luckyVO.getLkName()%>" /></td>
	</tr>
	<tr>
		<td>�ֳU���e:</td>
		<td><input type="TEXT" name="lkCont" size="45"
			 value="<%= (luckyVO==null)? "�K��2��" : luckyVO.getLkCont()%>" /></td>
	</tr>
		<tr>
		<td>����:</td>
		<td><input type="TEXT" name="lkPrc" size="45"
			 value="<%= (luckyVO==null)? "100" : luckyVO.getLkPrc()%>" /></td>
	</tr>
	<tr>
		<td>�W�[���:</td>
		<td><input name="lkTime" id="f_date1" type="text"></td>
	</tr>

</table>
<br> 

<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W" class="btn-secondary">

</FORM>
</div>

<!-- �U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->
<script src="../resources/js/bootstrap.min.js"></script>
<script src="../resources/js/slick.js"></script>
<script src="../resources/js/scripts.js"></script>
<script src="../resources/js/isotope.js"></script>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->    
<script src="<%=request.getContextPath()%>/front-lucky/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/front-lucky/datetimepicker/jquery.datetimepicker.full.js"></script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '<%=lkTime%>', 
        });        
</script>
    
</body>

</html>
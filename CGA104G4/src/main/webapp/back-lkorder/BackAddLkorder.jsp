<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lkorder.model.*"%>

<%
LkOrderVO lkOrderVO = (LkOrderVO) request.getAttribute("lkOrderVO");
%>
<%-- --<%= lkOrderVO==null %>--${lkOrderVO.lkOrderId}-- --%>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���u��Ʒs�W - addEmp.jsp</title>

<meta charset="UTF-8">
<!-- �T�������� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->

<!-- Bootstrap Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/bootstrap.css	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/font-awesome.css	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- Custom Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/custom-styles.css	rel="stylesheet" />

<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->


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
	display: block;
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
	padding: 2%;
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
</style>

</head>
<body>


	<!-- �q�o�ƻs������ -->

	<div id="wrapper">
		<!-- �W��Nav ������  -->
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><strong>��x�޲z</strong></a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-sign-in fa-fw"></i>�n�J</a></li>
						<li><a href="#"><i class="fa fa-sign-out fa-fw"></i> �n�X</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!-- �W��Nav ������  -->
		<!-- ����Nav ������  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">

					<li><a class="active-menu" href="#"><i
							class="fa fa-dashboard"></i> �N���ɼ�</a></li>

					<li><a href="#">�@��ӫ~<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">�@��ӫ~�޲z</a></li>
							<li><a href="#">�@��q��޲z</a></li>
						</ul></li>

					<li><a href="#">�ֳU�ӫ~<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">�ֳU�ӫ~�޲z</a></li>
							<li><a href="#">�ֳU�q��޲z</a></li>
						</ul></li>


					<li><a href="#">���u�b���޲z<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">���u�b���޲z</a></li>
							<li><a href="#">���u�v���޲z</a></li>
						</ul></li>
					<li><a href="#">�N���t�κ޲z<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">�ȶD�B�z</a></li>
							<li><a href="#">�u�f���ʺ޲z</a></li>
							<li><a href="#">�N���x��</a></li>
						</ul></li>
					<li><a href="#">�|���޲z<span class="fa arrow"></span></a>
						<ul class="nav nav-second-level">
							<li><a href="#">�X�@���a���f��</a></li>
							<li><a href="#">�X�@���a�b���޲z</a></li>
							<li><a href="#">�@��|���޲z</a></li>
						</ul></li>

					<li><a href="#"> �������|�޲z </a></li>

				</ul>

			</div>

		</nav>
		<!-- ����Nav ������  -->

		<div id="page-wrapper">
			<div id="wrapper"
				style="min-height: 90vh; padding-top: 20px; padding-bottom: 20px">
				<!-- ******���e�g�b�o�� ������****** -->


				<table id="table-1">
					<tr>
						<td>
							<h1>�s�W�q��</h1>
							<h4>
								<a
									href=${pageContext.request.contextPath}/back-lkorder/BackIndexLkorder.jsp>�^����</a>
							</h4>
						</td>
					</tr>
				</table>

				<div class="table">

					<!-- <table style="margin:auto"> -->
					<!-- 	<tr> -->
					<!-- 		<th><h3>�C��ֳU�q��s�W</h3></th> -->
					<!-- 		<th><h4><a href=${pageContext.request.contextPath}/back-lkorder/BackIndexLkorder.jsp>�^����</a></h4></th> -->
					<!-- 	</tr> -->
					<!-- </table> -->

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



					<FORM METHOD="post"
						ACTION=${pageContext.request.contextPath}/LkOrderServlet
						name="form1">
						<table>
							<tr>
								<td style="width: 200px">�ֳU�s��:</td>
								<td><input type="TEXT" name="lkId" size="600" /></td>
							</tr>
							<tr>
								<td>�|���s��:</td>
								<td><input type="TEXT" name="memId" size="45" /></td>
							</tr>
							<tr>
								<td>�C��ֳU�s��:</td>
								<td><input type="TEXT" name="lkTodayId" size="45" /></td>
							</tr>
							<tr>
								<td>���b���B:</td>
								<td><input type="TEXT" name="lkOrdAmt" size="45" /></td>
							</tr>
							<tr>
								<td>�q�檬�A:</td>
								<td><input type="TEXT" name="lkOrdStat" size="45" /></td>
							</tr>
							<tr>
								<td>�q�榨�ߤ��:</td>
								<td><input name="lkOrdTimeS" id="lkOrdTimeS" type="text"></td>
							</tr>
							<tr>
								<td>���f���:</td>
								<td><input name="lkOrdTaketime" id="lkOrdTaketime"
									type="text"></td>
							</tr>
							<tr>
								<td>�q�槹�����:</td>
								<td><input name="lkOrdTimeE" id="lkOrdTimeE" type="text"></td>
							</tr>

							<jsp:useBean id="lkorderSvc " scope="page"
								class="com.lkorder.model.LkOrderService" />


						</table>
						<br> <input type="hidden" name="action" value="insert">
						<input type="submit" value="�e�X�s�W" class="btn-secondary">
					</FORM>
				</div>



				<!-- ******���e�g�b�o�� ������****** -->
			</div>
		</div>

	</div>
	<!-- �ƻs��o�̡����� -->






	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->

	<!-- jQuery Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery-1.10.2.js></script>
	<!-- Bootstrap Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/bootstrap.min.js></script>
	<!-- ����Nav Dropdown -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery.metisMenu.js></script>
	<!-- Custom Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/custom-scripts.js></script>

	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->

</body>




</html>
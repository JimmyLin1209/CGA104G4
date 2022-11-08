<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lkorder.model.*"%>


<%
LkOrderService lkOrderService = new LkOrderService();
List<LkOrderSelectVO> list = lkOrderService.findAll();
pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�d�ߩҦ��q��</title>

<meta charset="UTF-8">
<!-- �T�������� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />


<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->

<!-- Bootstrap Styles-->
<link
	href=${pageContext.request.contextPath}/resources/back-stage/assets/css/bootstrap.css
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href=${pageContext.request.contextPath}/resources/back-stage/assets/css/font-awesome.css
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- Custom Styles-->
<link
	href=${pageContext.request.contextPath}/resources/back-stage/assets/css/custom-styles.css
	rel="stylesheet" />

<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->


<style>
table {
	border-collapse: collapse;
	margin: 25px auto;
	font-size: 0.9em;
	font-family: sans-serif;
	min-width: 400px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	text-align: center;
	border-radius: 1%;
}

table  tr:nth-of-type(even) {
	background-color: #f3f3f3;
	color: black;
	border-bottom: 1px solid #dddddd;
}

table th, td {
	padding: 5px 5px;
}

#table-1 td {
	width: 60vw;
	text-align: center;
	background-color: #F0F0F0;
}

.btn-secondary {
	color: #fff;
	background-color: #6c757d;
	border: 1px solid #6c757d;
	border-radius: 10%;
}

.btn-secondary:hover {
	color: #fff;
	background-color: #5c636a;
	border: 1px solid #6c757d;
	border-radius: 10%;
}

a {
	text-decoration: none;
	font-weight: bold;
}

thead th {
	color: #D5DDE5;;
	background: #1b1e24;
	border-bottom: 4px solid #9ea7af;
	border-right: 1px solid #343a45;
	font-size: 1rem;
	font-weight: 100;
	padding: 10px;
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
				style="min-height: 90vh; padding-top: 15px; padding-bottom: 30px">
				<!-- ******���e�g�b�o�� ������****** -->


				<table id="table-1">
					<tr>
						<td>
							<h1>�d�ߩҦ��q��</h1>
							<h4>
								<a
									href=${pageContext.request.contextPath}/back-lkorder/BackIndexLkorder.jsp>�^����</a>
							</h4>
						</td>
					</tr>
				</table>

				<table>
					<thead>
						<tr>
							<th>�ֳU�q��s��</th>
							<th>�ֳU�W��</th>
							<th>�|���W��</th>
							<th>�C��ֳU�s��</th>
							<th>���b���B</th>
							<th>�q�檬�A</th>
							<th>�q�榨�ߤ��</th>
							<th>���f���</th>
							<th>�q�槹�����</th>
							<th>�ק�</th>
							<th>�R��</th>
						</tr>
					</thead>
					<%-- 		<%@ include file="page1.file"%> --%>
					<c:forEach var="LkOrderSelectVO" items="${list}">

						<tr>
							<td>${LkOrderSelectVO.lkOrderId}</td>
							<td>${LkOrderSelectVO.lkName}</td>
							<td>${LkOrderSelectVO.memName}</td>
							<td>${LkOrderSelectVO.lkTodayId}</td>
							<td>${LkOrderSelectVO.lkOrdAmt}</td>

							<c:if test="${LkOrderSelectVO.lkOrdStat == '0'}">
								<td>�ݨ��f</td>
							</c:if>
							<c:if test="${LkOrderSelectVO.lkOrdStat == '1'}">
								<td>�w���f</td>
							</c:if>
							<c:if test="${LkOrderSelectVO.lkOrdStat == '2'}">
								<td>����</td>
							</c:if>
							<c:if test="${LkOrderSelectVO.lkOrdStat == '3'}">
								<td>�ȶD�B�z��</td>
							</c:if>

							<td>${LkOrderSelectVO.lkOrdTimeS}</td>
							<td>${LkOrderSelectVO.lkOrdTaketime}</td>
							<td>${LkOrderSelectVO.lkOrdTimeE}</td>
							<td>
								<FORM METHOD="post"
									ACTION=${pageContext.request.contextPath}/back-lkorder/lkorderback.do
									style="margin-bottom: 0px;">
									<input type="hidden" name="action" value="getOne_For_Update">
									<input type="submit" value="�ק�" class="btn-secondary">
									<input type="hidden" name="lkOrderId"
										value="${LkOrderSelectVO.lkOrderId}">
									<!-- 															value="getOne_For_Update" -->
								</FORM>
							</td>
							<td>
								<FORM METHOD="post"
									ACTION=${pageContext.request.contextPath}/back-lkorder/lkorderback.do
									style="margin-bottom: 0px;">
									<input type="submit" value="�R��" class="btn-secondary">
									<input type="hidden" name="lkOrderId"
										value="${LkOrderSelectVO.lkOrderId}"> <input
										type="hidden" name="action" value="delete">
								</FORM>
							</td>
						</tr>
					</c:forEach>
				</table>
				<%-- 	<%@ include file="page2.file"%> --%>




				<!-- ******���e�g�b�o�� ������****** -->
			</div>
		</div>

	</div>
	<!-- �ƻs��o�̡����� -->



	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->

	<!-- jQuery Js -->
	<script
		src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery-1.10.2.js></script>
	<!-- Bootstrap Js -->
	<script
		src=${pageContext.request.contextPath}/resources/back-stage/assets/js/bootstrap.min.js></script>
	<!-- ����Nav Dropdown -->
	<script
		src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery.metisMenu.js></script>
	<!-- Custom Js -->
	<script
		src=${pageContext.request.contextPath}/resources/back-stage/assets/js/custom-scripts.js></script>

	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->

</body>
</html>
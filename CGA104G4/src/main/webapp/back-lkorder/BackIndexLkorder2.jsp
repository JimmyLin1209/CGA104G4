<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8" />
<title>��x</title>

<!-- �T�������� -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->

<!-- Bootstrap Styles-->
<link href="../resources/back-stage/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="../resources/back-stage/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- Custom Styles-->
<link href="../resources/back-stage/assets/css/custom-styles.css"
	rel="stylesheet" />

<!-- �������U���O�o�Ӫ��ݭn��css�i�K�[�U�ۻݭn��css��-->

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

a {
	color: #5c636a;
	text-decoration: none;
	font-weight: bold;
}

.table-order {
	width: 40%;
	height: 70%;
	margin: 5% auto auto auto;
	padding: 5% 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	background: white;
}

.table-order ul li {
	color: black;
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


		<!-- ���e�g�b�o�� ������ -->

		<div id="wrapper-container">



			<div class="table-order">


				<%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<font style="color: red">�Эץ��H�U���~:</font>
					<ul>
						<c:forEach var="message" items="${errorMsgs}">
							<li style="color: red">${message}</li>
						</c:forEach>
					</ul>
				</c:if>

				<ul>
					<li style="font-weight: bolder; font-size: 1.2em"><a
						href=${pageContext.request.contextPath}/back-lkorder/BackListAllLkorder.jsp>�d�ߩҦ��q��</a></li>
					<br>

					<li style="font-weight: bolder; font-size: 1.2em"><a
						href=${pageContext.request.contextPath}/back-lkorder/BackAddLkorder.jsp>�s�W�ֳU�q��</a></li>

					<br>
					<li>
						<FORM METHOD="post"
							ACTION=${pageContext.request.contextPath}/LkOrderServlet>
							<b style="color: black">��J�C��ֳU�q��s���G</b> <input type="text"
								name="lkOrderId"> <input type="hidden" name="action"
								value="getOne_For_Display"> <input type="submit"
								value="�e�X" class="btn-secondary">
						</FORM>
					</li>


					<jsp:useBean id="lkorderSvc " scope="page" class="com.lkorder.model.LkOrderService" />


				</ul>

				<hr>





			</div>

		</div>


		<!-- ���e�g�b�o�� ������ -->

	</div>
	<!-- �ƻs��o�̡����� -->





	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->

	<!-- jQuery Js -->
	<script src="../resources/back-stage/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="../resources/back-stage/assets/js/bootstrap.min.js"></script>
	<!-- ����Nav Dropdown -->
	<script src="../resources/back-stage/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="../resources/back-stage/assets/js/custom-scripts.js"></script>

	<!-- �������U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->
</body>
</html>
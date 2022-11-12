<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lkorder.model.*"%>

<%
LkOrderSelectVO lkorderVO = (LkOrderSelectVO) request.getAttribute("lkorderVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>


<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>每日福袋訂單資料修改</title>


 <meta charset="UTF-8">
    <!-- 響應式頁面 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- ↓↓↓下面是這個版需要的css可添加各自需要的css檔-->

    <!-- Bootstrap Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/bootstrap.css	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/font-awesome.css	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- Custom Styles-->
<link href=${pageContext.request.contextPath}/resources/back-stage/assets/css/custom-styles.css	rel="stylesheet" />

<!-- ↑↑↑下面是這個版需要的css可添加各自需要的css檔-->

<style>
  a {
    color: #5c636a;
    display: inline;
    text-decoration: none;
  }
  
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


.table{
	width: 50%;
	height: auto;
	margin: 2% auto;
	padding: 30px 90px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	background: white;
}
#table-1{
margin: auto;
padding: 2%;

}

#table-1 td{
	width:50vw;
	text-align: center;
	background-color: #F0F0F0;
	margin: 2% auto;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
	padding: 15px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	color: #2F3237;
	font-weight: 700;
}
</style>

</head>
<body>

<!-- 從這複製↓↓↓ -->
	
    <div id="wrapper">
        <!-- 上方Nav ↓↓↓  -->
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><strong>後台管理</strong></a>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-sign-in fa-fw"></i>登入</a>
                        </li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> 登出</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!-- 上方Nav ↑↑↑  -->
        <!-- 左側Nav ↓↓↓  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> 吉食享樂</a>
                    </li>

                    <li>
                        <a href="#">一般商品<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">一般商品管理</a>
                            </li>
                            <li>
                                <a href="#">一般訂單管理</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#">福袋商品<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">福袋商品管理</a>
                            </li>
                            <li>
                                <a href="#">福袋訂單管理</a>
                            </li>
                        </ul>
                    </li>


                    <li>
                        <a href="#">員工帳號管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">員工帳號管理</a>
                            </li>
                            <li>
                                <a href="#">員工權限管理</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">代幣系統管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">客訴處理</a>
                            </li>
                            <li>
                                <a href="#">優惠活動管理</a>
                            </li>
                            <li>
                                <a href="#">代幣儲值</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#">會員管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#">合作店家資格審核</a>
                            </li>
                            <li>
                                <a href="#">合作店家帳號管理</a>
                            </li>
                            <li>
                                <a href="#">一般會員管理</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="#"> 評論檢舉管理 </a>
                    </li>

                </ul>

            </div>

        </nav>
        <!-- 左側Nav ↑↑↑  -->

       <div id="page-wrapper">
			<div id="wrapper-container">
			<!-- ******內容寫在這邊 ↓↓↓****** -->
			
			
			<table id="table-1">
	<tr><td>
		 <h1>福袋訂單資料修改</h1>
		 <h4><a href=${pageContext.request.contextPath}/back-lkorder/BackIndexLkorder.jsp>回首頁</a></h4>
	</td></tr>
</table>




<FORM METHOD="post" ACTION=${pageContext.request.contextPath}/LkOrderServlet  name="form1" class="table">
<table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
		<input type="hidden" name="lkName" size="45" value="<%=lkorderVO.getLkName()%>"/>
		<input type="hidden" name="memName" size="45" value="<%=lkorderVO.getMemName()%>"/>
	<tr>
		<td style="width:200px">福袋訂單編號:<font color=red><b>*</b></font></td>
		<td><%=lkorderVO.getLkOrderId()%></td>
		
	</tr>
	<tr>
		<td>福袋編號:</td>
		<td><input type="TEXT" name="lkId" size="45" value="<%=lkorderVO.getLkId()%>"/></td>
	</tr>
	<tr>
		<td>會員編號:</td>
		<td><input type="TEXT" name="memId" size="45" value="<%=lkorderVO.getMemId()%>"/></td>
	</tr>
	<tr>
		<td>每日福袋編號:</td>
		<td><input type="TEXT" name="lkTodayId" size="45" value="<%=lkorderVO.getLkTodayId()%>"/></td>
	</tr>
	<tr>
		<td>結帳金額:</td>
		<td><input type="TEXT" name="lkOrdAmt" size="45" value="<%=lkorderVO.getLkOrdAmt()%>"/></td>
	</tr>
	<tr>
		<td>訂單狀態:</td>
		<td><input type="TEXT" name="lkOrdStat" size="45" value="<%=lkorderVO.getLkOrdStat()%>"/></td>
	</tr>
	<tr>
		<td>訂單成立日期:</td>
		<td><input type="TEXT" name="lkOrdTimeS" size="45" value="<%=lkorderVO.getLkOrdTimeS()%>"/></td>
<%-- 		<td><%=lkorderVO.getLkOrdTimeS()%></td> --%>
	</tr>
	<tr>
		<td>取貨日期:</td>
		<td><input name="lkOrdTaketime" id="lkOrdTaketime" type="text" value="<%=lkorderVO.getLkOrdTaketime()%>"></td>
	</tr>
	<tr>
		<td>訂單完成日期:</td>
		<td><input name="lkOrdTimeE" id="lkOrdTimeE" type="text" value="<%=lkorderVO.getLkOrdTimeE()%>"></td>
	</tr>

	<jsp:useBean id="lkorderSvc " scope="page" class="com.lkorder.model.LkOrderService" />


</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="lkOrderId" value="<%=lkorderVO.getLkOrderId()%>">
<input type="submit" value="送出修改" class="btn-secondary"></FORM>
			
			
			
			<!-- ******內容寫在這邊 ↑↑↑****** -->
			</div>
        </div>
        
    </div>
    <!-- 複製到這裡↑↑↑ -->





<!-- ↓↓↓下面是這個版需要的js可添加各自需要的js檔-->

	<!-- jQuery Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery-1.10.2.js></script>
	<!-- Bootstrap Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/bootstrap.min.js></script>
	<!-- 左側Nav Dropdown -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/jquery.metisMenu.js></script>
	<!-- Custom Js -->
	<script src=${pageContext.request.contextPath}/resources/back-stage/assets/js/custom-scripts.js></script>

	<!-- ↑↑↑下面是這個版需要的js可添加各自需要的js檔-->

</body>






</html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>�Ӯa�d�߭q�歺��</title>

 <meta charset="UTF-8">
    <!-- �T�������� -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- GOOGLEFONT -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;300;400;500;700;900&display=swap"
        rel="stylesheet">

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
  a{
  color: #5c636a;
  text-decoration: none;
  font-weight: bold;
}
.table-order{
	width: 40%;
	height: 70%;
	margin: 5% auto auto auto;
	padding: 5% 20px;
	border-radius: 10px;
	box-shadow: 0 0 20px rgba(0, 0, 0, .6);
	background: white;
}
.table-order ul li{
	color:black; 	
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

 <script src="../resources/js/storenav.js"></script>
    <!-- �W���ONAV���J �Ф@�w�n��bBODY�}�l����m -->
    <!--�U���i�ۥѷs�W���e -->
	<div style="padding: 3.5%;"></div>


<div class="table-order">

	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li style="font-weight:bolder;font-size: 1.2em"><a href=${pageContext.request.contextPath}/back-lkorder/BackListAllLkorder.jsp>�d�ߩҦ��q��</a></li> 
  <br>

  <li style="font-weight:bolder;font-size: 1.2em"><a href=${pageContext.request.contextPath}/back-lkorder/BackAddLkorder.jsp>�s�W�ֳU�q��</a></li>

  <br>
  <li>
    <FORM METHOD="post" ACTION=${pageContext.request.contextPath}/LkOrderServlet >
        <b  style="color:black">��J�C��ֳU�q��s���G</b>
        <input type="text" name="lkOrderId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X" class="btn-secondary">
    </FORM>
  </li>


  <jsp:useBean id="lkorderSvc " scope="page" class="com.lkorder.model.LkOrderService" />
   
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/lkorder.do" > --%>
<!--        <b>��ܨC��ֳU�q��s��:</b> -->
<!--        <select size="1" name="lkOrderId"> -->
<%--          <c:forEach var="LkOrderVO" items="${lkorderSvc.all}" >  --%>
<%--           <option value="${LkOrderVO.lkOrderId}">${LkOrderVO.lkOrderId} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="�e�X"> -->
<!--     </FORM> -->
<!--   </li> -->
</ul>

<hr>





</div>


 <!-- �U���O�o�Ӫ��ݭn��js�i�K�[�U�ۻݭn��js��-->
    <script src="../resources/js/bootstrap.min.js"></script>
    <script src="../resources/js/slick.js"></script>
    <script src="../resources/js/scripts.js"></script>
    <script src="../resources/js/isotope.js"></script>
</body>
</html>
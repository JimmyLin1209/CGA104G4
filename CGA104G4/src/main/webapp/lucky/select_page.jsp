<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>FOOD: Home</title>

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
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>FOOD: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for FOOD: Home</p>

<h3>��Ƭd��:</h3>
	
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
  <li><a href='listAllLucky.jsp'>List</a> all luckys.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="lucky.do" >
        <b>��J�ֳU�s�� (�p1):</b>
        <input type="text" name="luckyId">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="luckySvc" scope="page" class="com.lucky.model.LuckyService" />
   
  <li>
     <FORM METHOD="post" ACTION="lucky.do" >
       <b>��ֳܺU�s��:</b>
       <select size="1" name="luckyId">
         <c:forEach var="luckyVO" items="${luckySvc.all}" > 
          <option value="${luckyVO.luckyId}">${luckyVO.luckyId}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="lucky.do" >
       <b>��ֳܺU�W��:</b>
       <select size="1" name="lkName">
         <c:forEach var="luckyVO" items="${luckySvc.all}" > 
          <option value="${luckyVO.luckyId}">${luckyVO.lkName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�ֳU�޲z</h3>

<ul>
  <li><a href='addLucky.jsp'>Add</a> a new Lucky.</li>
</ul>

</body>
</html>
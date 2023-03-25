<%@page import="com.entity.Jobs"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: view places</title>
<%@include file="all_component/all_css.jsp" %>
</head>
<body style="background-color:#DF6C4F;" >
<%@include file="all_component/navbar.jsp" %>
<div class="row">
<div class="col-md-12">
<h5 class="text-center text-primary">All places</h5>
<c:if test="${not empty succMsg }">
<div  class="alert alert-success" role="alert" >${succMsg}</div>
<c:remove var="succMsg"/>
</c:if>




<% JobDAO dao = new JobDAO(DBConnect.getConn());
List<Jobs> list =dao.getAllJobs();
for(Jobs j:list){
	%>
	<div class="card mt-2">
<div class="card-body">
<div class="text-center text-primary">
<i class="far fa-clipboard fa-2x"></i></div>










<h6><%=j.getTitle() %></h6>
<p> <%=j.getDescription() %></p>
<br>
<div class="form-row"> <div class="form-group col md-3">
<input type="text" class="form-control form-control-sm" value="Location:<%=j.getLocation() %>" readonly></div>
<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" value="Category:<%=j.getCategory()%>"readonly></div>
<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" value="Status:<%=j.getStatus()%>" readonly></div>

</div>
<h6> Publish Date <%=j.getPdate() %></h6>
<div class="text-center">
<a href="edit_job..jsp?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">EDIT</a>

<a href="delete?id=<%=j.getId()%>"
 class="btn btn-sm bg-danger text-white">Delete</a></div>
</div></div>
	
	
	
	
	
	<% 
}
%>

</div>
</div>
</body>
</html>
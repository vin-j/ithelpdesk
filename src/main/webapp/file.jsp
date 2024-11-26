<% 

//**********************************************************************************************
//	Project:		VCL helpdesk application | login | Incidents | Users 
//	Name:			
//	Date Started:	9/5/2024
//	Update:	...
//	Management Information Systems
//
//
//
//
//
//
//
//********************************************************************************************
%>


<%@page import="ithelpdesk.Customers, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VCL helpdesk application | login | Incidents | Users  </title>

	
	<link rel=stylesheet type=text/css href=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.css />
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js></script>
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js></script>
    <script type=text/javascript src=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.js></script>
    <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css' />
    <script src='https://code.jquery.com/jquery-3.5.1.js'></script>
    <script src='https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js'></script>
	
	
	<script>

           $(document).ready(function() {
                       $('#table_id').DataTable();
               } );

           $('#button').click(function() {
               CartJS.addItem(1);
               
           });

     </script>
	<style>
	
		.form{	
			text-align: center; 
			border: 1px solid gray; 
			border-radius: 10px;"
			
			}			
	</style>
</head>
<body>


<div id="wrapper">

<%@ include file="header.jsp" %>  



<div>



files |
<a href="fileentity"> files </a> | 
<a href="file.jsp">file submit</a> |
<a href="reports.jsp">reports</a> | 
<a href="create-account.jsp">Create a new customer</a> | 
<a href="customer.jsp">customers</a> | 
<a href="incident.jsp?incidentadd=1"> Create a new incident</a> | 
<a href="incidents.jsp">incidents</a>  
 
<hr />

</div>


<div class="form">




<form action="filesubmit" method="post"  enctype="multipart/form-data">

<label>select file </label> <input type="file" id="file" name="file" required> <button type="submit">file submit</button> <br> <br> 

</form>

</div>
</div>



</body>
</html>


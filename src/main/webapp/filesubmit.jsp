<% 

//**********************************************************************************************
//	Project:		VCL helpdesk application | login | Incidents | Users | report
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


<%@page import="ithelpdesk.Reports,
java.time.LocalDateTime,
java.time.format.DateTimeFormatter,
java.time.format.DateTimeParseException,
java.time.LocalDateTime, 
java.text.SimpleDateFormat, 
java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter,
javax.servlet.http.HttpSession

"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> VCL helpdesk application | login | Incidents | Users  | Reports </title>


	<link rel=stylesheet type=text/css href=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.css />
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js></script>
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js></script>
    <script type=text/javascript src=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.js></script>
    <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css' />
    <script src='https://code.jquery.com/jquery-3.5.1.js'></script>
    <script src='https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js'></script>


	<link rel="stylesheet" href="header.css"> <!-- Link to external CSS -->
	<link rel="stylesheet" href="menu.css"> <!-- Link to external CSS -->
	<link rel="stylesheet" href="style.css"> 
		
	<script>

           $(document).ready(function() {
                       $('#table_id').DataTable();
               } );

           $('#button').click(function() {
               CartJS.addItem(1);
               
           });

     </script>



</head>



<body>


<div class="container">
	



<%@ include file="header.jsp" %>  

<div>
<%@ include file="menu.jsp" %>  
<hr />
</div>









<div class="row">
<div class="column">


<h1> file submit   </h1>
<%
    String fileName = request.getParameter("fileName");
    String contentType = request.getParameter("contentType");
    String fileSize = request.getParameter("fileSize");
%>


<p>File Name: <%= fileName %></p>
<p>Content Type: <%= contentType %></p>
<p>File Size: <%= fileSize %></p>




</div>
</div>






<%@include file="footer.jsp" %>
</div>


</body>
</html>




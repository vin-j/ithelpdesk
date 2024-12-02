<% 

//**********************************************************************************************
//	Project:		VCL helpdesk application | login | Incidents | Users | Reports 
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

<%@page import="ithelpdesk.Accounts, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title>helpdesk create new user</title>


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
	


<%@include file="header.jsp" %>



		
		<div class="form">	
	
	
		<h3>Create a new customer below or <a href="login.jsp">sign in to helpdesk</a> </h3> 
	
		<form action="newaccount.jsp" method="POST">
		
		  <label for="firstname">First name:</label>
		  <input type="text" id="firstname" name="firstname" placeholder="First name" required> <br><br>	
		  <label for="lastname">Last name:</label>
		  <input type="text" id="lastname" name="lastname" placeholder="Last name" required> <br> <br>
		  <label for="email">Email:</label>
		  <input type="email" id="email" name="email" placeholder="Enter email" required><br><br>
		  <label for="pwd">Password:</label>
		  <input type="password" id="pwd" name="pwd" minlength="8" placeholder="Enter Password" required><br><br>
		  <button type="submit"  style="width:auto;">Create new customer</button>
		
		<%
							
			StringJoiner sj = new StringJoiner("-", "", "");
			//sj.add(str[0].toString());
			String desiredString = sj.toString();
							
		%>
		
		<input type="hidden" name="id" value=<%= desiredString %>	 />
		
		
		</form>
		</div>    
      


<%@include file="footer.jsp" %>


</div>


</body>
</html>





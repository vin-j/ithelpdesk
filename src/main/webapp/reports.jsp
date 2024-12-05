

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

<%@page import="ithelpdesk.Reports, 
java.time.LocalDateTime, 
java.time.format.DateTimeFormatter,
java.time.LocalDate,
java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">


<meta name="viewport" content="width=device-width, initial-scale=1.0">


<title> reports  </title>



	<link rel=stylesheet type=text/css href=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.css />
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js></script>
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js></script>
    <script type=text/javascript src=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.js></script>
    <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css' />
    <script src='https://code.jquery.com/jquery-3.5.1.js'></script>
    <script src='https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js'></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>



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

<% 	
	int incidents = 0;	
	Reports reports = new Reports();
%>

<%@ include file="menu.jsp" %>  
<hr />

<div>
  <h1> reports </h1>	
  <table id='table_id' class='display'>
            <thead>
                <tr>
                    <th>reports id </th>
                    <th>reports title</th>
                    <th>report description</th>
                    <th>report details </th>
                   
                    <th>report datecreated</th>
				
                    <th>view</th>
                   
                </tr>
            </thead>
            <tbody>

<%              int i = 1;   
                //for(String[] str: ac.setAccount())
                for(Object[] str: reports.viewreports())	
				{
%>                
                <tr>
        
                    <td>   <% out.println((str[0]));%> </td>

                    <td>   <% out.println((str[1]));%> </td>
                    
                    <td>   <% out.println((str[2]));%> </td>
                    
                    <td>   <% out.println((str[3]));%>  </td>
                    
                    <td>   <% out.println((str[5].toString())); %> </td>
				    
				                        
                    <td>  <% String reportsid = str[0].toString(); %>

						<form action="report.jsp?reportsid=<%= reportsid %>" method="POST">
									<input type="hidden" name="reportsid" value=0	 />
    								<input type="hidden" name="reportscreateduserid" value=<%= reportsid %>	 />
									<p id="demo"></p>
    								<button id="button" type="submit" onclick=""  >View</button>
						</form>
						
                    </td>
                </tr>


	   			<%  //out.println(i); 
	   				i=i+1;
				}
			    %>
                

            </tbody>
        </table>

</div>


</div>

</body>
</html>


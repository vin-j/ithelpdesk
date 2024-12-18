

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



<%@page import="ithelpdesk.Reports,ithelpdesk.Calculator, 
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

<title> incident reports  </title>

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

<% 
	
	int incidents = 0;

	Calculator calculator = new Calculator();	
	calculator.calculateMetrics();

	Reports reports = new Reports();
	reports.reportincidents();


%>


<div>

<div>
<%@ include file="menu.jsp" %>  
<hr />
</div>


  <table id='table_id' class='display' >
            <thead>
                <tr>
                    <th>incidents reports id </th>
                    <th>incidents reports title</th>
            		<th>incidents counter </th>
                   
                </tr>
            </thead>
            <tbody>
<%              int i = 1;   
                //for(String[] str: ac.setAccount())
                for(Object[] str: reports.viewincidentsreports())	
				{
%>                
                <tr>

                    <td width="5%" style="font-size:1.5em;">
                        <!-- For loop logic of template -->
                        <% out.println((str[0]));%>
                    </td>

                    <td width="10%" style="font-size:1.5em;">
                        <% out.println((str[1]));%>
                    </td>
                  
                    <td width="10%" style="font-size:1.5em;">
                        <% out.println((str[2]));%>
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


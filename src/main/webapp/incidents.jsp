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



<%@page import="ithelpdesk.Incidents, 
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


<title> VCL helpdesk application | login | Incidents | Users  </title>

	<link rel=stylesheet type=text/css href=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.css />
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js></script>
    <script type=text/javascript src=https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js></script>
    <script type=text/javascript src=https://cdn.datatables.net/v/dt/dt-1.10.24/b-1.7.0/b-html5-1.7.0/datatables.min.js></script>
    <link rel='stylesheet' type='text/css' href='https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css' />
    <script src='https://code.jquery.com/jquery-3.5.1.js'></script>
    <script src='https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js'></script>

	<script src="paginationsearch.js"> </script>



	<script>

	
			if(window.innerWidth >= 768) {
	  		
	  			document.getElementById("mobile-container").style.display = "none";
	  			document.getElementById("table_id").style.display = "table";
	  		}else{
	  		
	  			
	  			document.getElementById("mobile-container").style.display = "block"; 
	  			document.getElementById("table_id").style.display = "none" 
	  				document.getElementById("mobile-container").style.display = "none";
	
	  		}
	  		
	</script>


	<script>

			
           $(document).ready(function() {
                       $('#table_id').DataTable();
               } );

           $('#button').click(function() {
               CartJS.addItem(1);
               
           });

     </script>

	<link rel="stylesheet" href="header.css"> <!-- Link to external CSS -->
	<link rel="stylesheet" href="menu.css"> <!-- Link to external CSS -->
	<link rel="stylesheet" href="style.css"> 
		


</head>



<body>


<div class="container">

	<%@ include file="header.jsp" %>  
	
	
	<div>
	<%@ include file="menu.jsp" %>  
	<hr />
	</div>

	<h1> incidents </h1>
	
	<% 	
		Incidents incidents = new Incidents();
	    incidents.viewincidents();
	    Iterator<Object[]> iterator = incidents.getincidents().iterator();	
	
	%>  		
				
	
		
	  <table id='table_id' class="display"  >
	            <thead>
	                <tr>
	
	                    <th># </th>
	                    <th>title</th>
	                    <th>details </th>
						<th> view </th>
	                </tr>
	            </thead>
	            <tbody>
	
	<%              
					int i = 1;   
	                //for(String[] str: ac.setAccount())
	                for(Object[] str: incidents.getincidents())	
					{
	                	
	                	int incidentid = Integer.parseInt( (str[0]).toString() );
	%>                
	                <tr>
	
	                    <td style="font-size:1.1em; vertical-align: top; ">
	                        <!-- For loop logic of template -->
	                       incident# <% out.println((str[0]));%>
	                    </td>
	                
	                    <td style="font-size:1.1em; vertical-align: top; ">
	                       title:  <% out.println((str[1]));%>
	                    </td>
	                    
	                    
	                    
	                    <td style="font-size:1.1em; vertical-align: top; ">
	                        <!-- For loop logic of template -->
	                    	details: 	
						<p> created date	 <% out.println(str[5].toString()); %> </p>
						<p> date	 <% out.println(str[6].toString()); %> </p>
						<p> assigned		 <% out.println(str[9].toString()); %> </p>
						<p> created		 <% out.println(str[10].toString()); %> </p>
						<p> severity		 <% out.println(str[11].toString()); %></p>
						<p> priority		 <% out.println(str[12].toString()); %></p>				
	
	                    </td>
					        
						<td style="vertical-align: top;"> 
							<% 	int incidentids = Integer.parseInt(str[0].toString()); %>
							<form action="incident.jsp?incidentsid=<%= incidentids %>" method="POST">
								<p id="demo"></p>
	  								<button id="button" type="submit" onclick="">View</button>
							</form>
						</td>
	            	        
	                </tr>
		
					<%   
		   				i=i+1;
					}
				    %>
	                           	
	            </tbody>
	        </table>

</div>



</body>
</html>


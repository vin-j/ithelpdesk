

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
<title> VCL helpdesk application | login | Incidents | Users  </title>


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
	
</head>
<body>


<div id="wrapper">

<%@ include file="header.jsp" %>  

<% 

	Incidents incidents = new Incidents();
    incidents.viewincidents();
	

%>  

<div>



files |
<a href="fileentity"> files </a> | 
<a href="file.jsp">file submit</a> |
<a href="reports.jsp">reports</a> | 
<a href="create-account.jsp">Create a new customer</a> | 
<a href="customer.jsp">customers</a> |  
<a href="incident.jsp?incidentadd=1"> Create a new incidents</a> | 
<a href="incidents.jsp">incidents</a>  



<hr />

</div>


  <table id='table_id' class='display' >
            <thead>
                <tr>

                    <th>Incident id </th>
                    <th>title</th>
                   
                    <th> datecreated</th>
                    <th> date </th>
              		<th> assigned</th>
					
					<th> created</th>
					<th> severity</th>
					<th> priority</th>
                    
                    <th> view</th>
					
			       
                </tr>
            </thead>
            <tbody>

<%              int i = 1;   
                //for(String[] str: ac.setAccount())
                for(Object[] str: incidents.getincidents())	
				{
%>                
                <tr>

                    <td width="5%" style="font-size:1.1em;">
                        <!-- For loop logic of template -->
                        <% out.println((str[0]));%>
                    </td>
                    <td width="10%" style="font-size:1.1em;">
                        <% out.println((str[1]));%>
                    </td>
                    
                    
                    
                    <td width="20%" style="font-size:1.1em;">
                        <!-- For loop logic of template -->
                        <% out.println((str[5].toString())); %>
                    </td>
				    
                    <td width="20%" style="font-size:1.1em;">
                        <!-- For loop logic of template -->
                        <% out.println((str[6].toString())); %>
                    </td>
                    <td width="20%" style="font-size:1.1em;">
                     	<!-- For loop logic of template -->
                        <% out.println((str[9]));%>
							
                    </td>
                    
                     
                    
                    
                    <td width="20%" style="font-size:1.1em;">
                     	<!-- For loop logic of template -->
                        <% out.println((str[10]));%>
							
                    </td>
                    <td width="20%" style="font-size:1.1em;">
                     	<!-- For loop logic of template -->
                        <% out.println((str[11]));%>
							
                    </td>
                    <td width="20%" style="font-size:1.1em;">
                     	<!-- For loop logic of template -->
                        <% out.println((str[12]));%>
							
                    </td>
                    
                    
                    
            		<td width="10%">
					
					<%
					
					int incidentid = Integer.parseInt(str[0].toString());
					
			
					%>

						<form action="incident.jsp?incidentsid=<%= incidentid %>" method="POST">
									
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





</body>
</html>









</body>
</html>


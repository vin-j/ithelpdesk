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

<%@page import="java.util.List" %>
<%@page import="ithelpdesk.files, ithelpdesk.fileentity" %>

<%@page import="ithelpdesk.Reports, 
java.time.LocalDateTime, 
java.time.format.DateTimeFormatter,
java.time.LocalDate,
java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title> temp  </title>


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

	files file = new files();
	List<files> filesList = file.viewfile(); 
	
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


  <table id='table_id' class='display' >
            <thead>
                <tr>

                    <th> file </th>
                    <th> file type </th>
                    <th> file size </th>
                    <th> file path </th>
              		<th> file date </th>
					<th> file view <th>					
					
                   
                </tr>
            </thead>
            <tbody>

<%             
			int i = 1;   
            for (files str : filesList) 
            {
%>                

  			<tr>

                    <td> <% out.println(str.getFileName()); %> 	  </td>
                    <td> <% out.println(str.getContentType()); %> </td>
                    <td> <% out.println(str.getFileSize()); %>    </td>
                    <td> <% out.println(str.getUploadPath()); %>  </td>                         
              		<td> <% out.println( str.getUploadTime() ); %>   </td>
					<td> 
						<form action="files.jsp" method="get">
									
									<p id="demo"></p>
    								<button id="button" type="submit" onclick=""  >View</button>
						</form>
					<td>					
					
                   
           </tr>






<%   i=i+1; } %>
                

            </tbody>
        </table>





</body>
</html>


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


<%@page import="ithelpdesk.Accounts, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JVOK - All Accounts </title>


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

	Accounts ac = new Accounts();
	
	if("POST".equals(request.getMethod()))
	{
	 	ac.ReadAcct(Integer.parseInt(request.getParameter("id")));
	}
	else{
		ac.ReadAcct();
	}

%>  


<div>


<a href="create-account.jsp">Create a new customer</a> | 
 
<a href="customer.jsp">customers</a>


<hr />

</div>

  <table id='table_id' class='display' >
            <thead>
                <tr>
                 <!--<th>Image </th>-->
                    <th>CustID</th>
                    <th>Name</th>
                    <th>.....</th>
                    
                </tr>
            </thead>
            <tbody>
<%              int i = 1;   
                //for(String[] str: ac.setAccount())
                for(Object[] str: ac.getAccounts())	
				{
%>                
                <tr>
                 <!-- 
                    <td width="20%">
                    	<img src="account-pictures\<%= i %>.jpg" width="200px" />
                    </td>
				 -->
                    <td width="20%" style="font-size:3em;">
                        <!-- For loop logic of template -->
                        <% out.println((str[1]));%>
                    </td>

                    <td width="20%" style="font-size:3em;">
                        <% out.println((str[3]));%>
                    </td>

                    <td width="20%">

					

					<%
					
						int desiredint = Integer.parseInt(str[2].toString()); 
					%>

						<form action="transactions.jsp" method="POST">
    								<input type="hidden" name="id" value=<%= desiredint %>	 />
									<p id="demo"></p>
    								<button id="button" type="submit" onclick=""  >View</button>
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


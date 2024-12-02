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


<%@page import="ithelpdesk.Incidents,
java.time.LocalDateTime,
java.time.format.DateTimeFormatter,
java.time.format.DateTimeParseException,
java.text.SimpleDateFormat, 
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
	
	<% 

	String incidentcreateformattedDateTime ="";
	String incidentassignedto = "";
	String incidentcreatedby = "";
	String incidentseverity_ = "";
	String incidentpriority_ =  "";
	

	int incidentid=0;
	int incidentsid=0;
	String incidentstitle = "";
	String incidentsdescription = "";
	String incidentdescriptiondetail ="";
	String incidentpriority = "";
    
    int incidentcreateuserid=0;
    String incidentresolveuserid="";
	
    String incidentdatecreated  = "";
    String incidentdateresolved = "";

	String message = "";
	int id = 0; 
	int update = 0;


	
	if (request.getParameter("incidentupdate") !=null) 
	{
		
   	    	Incidents incident = new Incidents();

     		incidentsid 			= 	Integer.parseInt(request.getParameter("incidentsid"));
	        incidentstitle 			= 	request.getParameter("incidenttitle");
	        incidentsdescription 	= 	request.getParameter("incidentdescription");
	        incidentpriority 		= 	request.getParameter("incidentpriority");
	        incidentcreateuserid 	= 	Integer.parseInt(request.getParameter("incidentcreateuserid"));
	        incidentresolveuserid 	=   request.getParameter("incidentresolveuserid");	       
	        incidentdatecreated 		= 	request.getParameter("incidentdatecreated").replace("T", " ");
	        incidentdateresolved		= 	request.getParameter("incidentdateresolved").replace("T", " ");
       	
	        incidentassignedto = request.getParameter("incidentassignedto");
       		incidentcreatedby = request.getParameter("incidentcreatedby");
       		incidentseverity_ = request.getParameter("incidentseverity_");
       		incidentpriority_ =  request.getParameter("incidentpriority_");
	        
	        incident.setincidentid(incidentsid);
	        incident.setincidenttitle(incidentstitle);
	        incident.setincidentdescription(incidentsdescription);
	        incident.setincidentpriority(incidentpriority); 

	        incident.setincidentdatecreated(incidentdatecreated);
	        incident.setincidentdateresolved(incidentdateresolved);
	        
	        incident.setincidentcreateuserid(incidentcreateuserid);
	        incident.setincidentresolveduserid(incidentresolveuserid);
	        
	        incident.setincidentassignedto(incidentassignedto);
	        incident.setincidentcreatedby(incidentcreatedby);
	        incident.setincidentseverity_(incidentseverity_);
	        incident.setincidentpriority_(incidentpriority_);
	      	        
				       
	        message = incident.updateIncidentInFile() + "<br>";
	        
	        message += 	
       			"Incident id " + incident.getincidentid() + "<br>" +
       			"Incident title " + incident.getincidenttitle() + "<br>" + 
       			"Incident decription " + incident.getincidentdescription() + "<br>" + 
					"Incident prority " + incident.getincidentpriority() + "<br>" +
					"Incident date created " + incident.getincidentdatecreated() + "<br>" + 
					"Incident resolved userid " + incident.getincidentresolveduserid() + "<br>";	        
     	
	}
	   
	if (request.getParameter("incidentsid")!=null ||  request.getParameter("incidentupdate") !=null )
	{

		Incidents incidents = new Incidents();
		incidents.getincidentbyid(Integer.parseInt(request.getParameter("incidentsid")) );

        for(Object[] str: incidents.getincidents())	
		{
        	        
        	incidentsid = Integer.parseInt(str[0].toString());
        	incidentstitle = str[1].toString();
        	incidentsdescription = str[2].toString();
        	incidentdescriptiondetail = str[3].toString();
        	
        	incidentpriority = str[4].toString();
	       	incidentdatecreated = str[5].toString().replace(" ", "T");
	        incidentdateresolved = str[6].toString().replace(" ", "T");
        	
        	incidentcreateuserid = Integer.parseInt(str[7].toString()); 
        	incidentresolveuserid = str[8].toString();     	

        	incidentassignedto = str[9].toString();
        	incidentcreatedby = str[10].toString();
        	incidentseverity_ = str[11].toString();
        	incidentpriority_ =  str[12].toString();

  	        
        	
		}
	}
	
    	
        if ("1".equals(request.getParameter("incidentadd")) && "POST".equalsIgnoreCase(request.getMethod()))  
    	{
    	
        	

        	incidentassignedto = request.getParameter("incidentassignedto");
        	incidentcreatedby = request.getParameter("incidentcreatedby");
        	incidentseverity_ = request.getParameter("incidentseverity_");
        	incidentpriority_ =  request.getParameter("incidentpriority_");

	    	incidentsid = Integer.parseInt(request.getParameter("incidentid"));
	        incidentstitle = request.getParameter("incidenttitle");
	        incidentsdescription = request.getParameter("incidentdescription");
	        incidentdescriptiondetail =  request.getParameter("incidentdescriptiondetail");
	        
	        incidentpriority = request.getParameter("incidentpriority");

	        incidentcreateuserid = Integer.parseInt( request.getParameter("incidentcreateuserid"));
	        incidentresolveuserid =  request.getParameter("incidentresolveuserid");
	        
	        incidentdatecreated = request.getParameter("incidentdatecreated").replace("T", " ");
	        incidentdateresolved = request.getParameter("incidentdateresolved").replace("T", " ");
	        	        
	        Incidents incident = new Incidents();
	        incident.setincidentid(incidentsid);
	        incident.setincidenttitle(incidentstitle);
	        incident.setincidentdescription(incidentsdescription);
			incident.setincidentdescriptiondetail(incidentdescriptiondetail);
	        incident.setincidentpriority(incidentpriority); 	        
            incident.setincidentdatecreated(incidentdatecreated);
            incident.setincidentdateresolved(incidentdateresolved);
	        
	        incident.setincidentcreateuserid(incidentcreateuserid);
	        incident.setincidentresolveduserid(incidentresolveuserid);
	        
	        incident.setincidentassignedto(incidentassignedto);
	        incident.setincidentcreatedby(incidentcreatedby);
	        incident.setincidentseverity_(incidentseverity_);
	        incident.setincidentpriority_(incidentpriority_);
	        
	    
	        message = incident.addincidenttofile() + "<br>";
	        
	        message += 	
        			"Incident id " + incident.getincidentid() + "<br>" +
        			"Incident title " + incident.getincidenttitle() + "<br>" + 
        			"Incident decription " + incident.getincidentdescription() + "<br>" + 
					"Incident prority " + incident.getincidentpriority() + "<br>" +
    				"Resolved " + request.getParameter("incidentdateresolved").replace("T", " ")			+ "<br>" ;
    	}
    	
    	
        
    
    
    
    
		%>





		<%@ include file="header.jsp" %>  
		
		<%@ include file="menu.jsp" %>  
		
		
		
		<h1> incidents   </h1>
		
		
		
		<% if  ("1".equals(request.getParameter("incidentadd")))   { %>
		
		
			<form action="incident.jsp" method="POST" class="form">
				
				<div>
			  		<label for="message"> <%= message %> </label> <br> <hr>
				</div>
			
			
			
			
			   <label for="incidentassignedto">Incident assigned To</label>   	<br><br>                   
			   <select id="incidentassignedto" name="incidentassignedto" required>
			   			<option value="">select</option>
			        	<option value="clim29@uic.edu">clim29@uic.edu</option>
			            <option value="cliang40@uic.edu">cliang40@uic.edu</option>
			            <option value="vjonej2@uic.edu">vjonej2@uic.edu</option>
			   </select>
			
				<br><br>
			
			   <label for="incidentcreatedby">Incident created By</label>	<br><br>
			   <select id="incidentcreatedby" name="incidentcreatedby" required>
			   		   <option value="">select</option>	
					   <option value="clim29@uic.edu">clim29@uic.edu</option>
			           <option value="cliang40@uic.edu">cliang40@uic.edu</option>
			           <option value="vjonej2@uic.edu">vjonej2@uic.edu</option>
			   </select>
				<br><br>              
			                            
			   <label for="incidentseverity_">incident severity</label>	<br><br>
			   
			   <select id="incidentseverity_" name="incidentseverity_" required>
					   <option value="">select</option>
			           <option value="outage">outage - critical </option>
			           <option value="major">major modify - non-critical</option>
			           <option value="minor">minor modify - non-critical</option>
			   </select>
				<br><br>	         
			   
			   <label for="incidentpriority_">incident priority</label> <br><br>
			    
			   <select id="incidentpriority_" name="incidentpriority_" required>
			           <option value="">select</option>
			           <option value="veryhigh">veryhigh</option>
			           <option value="high">high</option>
			           <option value="medium">medium</option>
			   </select>
			             
				<br><br>	         
			
			
			
			
			  <label for="incidentdatecreated">incident date created: </label><br><br>
			  <input type="datetime-local" id="incidentdatecreated" name="incidentdatecreated" placeholder="dateformat 2024-11-10 10:20:30" required><br><br>
			  
			  <label for="incidentid">incident:</label> <br><br>
			  <input type="text" id="incidentid" name="incidentid" placeholder="incident id" required><br><br>
			
			
			  <label for="incidenttitle">incident title:</label> <br><br>
			  <input type="text" id="incidenttitle" name="incidenttitle"  placeholder="incident title" required><br><br>
			
			
			  <label for="incidentdescription">incident description:</label> <br><br>
			  <input type="text" id="incidentdescription" name="incidentdescription" placeholder="incident description" required> <br><br>
			
			  
			  <label for="incidentdescriptiondetail">incident detail description:</label> <br><br>  
			  <textarea id="incidentdescriptiondetail" name="incidentdescriptiondetail" rows="4" cols="50"> Enter your comments here </textarea> <br><br>
			
			  
						
			  <button type="submit"  style="width:auto;">Submit </button>
			
			  <input type="hidden" id="incidentcreateuserid" name="incidentcreateuserid"  placeholder="incidentcreateuserid" value=1><br><br>
			  <input type="hidden" id="incidentresolveuserid" name="incidentresolveuserid"  placeholder="incidentresolveuserid" value=1><br><br>
			  <input type="hidden" id="incidentdateresolved" name="incidentdateresolved" placeholder="dateformat 2024-11-10 10:20:30"><br><br>
			  <input type="hidden" id="incidentpriority" name="incidentpriority"  placeholder="incident priority" required> <br><br>
			  <input type="hidden" id="incidentadd" name="incidentadd" value=1 required>	<br><br>
			  
			
			
			</form>
			  
		<% } %>  
		
		<% if (request.getParameter("incidentsid") !=null) { %>
		
			
			<form action="incident.jsp?incidentsid=<%= incidentsid %>" method="POST" class="form">
				
				<div>
			  		<label for="message"> <%= message %> </label> <br> <hr>
				</div>
			
			
			  <label for="incidentresolveuserid">incident resolved by:</label>	<br><br>  
			  <select id="incidentresolveuserid" name="incidentresolveuserid" required>
			   			<option value="">select</option>
			        	<option value="clim29@uic.edu" <%= incidentresolveuserid.equals("clim29@uic.edu") ? "selected" : "" %>>clim29@uic.edu</option>
			            <option value="cliang40@uic.edu" <%= incidentresolveuserid.equals("cliang40@uic.edu") ? "selected" : "" %>>cliang40@uic.edu</option>
			            <option value="vjonej2@uic.edu" <%= incidentresolveuserid.equals("vjonej2@uic.edu") ? "selected" : "" %>>vjonej2@uic.edu</option>
			  </select>
			  
			  
			  <input type="hidden" id="incidentresolveuserid" name="incidentresolveuserid" value=<%= incidentresolveuserid %> required><br><br>
			
			  <label for="incidentdateresolved">incident date resolved:</label>	<br><br>  
			  <input type="datetime-local" id="incidentdateresolved" name="incidentdateresolved" value=<%= incidentdateresolved %>   placeholder="dateformat 2024-11-10 10:20:30" required><br><br>
			
			   <label for="incidentassignedto">Incident assigned To</label>   	<br><br>                   
			   <select id="incidentassignedto" name="incidentassignedto" required>
			   			<option value="">select</option>
			        	<option value="clim29@uic.edu" <%= incidentassignedto.equals("clim29@uic.edu") ? "selected" : "" %>>clim29@uic.edu</option>
			            <option value="cliang40@uic.edu" <%= incidentassignedto.equals("cliang40@uic.edu") ? "selected" : "" %>>cliang40@uic.edu</option>
			            <option value="vjonej2@uic.edu" <%= incidentassignedto.equals("vjonej2@uic.edu") ? "selected" : "" %>>vjonej2@uic.edu</option>
			   </select>
			
				<br><br>
			
			   <label for="incidentcreatedby">Incident created By</label>	<br><br>
			   <select id="incidentcreatedby" name="incidentcreatedby" required>
			   		   <option value="">select</option>	
					   <option value="clim29@uic.edu" <%= incidentcreatedby.equals("clim29@uic.edu") ? "selected" : "" %>>clim29@uic.edu</option>
			           <option value="cliang40@uic.edu" <%= incidentcreatedby.equals("cliang40@uic.edu") ? "selected" : "" %>>cliang40@uic.edu</option>
			           <option value="vjonej2@uic.edu" <%= incidentcreatedby.equals("vjonej2@uic.edu") ? "selected" : "" %>>vjonej2@uic.edu</option>
			   </select>
				<br><br>              
			                            
			   <label for="incidentseverity_">incident severity</label>	<br><br>
			   
			   <select id="incidentseverity_" name="incidentseverity_" required>
					   <option value="">select</option>
			           <option value="outage" <%= incidentseverity_.equals("outage") ? "selected" : "" %>>	outage - critical 			</option>
			           <option value="major" <%= incidentseverity_.equals("major") ? "selected" : "" %>>	major modify - non-critical	</option>
			           <option value="minor"  <%= incidentseverity_.equals("minor") ? "selected" : "" %>>	minor modify - non-critical	</option>
			   </select>
				<br><br>	         
			   
			   <label for="incidentpriority_">incident priority</label> <br><br>    
			   <select id="incidentpriority_" name="incidentpriority_" required>
			           <option value="">select</option>
			           <option value="veryhigh" <%= incidentpriority_.equals("veryhigh") ? "selected" : "" %>>veryhigh</option>
			           <option value="high" <%= incidentpriority_.equals("high") ? "selected" : "" %>>high</option>
			           <option value="medium" <%= incidentpriority_.equals("medium") ? "selected" : "" %>>medium</option>
			   </select>
			             
				<br><br>	         
			
			  <label for="incidentdatecreated">incident date create:</label><br><br>
			  <input type="datetime-local" id="incidentdatecreated" name="incidentdatecreated" placeholder="dateformat 2024-11-10 10:20:30" value="<%= incidentdatecreated %>" required><br><br>
			
					
			  <label for="incidents">incident:</label>	
			  <label for="incidentsid" value="<%= incidentsid %>"><%= incidentsid %> </label><br><br>
			
			  <label for="incidenttitle">incident title:</label>
			  <input type="text" id="incidenttitle" name="incidenttitle"  value=<%= incidentstitle %> required><br><br>
			
			  <label for="incidentdescription">incident description:</label>
			  <input type="text" id="incidentdescription" name="incidentdescription" value=<%= incidentsdescription %> required><br><br>
			
			  <label for="incidentdescriptiondetail">incident description detail:</label><br> <br>
			  <textarea id="incidentdescriptiondetail" name="incidentdescriptiondetail" rows="4" cols="50"> <%= incidentdescriptiondetail %> </textarea> <br><br>
			
			  <input type="hidden" id="incidentpriority" name="incidentpriority" value=<%= incidentpriority %> required><br><br>
			
			
			  <input type="hidden" id="incidentcreateuserid" name="incidentcreateuserid" value=<%= incidentcreateuserid %> required><br><br>
			
			
			
			  <button type="submit"  style="width:auto;">Submit </button>
			  
			
			  <input type="hidden" id="id" name="id" value=<%= incidentsid %> required><br><br>	
			  <input type="hidden" id="incidentadd" name="incidentadd" value=0 required><br><br> 		
			  <input type="hidden" id="incidentupdate" name="incidentupdate" value=1 required><br><br>
			  
			
			</form>

			  
		<%} %>      
		
		
		
		
		
		

		<%@include file="footer.jsp" %>


</div>


</body>
</html>




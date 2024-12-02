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
<title>search</title>
</head>
<body>


<% 	
		Incidents incidents = new Incidents();
	    incidents.viewincidents();
	    Iterator<Object[]> iterator = incidents.getincidents().iterator();	
	
	%>  		
				
	
		<div id="mobile-container" class="mobile-container">
				
				
				<input type="text" id="mobile-search" placeholder="Search incidents.." onkeyup="filterMobileIncidents()" >
	
					
				
				<% while(iterator.hasNext()){ %>
					<% Object[] str = iterator.next(); %>
					<% int incidentid = Integer.parseInt( str[0].toString() ) ; %>
				
					<div class="incident-item">
						<h3> Incident# <% out.println(str[0].toString()); %> </h3>
						<p> title	 <% out.println(str[1].toString()); %></p>
						<p> date	 <% out.println(str[5].toString()); %></p>
						<p> date	 <% out.println(str[6].toString()); %></p>
						<p> assigned		 <% out.println(str[9].toString()); %> </p>
						<p> created		 <% out.println(str[10].toString()); %> </p>
						<p> severity		 <% out.println(str[11].toString()); %></p>
						<p> priority		 <% out.println(str[12].toString()); %></p>							
							<form action="incident.jsp?incidentsid=<%= incidentid %>" method="POST">
   								<button id="button" type="submit" onclick="">View</button>
							</form>
					
					</div>
					<%  } %>
					
					<div id="pagination-summary"></div>
					
					<div id="pagination-controls">
						<button id="previous-button" onclick="previouspage()">previous</button>
						<span id="pageinformation"></span>
						<button id="nextbutton" onclick="nextpage()">next</button>
					</div>
								
	  </div>
	
</body>
</html>
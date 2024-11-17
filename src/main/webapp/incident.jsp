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
java.time.LocalDateTime, 
java.text.SimpleDateFormat, 
java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> VCL helpdesk application | login | Incidents | Users  </title>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}

/* Full-width input fields */
input[type=text], input[type=email],input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  border: 1px solid black;
  background-color: #f44336; /* Fallback color */
  background-color: #f44336; /* Black w/ opacity */
  padding-top: 60px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Block (background) */
.block {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>



 <style>
      button {
        background-color: red;
        border-radius: 10px;
        border: 4px double #cccccc;
        color: #eeeeee;
        text-align: center;
        font-size: 28px;
        padding: 20px;
        width: 200px;
        margin: 5px;
      }
      
      
      
      
      
      #wrapper {
	border: 0px solid #000;
	width: 90%;
	height: 90%;
	margin: 50px 50px 50px 50px ;
	padding: 10px 10px 10px 10px;
	align: center;
	max-width: 500px;
	margin: auto;
}
	
	
	
	
    </style>


<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Remove extra left and right margins, due to padding */
.row {margin: 0 -5px;}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive columns */
@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}

/* Style the counter cards */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
</style>

<style>
body {margin:0;}

.icon-bar {
  width: 100%;
  background-color: #555;
  overflow: auto;
}

.icon-bar a {
  float: left;
  width: 20%;
  text-align: center;
  padding: 12px 0;
  transition: all 0.3s ease;
  color: white;
  font-size: 36px;
}

.icon-bar a:hover {
  background-color: #000;
}

.active {
  background-color: #04AA6D;
}
</style>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
<% 
	
	int incidentsid=0;
	String incidentstitle = "";
	String incidentsdescription = "";
	String incidentdescriptiondetail ="";
	String incidentpriority = "";
    
    int incidentcreateuserid=0;
    int incidentresolveuserid=0;
    
    String incidentdatecreated  = "";
    String incidentdateresolved = "1999-01-01 00:00:00";

	String message = "";
	int id = 0; 
	int update = 0;

	if (request.getParameter("incidentsid")!=null)
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
//	        	incidentdatecreated = LocalDateTime.parse(str[5].toString(), formatter);
//	        	incidentdateresolved = LocalDateTime.parse(str[6].toString(), formatter);
        	
        	incidentcreateuserid = Integer.parseInt(str[7].toString()); 
        	incidentresolveuserid = Integer.parseInt(str[8].toString());     	

			
		}
	}
	
    if (request.getMethod().equalsIgnoreCase("POST")) {
		
        if ("1".equals(request.getParameter("incidentupdate"))) 
    	{
        	
      		try{      
    		incidentsid 			= 	Integer.parseInt(request.getParameter("incidentid"));
	        incidentstitle 			= 	request.getParameter("incidenttitle");
	        incidentsdescription 	= 	request.getParameter("incidentdescription");
	        incidentpriority 		= 	request.getParameter("incidentpriority");
	        incidentcreateuserid 	= 	Integer.parseInt(request.getParameter("incidentcreateuserid"));
	        incidentresolveuserid 	=	Integer.parseInt( request.getParameter("incidentresolveuserid"));	       
	        incidentdatecreated 		= 	request.getParameter("incidentdatecreated");
	        incidentdateresolved		= 	request.getParameter("incidentdatecreated");
	        
	        Incidents incident = new Incidents();
	        incident.setincidentid(incidentsid);
	        incident.setincidenttitle(incidentstitle);
	        incident.setincidentdescription(incidentsdescription);
	        incident.setincidentpriority(incidentpriority); 
	        incident.setincidentdatecreated(incidentdatecreated);
	        incident.setincidentdateresolved(incidentdateresolved);
	        
	        incident.setincidentcreateuserid(incidentcreateuserid);
	        incident.setincidentresolveduserid(incidentresolveuserid);
	        
	        message = incident.updateIncidentInFile(incident.getincidentid(), incident.getincidenttitle(), incident.getincidentdescription(), incident.getincidentpriority(), incident.getincidentdatecreated(), incident.getincidentdateresolved(), incident.getincidentcreateduserid(), incident.getincidentresolveduserid()) + "<br>";
	        
	        message += 	
        			"Incident id " + incident.getincidentid() + "<br>" +
        			"Incident title " + incident.getincidenttitle() + "<br>" + 
        			"Incident decription " + incident.getincidentdescription() + "<br>" + 
					"Incident prority " + incident.getincidentpriority() + "<br>" +
					"Incident date created " + incident.getincidentdatecreated() + "<br>" + 
					"Incident resolved userid " + incident.getincidentresolveduserid() + "<br>";	        
      		}
      	    catch (NumberFormatException e) {
      	    	message = "Invalid number format. Using default value.";
      		}
    	}
    	
    	
        if ("1".equals(request.getParameter("incidentadd"))) 
    	{
    		
	    	incidentsid = Integer.parseInt(request.getParameter("incidentid"));
	        incidentstitle = request.getParameter("incidenttitle");
	        incidentsdescription = request.getParameter("incidentdescription");
	        incidentdescriptiondetail =  request.getParameter("incidentdescriptiondetail");
	        
	        incidentpriority = request.getParameter("incidentpriority");

	        incidentcreateuserid = Integer.parseInt(request.getParameter("incidentcreateuserid"));
	        incidentresolveuserid =Integer.parseInt( request.getParameter("incidentresolveuserid"));
	        
	        incidentdatecreated = request.getParameter("incidentdatecreated").replace("T", " ");
	        incidentdateresolved = request.getParameter("incidentdateresolved").replace("T", " ");
	        	        
	        Incidents incident = new Incidents();
	        incident.setincidentid(incidentsid);
	        incident.setincidenttitle(incidentstitle);
	        incident.setincidentdescription(incidentsdescription);
			incident.setincidentdescriptiondetail(incidentdescriptiondetail);
	        incident.setincidentpriority(incidentpriority); 	        
            incident.setincidentdatecreated(incidentdatecreated.toString());
            incident.setincidentdateresolved(incidentdateresolved);
	        
	        incident.setincidentcreateuserid(incidentcreateuserid);
	        incident.setincidentresolveduserid(incidentresolveuserid);
	        
	        
	        message = incident.addincidenttofile() + "<br>";
	        
	        message += 	
        			"Incident id " + incident.getincidentid() + "<br>" +
        			"Incident title " + incident.getincidenttitle() + "<br>" + 
        			"Incident decription " + incident.getincidentdescription() + "<br>" + 
					"Incident prority " + incident.getincidentpriority() + "<br>" +
    				"Resolved " + request.getParameter("incidentdateresolved").replace("T", " ")			+ "<br>" ;
    	}
    	
    	
        if ("1".equals(request.getParameter("incidentedit"))) 
    	{

        	/*
    		id = Integer.parseInt(request.getParameter("id"));
            
    		if (id != 0) 
    		{
        	  	    
        		Incidents incidents = new Incidents();
        		incidents.editincidents(Integer.parseInt(request.getParameter("id")) );

    	        for(Object[] str: incidents.getincidents())	
    			{
    	        	
    	        	incidentsid = Integer.parseInt(str[0].toString());
    	        	incidentstitle = str[1].toString();
    	        	incidentsdescription = str[2].toString();
    	        	incidentdescriptiondetail = str[3].toString();
    	        	
    	        	incidentpriority = str[4].toString();
    //	        	incidentdatecreated = LocalDateTime.parse(str[5].toString(), formatter);
    //	        	incidentdateresolved = LocalDateTime.parse(str[6].toString(), formatter);
    	        	
    	        	incidentcreateuserid = Integer.parseInt(str[7].toString()); 
    	        	incidentresolveuserid = Integer.parseInt(str[8].toString());     	
    	        	
    			}
    			
        	*/

    		}
        
    }
    
    
    
%>




<div id="wrapper">

<%@ include file="header.jsp" %>  

<div>
 
incidents |
<a href="incidents.jsp">incidents</a> | 
<a href="incident.jsp?incidentadd=1">Create a new incident</a> | 

<a href="create-account.jsp">Create a new customer</a> | 
<a href="customer.jsp">customers</a> | 




<hr />

</div>


<div class="row">
<div class="column">


<h1> incidents   </h1>




<% if  ("1".equals(request.getParameter("incidentadd")))   { %>

<form action="incident.jsp" method="POST">
	
	<div style="background-color:lightblue; ">
  		<label for="message"> <%= message %> </label> <br> <hr>
	</div>


  <label for="incidentcreateuserid">incident create by:</label>
  <input type="text" id="incidentcreateuserid" name="incidentcreateuserid"  placeholder="incidentcreateuserid" required><br><br>


  <label for="incidentdatecreated">incident date created: </label><br><br>
  <input type="datetime-local" id="incidentdatecreated" name="incidentdatecreated" placeholder="dateformat 2024-11-10 10:20:30" required><br><br>

  <label for="incidentresolveuserid">incident resolved by: </label>
  <input type="text" id="incidentresolveuserid" name="incidentresolveuserid"  placeholder="incidentresolveuserid" required><br><br>
  <input type="datetime-local" id="incidentdateresolved" name="incidentdateresolved" placeholder="dateformat 2024-11-10 10:20:30" required><br><br>
  
  <label for="incidents">incident:</label>
  <input type="text" id="incidentid" name="incidentid" placeholder="incident id" required><br><br>
  <label for="incidenttitle">incident title:</label>
  <input type="text" id="incidenttitle" name="incidenttitle"  placeholder="incident title" required><br><br>
  <label for="incidentdescription">incident description:</label>
  <input type="text" id="incidentdescription" name="incidentdescription" placeholder="incident description" required><br><br>
  
  <label for="incidentdescriptiondetail">incident description:</label>
  <input type="text" id="incidentdescriptiondetail" name="incidentdescriptiondetail"  placeholder="incident incidentdescriptiondetail" required><br><br>

  <label for="incidentpriority">incident priority:</label>
  <input type="text" id="incidentpriority" name="incidentpriority"  placeholder="incident priority" required><br><br>



  <input type="hidden" id="incidentadd" name="incidentadd" value=1 required><br><br>
  

			
  <button type="submit"  style="width:auto;">Submit </button>

</form>
  
<% } %>  

<% if (request.getParameter("incidentsid") !=null) { %>

<form action="incident.jsp" method="POST">
	
	<div style="background-color:lightblue; ">
  		<label for="message"> <%= message %> </label> <br> <hr>
	</div>
	
  <label for="incidents">incident:</label>
  <input type="text" id="incidentid" name="incidentid"  value=<%= incidentsid %> required><br><br>
  <label for="incidenttitle">incident title:</label>
  <input type="text" id="incidenttitle" name="incidenttitle"  value=<%= incidentstitle %> required><br><br>
  <label for="incidentdescription">incident description:</label>
  <input type="text" id="incidentdescription" name="incidentdescription" value=<%= incidentsdescription %> required><br><br>

  <label for="incidenttitle">incident description:</label>
  <input type="text" id="incidentdescription" name="incidentdescription"  value=<%= incidentsdescription %> required><br><br>

  <label for="incidentpriority">incident priority:</label>
  <input type="text" id="incidentpriority" name="incidentpriority" value=<%= incidentpriority %> required><br><br>

  <label for="incidentdatecreated">incident date create:</label>
  <input type="text" id="incidentdatecreated" name="incidentdatecreated" value=<%= incidentdatecreated %> required><br><br>



  <label for="incidentcreateuserid">incident created by:</label>
  <input type="text" id="incidentcreateuserid" name="incidentcreateuserid" value=<%= "incidentcreateuserid" %> required><br><br>

  <label for="incidentresolveuserid">incident assigned :</label>
  <input type="text" id="incidentresolveuserid" name="incidentresolveuserid" value=<%= incidentresolveuserid %> required><br><br>



  <button type="submit"  style="width:auto;">Submit </button>
  
  <input type="hidden" id="id" name="id" value=<%= incidentsid %> required><br><br>	
  <input type="hidden" id="incidentadd" name="incidentadd" value=0 required><br><br> 		
  <input type="hidden" id="incidentedit" name="incidentedit" value=0 required><br><br>	
  <input type="hidden" id="incidentupdate" name="incidentupdate" value=1 required><br><br>
  

</form>
  
<%} %>      



<% if ("1".equals(request.getParameter("incidentupdate"))) { %>



<form action="incident.jsp" method="POST">
	
	<div style="background-color:lightblue; ">
  		<label for="message"> <%= message %> </label> <br> <hr>
	</div>
	
  <label for="incidents">incident:</label>
  <input type="text" id="incidentid" name="incidentid" value=<%= incidentsid %> required><br><br>
  <label for="incidenttitle">incident title:</label>
  <input type="text" id="incidenttitle" name="incidenttitle"  value=<%= incidentstitle %> required><br><br>
  <label for="incidentdescription">incident description:</label>
  <input type="text" id="incidentdescription" name="incidentdescription" value=<%= incidentsdescription %> required><br><br>
  
  <label for="incidentdescriptiondetail">incident description:</label>
  <input type="text" id="incidentdescriptiondetail" name="incidentdescriptiondetail"  value=<%= incidentsdescription %> required><br><br>

  <label for="incidentpriority">incident priority:</label>
  <input type="text" id="incidentpriority" name="incidentpriority" value=<%= incidentpriority %> required><br><br>

  <label for="incidentdatecreated">incident datecreated:</label>
  <input type="text" id="incidentdatecreated" name="incidentdatecreated" value=<%= incidentdatecreated %> required><br><br>

  <label for="incidentcreateuserid">incident create uname:</label>
  <input type="text" id="incidentcreateuserid" name="incidentcreateuserid" value=<%= incidentcreateuserid %> required><br><br>

  <label for="incidentresolveuserid">incident resolve uname:</label>
  <input type="text" id="incidentresolveuserid" name="incidentresolveuserid" value=<%= incidentresolveuserid %> required><br><br>


  <button type="submit"  style="width:auto;">Submit </button>
  <input type="hidden" id="id" name="id" value=<%= incidentsid %> required><br><br>	
  <input type="hidden" id="incidentadd" name="incidentadd" value=0 required><br><br> 		
  <input type="hidden" id="incidentedit" name="incidentedit" value=0 required><br><br>	
  <input type="hidden" id="incidentupdate" name="incidentupdate" value=1 required><br><br>
  

</form>

<% } %>







</div>
</div>





</body>
</html>




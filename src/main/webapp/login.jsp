
<%@page import="ithelpdesk.login, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>login </title>


<link rel="icon" type="image/x-icon" href="images/vcl__helpdesk_ico.ico">

<link rel="stylesheet" href="header.css"> 
<link rel="stylesheet" href="style.css"> 

<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>

<div class="container">

		<%@include file="header.jsp" %>

		<% 
			
		
			String loggedinuser = (objectsession != null && objectsession.getAttribute("loggedinuser") != null) 
							? objectsession.getAttribute("loggedinuser").toString() 
							: "";
		
		%>
		
			<h3> Sign in below  </h3>
			
			<form name="login" action="check-login.jsp" method="POST" class="form">
		  	
			  	<label for="email">Email:</label>
			  	<input type="email" id="email" name="email" placeholder="Enter email" value="<%= loggedinuser %>" required>
			  	<label for="pwd">Password:</label>
			  	<input type="password" id="pwd" name="pwd" minlength="8" placeholder="Enter Password" required>
			

			  	<button type="submit"  style="width:auto;">Login</button>
					
			  
			  	<br><br>
		      
			</form>

			<form>
			<input type="checkbox" checked="checked" name="rememberme"> Remember me
			    
			<div>	<span class="psw">Forgot <a href="#">password?</a></span> </div>
			</form> 	     
			
		
</div>
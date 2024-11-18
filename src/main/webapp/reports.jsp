<%@page import="ithelpdesk.Reports, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VCL ithelpdesk reports </title>
</head>
<body>
<% 
	
	int incidents = 0;
	
	Reports reports = new Reports();
	incidents = reports.countline();
	
	
%>

<p> ----------IT help desk reports ---------</p>
<p> Total number of incidents <%= incidents %> </p>


</body>
</html>

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

<%@page import="ithelpdesk.login, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>

<% 

	login lg = new login();
	
	if (lg.Authetication(request.getParameter("email"), request.getParameter("pwd"))== true)
	{
		response.sendRedirect("customer.jsp");
	}
	else{		
		response.sendRedirect("login.jsp");													
	}
	

%>  


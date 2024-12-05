
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

<%@page import="ithelpdesk.login, java.util.*, javax.servlet.http.Cookie, javax.servlet.http.HttpSession, java.io.PrintWriter"%>

<% 

	String email = request.getParameter("email");
	String password = request.getParameter("pwd");
    String rememberme = request.getParameter("rememberme");
	
	
	login lg = new login();
	
	if (lg.Authetication(email, password)== true)
	{
		HttpSession objectsession = request.getSession();
		objectsession.setAttribute("loggedinuser", email);

		
		if("on".equals(rememberme)){
			
			objectsession.setAttribute("username", email);
			
		}
		response.sendRedirect("customer.jsp");
		
	}
	else{		
		response.sendRedirect("login.jsp");													
	}
	

%>  


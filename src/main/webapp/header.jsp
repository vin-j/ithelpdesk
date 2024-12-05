<%@page import="ithelpdesk.login, 
java.util.*, 
javax.servlet.http.HttpSession, 
java.io.PrintWriter" %>

<%  

	String currentresourcelocator = request.getRequestURI();
	HttpSession objectsession = request.getSession(false);

	if(!currentresourcelocator.endsWith("login.jsp"))	
	{	
		if( objectsession == null || objectsession.getAttribute("loggedinuser") == null)
		{
		 	objectsession.setAttribute("loggedinuser", null);
		 	
			response.sendRedirect("login.jsp");
			
			
		}
		
	}	
	
%>	
<link rel="icon" type="image/x-icon" href="images/vcl__helpdesk_ico.ico">
	
    <div class="header">    
    <h1> Help Desk Application </h1>
        <img src="images/vcl-logo.gif" alt="Logo" />
	</div>


    
    
    
	



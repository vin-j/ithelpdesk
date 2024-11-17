<%@page import="ithelpdesk.Customers, java.util.*, javax.servlet.http.Cookie, java.io.PrintWriter"%>

<% 

	//instance cart class
	Customers cu = new Customers();
	
	//get values from 	
	int index = cu.ReadCustomers().size()+1;
	
	//reset
	Customers cu1 = new Customers();
	String fname= request.getParameter("firstname");	//Integer.parseInt(fields[0]);
	String lname= request.getParameter("lastname");
	String address = "address";
	String phone = "8888888888";
	String dob = "05-10-2003";
	
	//set the customers objects
	Object[] customersdetails = {index,fname,lname,address,phone,dob};
    cu1.setCustomers(customersdetails);	
    
    //write the form data to customers
    cu1.WriteCustomers();

    //redirect to customers page
	response.sendRedirect("customer.jsp");									

%>  

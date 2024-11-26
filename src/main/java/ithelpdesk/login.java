
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



package ithelpdesk;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class login {

	protected List<Object[]> stafflogin = new ArrayList<Object[]>();
	
	protected String filename= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\login.txt";
	//protected String filename= "C:\\Users\\vjone\\eclipse-workspace\\ithelpdesk\\data\\login.txt";
	
	protected String customerID = "0";
	
	public login() {
		
	}

	public List<Object[]> getLogin() {	
		return stafflogin;
	}

	public void setLogin(Object[] logindetails) {
		Object[] arr1 = logindetails;
		stafflogin.add(arr1);
	}
	
	public List<Object[]> ReadLogin(String email) throws IOException{
		
				BufferedReader in2=new BufferedReader(
				new FileReader(filename));
				String line2 = null;
				while ((line2 = in2.readLine()) != null) {
									
				String[] fields=line2.split(",");
				int staffID=Integer.parseInt(fields[0]);
				String uname= (fields[1]);
				String password= (fields[2]);
				if(uname.equalsIgnoreCase(email)) {
					Object[] customerdetails = {staffID,uname,password};
					this.setLogin(customerdetails);
				}
				}

				
				in2.close();
				return stafflogin;
				

	}

	public List<Object[]> ReadLogin() throws IOException{
		
				BufferedReader in2=new BufferedReader(
				new FileReader(filename));
				String line2 = null;
				while ((line2 = in2.readLine()) != null) {
					
				
				//line2=in2.readLine();
				//parse the line into its fields
				String[] fields=line2.split(",");
				int staffID=Integer.parseInt(fields[0]);
				String uname= (fields[1]);
				String password= (fields[2]);
				
				Object[] customerdetails = {staffID,uname,password};
				this.setLogin(customerdetails);
							
				}

				
				in2.close();
				return stafflogin;
				

	}

	public boolean Authetication(String username, String password) throws IOException {
			boolean auth = false;
			
			for(Object[] str: this.ReadLogin())	
			{
				
				if (str[1].equals(username)  && str[2].equals(password) )
				{
					System.out.println("matches");
					System.out.println(str[1] + "," +  str[2]);
					System.out.println(username + "," + password);
					customerID = str[0].toString();
					
					auth = true;
					return auth;
					
				}
				else {
					System.out.println(str[1] + "," +  str[2]);
					System.out.println(username + "," +  password);

					auth = false;
					
				}
			}
			return auth;
	}
	
}

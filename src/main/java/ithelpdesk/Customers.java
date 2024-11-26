
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
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


public class Customers {


			protected List<Object[]> customers = new ArrayList<Object[]>();
			
			protected int AccountIndex;
			protected int AccountNumber;
			protected float AccountBalance;
			protected String AccountName;
			
			protected String filename= "data\\customer.txt";

			protected String directorypath="C:\\xampp\\tomcat\\webapps\\ithelpdesk\\";
			
			
			public Customers() {
				//super();
				
			}
			
			public List<Object[]> getCustomers() {	
				return customers;
			}

			public void setCustomers(Object[] customersdetails) {
				Object[] arr1 = customersdetails;
			    customers.add(arr1);
			}

			
			public List<Object[]> ReadCustomers() throws IOException{
				
						BufferedReader in2=new BufferedReader(
						new FileReader(directorypath+filename));
						String line2 = null;
						while ((line2 = in2.readLine()) != null) {
							
						String[] fields=line2.split(",");
						int customerID=Integer.parseInt(fields[0]);
						String fname= (fields[1]);
						String lname= (fields[2]);
						String address= (fields[3]);
						long phone=Long.parseLong(fields[4]);
						String date= (fields[5]);
						
						Object[] customerdetails = {customerID,fname,lname,address, phone, date};
						this.setCustomers(customerdetails);
									
						}
	
						
						in2.close();
						return customers;
						
	
			}
			
			public void WriteCustomers() throws IOException {

				String s = directorypath;
				System.out.println("Current path is: " + s);
				
				
				String dirString=s+"/data";
				Path dirPath=Paths.get(dirString);
				if (Files.notExists(dirPath)){
				Files.createDirectories(dirPath);
				}
				System.out.println("Current path is: " + dirString);
				
				//creates file if file not available
				String fileString="customer.txt";
				Path filePath=Paths.get(dirString,fileString);
				if (Files.notExists(filePath)){
				Files.createFile(filePath);
				}

				System.out.println("Current path is: " + fileString);
				
				try {
				Path productPath= Paths.get(dirString, fileString);
				File productsFile = productPath.toFile();
				
				System.out.print(productsFile);
				
				PrintWriter out=new PrintWriter(
						new BufferedWriter(
						new FileWriter(productsFile,true)));
				
				
				//write data to file
				for(Object[] str: this.getCustomers())	
				{
					System.out.println();
					System.out.println(str[0] + "," + str[1] + "," + str[2]);
					out.println(str[0] + "," + str[1] + "," + str[2]+ "," + str[3]+ "," + str[4]+ "," + str[5] );
				}
				
				out.close();
				
				
				}
				catch(IOException e){
					System.out.print(e);
				}
				
				
				
			}

			
}

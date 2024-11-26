
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
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;



public class Reports {
	
	
	protected int reportdimensionscounters;
	protected int reportdimensionid;
	protected String reportdimensiontitle;
	
	protected List<String> lines = new ArrayList<>();

	protected int counter;
	protected List<Object[]> reports = new ArrayList<Object[]>();
	protected int reportid;
	protected String reporttitle;
	protected String reportdescription;
	protected String reportdescriptiondetail;
	protected String reportpriority;
	protected String reportdatecreated;
	protected String reportdateresolved;
	protected int reportcreateduserid;
	protected int reportresolveduserid;
	
	protected static String filepath = "";
	
	protected static String incidentsreportsfilepath = "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsreports.txt";
	protected static String incidentsreportsfilepathnew = "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsreportsnew.txt";

	protected static String incidentsfilepath= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsfile.txt";
	protected static String loginfilepath= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\login.txt";
	protected static String customersfilepath= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\customer.txt";
	protected static String reportsfilepath= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\reportsfile.txt";
	
	
	
	public void reportincidents() throws IOException 
	{	
		BufferedReader in =new BufferedReader(
		new FileReader(incidentsreportsfilepath));
		String line = null;
		while ((line = in.readLine()) != null) 
		{
									
			lines.add(line);
		
		}
		
	}
	

	public Reports() {
		
	}
	
	
	public void setreports(Object[] reportline) {
		Object[] reportlines = reportline;
	    reports.add(reportlines);
	}

	
	
	public List<Object[]> viewincidentsreports() throws IOException, ParseException{
		
		BufferedReader in = new BufferedReader(
		new FileReader(incidentsreportsfilepathnew));
		String line = null;
		while ((line = in.readLine()) != null) {
			
			String[] fields=line.split(",");			
			
			reportid			=   Integer.parseInt(fields[0]);
			reporttitle		= 		fields[1];
			counter			= 		Integer.parseInt(fields[2]);
			
			Object[] reportline = {reportid,reporttitle,counter};
			this.setreports(reportline);
		
		}
		
		in.close();
		return reports;
		
	}


	public List<Object[]> viewreports() throws IOException, ParseException{
		
				BufferedReader in = new BufferedReader(
				new FileReader(reportsfilepath));
				String line = null;
				while ((line = in.readLine()) != null) {
					
					String[] fields=line.split(",");			
					
					reportid			=   Integer.parseInt(fields[0]);
					reporttitle		= 	fields[1];
					reportdescription	= 	fields[2];
					reportdescriptiondetail = fields[3];
					reportpriority 	= 	fields[4];
				    
					reportdatecreated = 	fields[5].toString();
					reportdateresolved =  fields[6].toString();
					
					reportcreateduserid = Integer.parseInt(fields[7]);						
					reportresolveduserid = Integer.parseInt(fields[8]);
					
					Object[] reportline = {reportid,reporttitle,reportdescription, reportdescriptiondetail, reportpriority,reportdatecreated,reportdateresolved, reportcreateduserid, reportresolveduserid };
					this.setreports(reportline);
				
				}
				
				in.close();
				return reports;
				
	}


	
	
	public void getIncidentsReport() throws IOException, ParseException 
	{
		
		BufferedReader in =	new BufferedReader(
								new FileReader(incidentsreportsfilepathnew));
		String line = null;
		while ((line = in.readLine()) != null) 
		{

			String[] fields		=	line.split(",");
					line 		= 	reportdimensionid + "," + 
									reportdimensiontitle  + "," +
									reportdimensionscounters ;
					
					lines.add(line);
	
		} 
	}	

	public int getReport(int reportsid) throws FileNotFoundException 
	{

		if (reportsid == 1) {
			filepath = incidentsfilepath; 
		}
		if (reportsid == 2) {
			filepath = loginfilepath;
		}
		if (reportsid == 3) {
			filepath = customersfilepath ;
		} 
	
		if (reportsid == 4) {
			filepath = reportsfilepath;
		}
		
		int linecount=0;
		BufferedReader in = new BufferedReader(
				new FileReader(filepath));
		
				String line = null;
				try {
					while ((line = in.readLine()) != null) {
						linecount++;
					}
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return linecount;
	
	
	}
	
}



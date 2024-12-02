
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

import java.io.*;

public class Calculator{
	
			protected String incidentsfile= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsfile.txt";
			protected String incidentsreportsfilepath = "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsreports.txt";
			protected String incidentsreportsfilepathnew = "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsreportsnew.txt";

			protected int totalIncidents;
			protected int incidentsbyseverity;
			protected int incidentsbypriority; 
			
			public void calculateMetrics() throws IOException 
			{
		        int totalIncidents = 0;
		        int outageCount = 0;
		        int majorCount = 0;
		        int minorCount = 0;
		        int priorityveryhighCount = 0,priorityhighCount=0,prioritymediumCount=0,prioritylowCount=0 ;
		        
		        		BufferedReader in =new BufferedReader(
						new FileReader(incidentsfile));
						String line = null;
						while ((line = in.readLine()) != null) 
						{
							String[] fields		=	line.split(",");
							
							switch (fields[11].toLowerCase()) {
			                	case "outage":
			                		outageCount++;
			                		break;
			                	case "major":
			                		majorCount++;
			                		break;
			                	case "minor":
			                		minorCount++;
			                		break;
			                	default:
			                		break;
							}
							
							switch (fields[12].toLowerCase()) {
		                		case "veryhigh":
		                			priorityveryhighCount++;
		                			break;
		                		case "high":
		                			priorityhighCount++;
		                			break;
		                		case "medium":
		                			prioritymediumCount++;
		                			break;
		                		case "low":
		                			prioritylowCount++;
		                			break;
	
		                		default:
		                			break;
							}
							
							totalIncidents++;
						}
				
						PrintWriter writer = new PrintWriter(new FileWriter(incidentsreportsfilepathnew)); 
						writer.println("1" + "," + "Number of Incidents: " 	+ "," + totalIncidents);
						writer.println("2" + "," + "Number of Outages: " 	+ "," + outageCount);
						writer.println("3" + "," + "Number of Major Incidents: " + "," + majorCount);
						writer.println("4" + "," + "Number of Minor Incidents: " + "," + minorCount);
						writer.println("5" + "," + "Number of Minor Incidents: " + "," + minorCount);
						
						writer.close();
				
			}
}

			       

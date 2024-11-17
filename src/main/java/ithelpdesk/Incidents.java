
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.LocalDateTime;


public class Incidents{
	
	private int incidentid;
	private String incidenttitle;
	private String incidentdescription;
	private String incidentdescriptiondetail;
	private String incidentpriority;
	private String incidentdatecreatedconversion;
	private String incidentdatecreated;
	private String incidentdateresolved;
	
	private int incidentcreateduserid;
	private int incidentresolveduserid;

    
	private List<String> lines = new ArrayList<>();
	private List<Object[]> incidents = new ArrayList<Object[]>();
	private List<String[]> incident;
	private String incidentsfile= "C:\\Users\\vjone\\eclipse-workspace\\ithelpdesk\\data\\incidentsfile.txt";
	
	
	public Incidents()
	{
		
	}
	
	public Incidents(int incidentid, String incidenttitle, String incidentdescription, String incidentpriority, String incidentdatecreated, String incidentdateresolved, int incidentcreateduserid, int incidentresolveuserid ) 
	{
	
			this.incidentid = incidentid;
			this.incidenttitle = incidenttitle;
			this.incidentdescription = incidentdescription;
			this.incidentpriority = incidentpriority;
			this.incidentdatecreated = incidentdatecreated; 
			this.incidentdateresolved = incidentdateresolved;
			this.incidentcreateduserid = incidentcreateduserid;
			this.incidentresolveduserid = incidentresolveuserid;
		
	}
	
	
	
	public int getincidentid() {
		return incidentid;
	}
	
	public void setincidentid(int incidentid) {
		this.incidentid = incidentid;
	}
	
	public String getincidenttitle() {
		return incidenttitle;
	}
	
	public void setincidenttitle(String incidenttitle) {
		this.incidenttitle = incidenttitle;
	}
	
	
	public String getincidentdescription() {
		return incidentdescription;
	}
	
	public void setincidentdescription(String incidentdescription) {
		this.incidentdescription = incidentdescription;
	}
	

	public String getincidentdescriptiondetail() {
		return incidentdescription;
	}
	
	public void setincidentdescriptiondetail(String incidentdescriptiondetail) {
		this.incidentdescriptiondetail = incidentdescriptiondetail;
	}
	

	
	public String getincidentpriority() {
		return incidentpriority;
	}
	
	public void setincidentpriority(String incidentpriority){
		this.incidentpriority = incidentpriority;
	}
	
	public String getincidentdatecreated() {
		return incidentdatecreated;
	}
	
	public void setincidentdatecreated(String datecreated) {
		this.incidentdatecreated = datecreated;
	}
	
	
	public String getincidentdateresolved() {
		return incidentdateresolved;
	}
	
	public void setincidentdateresolved(String dateresolved) {
		this.incidentdateresolved = dateresolved;
	}
	
	
	
	public int getincidentcreateduserid() {
		return incidentcreateduserid;
	}
	
	public void setincidentcreateuserid(int incidentuserid) {
		this.incidentcreateduserid = incidentuserid; 
	}

	public int getincidentresolveduserid() {
		return incidentresolveduserid;
	}
	
	public void setincidentresolveduserid(int incidentresolveuserid	) {
		this.incidentresolveduserid	 = incidentresolveuserid	; 
	}
			
	public List<Object[]> getincidents() {	
		return incidents;
	}

	public void setincidents(Object[] incidentline) {
		Object[] incidentlines = incidentline;
	    incidents.add(incidentlines);
	}


	
	
	
	public List<Object[]> viewincidents(String incidentsassigneduserid) throws IOException, ParseException
	{
		
		BufferedReader in = new BufferedReader(
		new FileReader(incidentsfile));
		String line  = null;
		
		while ((line = in.readLine()) != null) 
		{
			
			String[] fields		= line.split(",");

			incidentid			=	Integer.parseInt(fields[0]);
			incidenttitle		= 	fields[1];
			incidentdescription	= 	fields[2];
			incidentdescriptiondetail = fields[3];
			incidentpriority 	= 	fields[4];
			incidentdatecreated = 	fields[5].toString();
			incidentdateresolved =  fields[6].toString();
			incidentcreateduserid = Integer.parseInt (fields[7]);
			incidentresolveduserid = Integer.parseInt(fields[8]);
			

			if(incidentresolveduserid == Integer.parseInt(incidentsassigneduserid)  )
			{
				System.out.println(incidentsassigneduserid);
				Object[] incidentline = {incidentid,incidenttitle,incidentdescription, incidentdescriptiondetail,incidentpriority, incidentdatecreated, incidentdateresolved, incidentcreateduserid,incidentresolveduserid};
				this.setincidents(incidentline);
				
			}
			
		}
		
		in.close();
		return incidents;
			
	}

	
	public List<Object[]> viewincidents() throws IOException, ParseException{
		
				BufferedReader in = new BufferedReader(
				new FileReader(incidentsfile));
				String line = null;
				while ((line = in.readLine()) != null) {
					
					String[] fields=line.split(",");			
					
					incidentid			=   Integer.parseInt(fields[0]);
					incidenttitle		= 	fields[1];
					incidentdescription	= 	fields[2];
					incidentdescriptiondetail = fields[3];
					incidentpriority 	= 	fields[4];
				    
					incidentdatecreated = 	fields[5].toString();
					incidentdateresolved =  fields[6].toString();
					
					incidentcreateduserid = Integer.parseInt(fields[7]);						
					incidentresolveduserid = Integer.parseInt(fields[8]);
					
					Object[] incidentline = {incidentid,incidenttitle,incidentdescription, incidentdescriptiondetail, incidentpriority,incidentdatecreated,incidentdateresolved, incidentcreateduserid, incidentresolveduserid };
					this.setincidents(incidentline);
				
				}
				
				in.close();
				return incidents;
				
	}


	
	
	public List<Object[]> getincidentbyid(int incidentsid) throws IOException, ParseException
	{
		
		BufferedReader in = new BufferedReader(
		new FileReader(incidentsfile));
		String line  = null;
		
		while ((line = in.readLine()) != null) 
		{
			
			String[] fields		= line.split(",");

			incidentid			=	Integer.parseInt(fields[0]);
			incidenttitle		= 	fields[1];
			incidentdescription	= 	fields[2];
			incidentdescriptiondetail = fields[3];
			incidentpriority 	= 	fields[4];
			incidentdatecreated = 	fields[5].toString();
			incidentdateresolved =  fields[6].toString();
			incidentcreateduserid = Integer.parseInt (fields[7]);
			incidentresolveduserid = Integer.parseInt(fields[8]);
			
			
			if(incidentid == incidentsid )
			{
				Object[] incidentline = {incidentid,incidenttitle,incidentdescription,incidentdescriptiondetail, incidentpriority, incidentdatecreated, incidentdateresolved, incidentcreateduserid,incidentresolveduserid};
				this.setincidents(incidentline);
				
			}

			
		}
		
		in.close();
		return incidents;
			
	}
	 

	

	public String updateIncidentInFile(int incidentsid, String incidentstitle, String incidentsdescription, String incidentspriority, String incidentsdatecreated, String incidentsdateresolved, int incidentscreateduserid, int incidentsresolveuserid) throws IOException {

		boolean isModified = false;
		
		BufferedReader in =new BufferedReader(
		new FileReader(incidentsfile));
		String line = null;
		while ((line = in.readLine()) != null) 
		{

			String[] fields		=	line.split(",");
			String newline = incidentsid + "," + incidentstitle + "," + "," + 
								incidentsdescription + "," + 
								incidentspriority + "," + 
								incidentsdatecreated + "," +
								incidentscreateduserid + "," +
								incidentsresolveuserid;
			
			if(incidentsid == Integer.parseInt(fields[0]))
			{
				if (	(incidentstitle		== 	fields[1])
						&&	(incidentsdescription	== 	fields[2])
						&& 	(incidentspriority 		== 	fields[3])
						&& 	(incidentsdatecreated   == 	fields[4].toString())
						&& 	(incidentscreateduserid == Integer.parseInt (fields[6]))
						&&	(incidentsresolveuserid == Integer.parseInt (fields[7])) )
				{
					isModified = false;
					lines.add(line);
				} 
				else {
					isModified = true;
					lines.add(newline);
				}
			}
		}
		
		
		        try (PrintWriter writer = new PrintWriter(new FileWriter(incidentsfile))) {
		        	for(String liner: lines)	
		        	{
		        		writer.println(liner);
		        	}
		        		writer.close();

		        } catch (IOException e) {
		            e.printStackTrace();
		        }

		        return "Successfully update message";
    
		}

		
 	

	public String addincidenttofile() throws IOException {
		

		try {
			
			PrintWriter out=new PrintWriter(
				new BufferedWriter(
				new FileWriter(incidentsfile,true)));

			out.println(getincidentid() + "," + 
							getincidenttitle() + "," + 
								getincidentdescription() + "," + 
								  getincidentdescriptiondetail() + "," + 
									getincidentpriority() + "," + 
										getincidentdatecreated() + "," + 
											getincidentdateresolved() + "," + 
											getincidentcreateduserid() + "," + 
											getincidentresolveduserid());
		
			out.close();
			
			return "Successfull message";
			
		}catch(IOException message) {
			return message.toString();
		}
	}

	
	
}



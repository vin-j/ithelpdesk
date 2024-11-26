
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

	
	String severity;
	String priority;
	String assignedUser;
	String customer;


	protected String incidentassignedto;
	protected String incidentcreatedby;
	protected String incidentseverity_;
	protected String incidentpriority_;

	protected int incidentid;
	protected String incidenttitle;
	protected String incidentdescription;
	protected String incidentdescriptiondetail;
	protected String incidentpriority;
	protected String incidentdatecreatedconversion;
	protected String incidentdatecreated;
	protected String incidentdateresolved;
	
	protected int incidentcreateduserid;
	protected String incidentresolveduserid;

    
	protected List<String> lines = new ArrayList<>();
	protected List<Object[]> incidents = new ArrayList<Object[]>();
	protected List<String[]> incident;
	protected String incidentsfile= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsfile.txt";
	
	
	
	public Incidents()
	{
	    this.severity = severity;
        this.priority = priority;
        this.assignedUser = assignedUser;
        this.customer = customer;
    		
	}
	
	public Incidents(int incidentid, String incidenttitle, String incidentdescription, String incidentpriority, String incidentdatecreated, String incidentdateresolved, int incidentcreateduserid, String incidentresolveuserid ) 
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

	public String formatdateforinput(String incidentdatecreated)
	{
			String incidentcreateformattedDateTime;
		 	String inputDateTime = incidentdatecreated;
	        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
	        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	        LocalDateTime localDateTime = LocalDateTime.parse(inputDateTime, inputFormatter);
	        incidentcreateformattedDateTime = localDateTime.format(outputFormatter);	        
	       	
	        return     incidentcreateformattedDateTime;			
	}

	public String formatdateforoutput(String incidentdatecreated)
	{
			String incidentcreateformattedDateTime;
		 	String inputDateTime = incidentdatecreated;
	        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
	        LocalDateTime localDateTime = LocalDateTime.parse(inputDateTime, inputFormatter);
	        incidentcreateformattedDateTime = localDateTime.format(outputFormatter);	        
	       	
	        return     incidentcreateformattedDateTime;		
	
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

	public String getincidentresolveduserid() {
		return incidentresolveduserid;
	}
	
	public void setincidentresolveduserid(String incidentresolveuserid	) {
			this.incidentresolveduserid	 = incidentresolveuserid	;
	}

	public void setincidentassignedto(String incidentassignedto	) {
		this.incidentassignedto	 = incidentassignedto	; 
	}

	public String getincidentpriority_() {
		return incidentpriority_;
	}

	public void setincidentpriority_(String incidentpriority_	) {
		this.incidentpriority_	 = incidentpriority_	; 
	}

	public String getincidentseverity_() {
		return incidentseverity_;
	}

	public void setincidentseverity_(String incidentseverity_	) {
		this.incidentseverity_	 = incidentseverity_	; 
	}

	public String getincidentcreatedby() {
		return incidentcreatedby;
	}

	public void setincidentcreatedby(String incidentcreatedby	) {
		this.incidentcreatedby	 = incidentcreatedby	; 
	}

	public String getincidentassignedto() {
		return incidentassignedto;
	}

	public void setincidentassignedto_(String incidentassignedto	) {
		this.incidentassignedto	 = incidentassignedto	; 
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
			incidentresolveduserid = fields[8];
			
			
			if(incidentresolveduserid == incidentsassigneduserid) 
			{
				Object[] incidentline = {incidentid,incidenttitle,incidentdescription, incidentdescriptiondetail,incidentpriority, incidentdatecreated, incidentdateresolved, incidentcreateduserid,incidentresolveduserid};
				this.setincidents(incidentline);
				
			}
			
		}
		
		in.close();
		return incidents;
			
	}

	
	public Incidents[] convertToIncidents(List<Object[]> rawIncidents) {
        List<Incidents> incidents = new ArrayList<>();

        for (Object[] raw : rawIncidents) {
            int incidentId = (int) raw[0];
            String incidentTitle = (String) raw[1];
            String incidentDescription = (String) raw[2];
            String incidentSeverity = (String) raw[3];
            //incidents.add(new Incidents(incidentId, incidentTitle, incidentDescription,  incidentdescriptiondetail, incidentdatecreated, incidentdateresolved, incidentcreateduserid, incidentresolveduserid, incidentSeverity, incidentpriority_));
        }

        return incidents.toArray(new Incidents[0]);
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
					incidentresolveduserid = fields[8];

					incidentassignedto = fields[9];
					incidentcreatedby = fields[10];
					incidentseverity_ = fields[11];
					incidentpriority_ = fields[12];
					
					
					Object[] incidentline = {incidentid,incidenttitle,incidentdescription, incidentdescriptiondetail, incidentpriority,incidentdatecreated,incidentdateresolved, incidentcreateduserid, incidentresolveduserid,incidentassignedto,incidentcreatedby,incidentseverity_,incidentpriority_ };
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

			incidentassignedto		= fields[9];
			incidentcreatedby		= fields[10];
			incidentseverity_		= fields[11];
			incidentpriority_		= fields[12];

			incidentid				=	Integer.parseInt(fields[0]);
			incidenttitle			= 	fields[1];
			incidentdescription		= 	fields[2];
			incidentdescriptiondetail = fields[3];
			incidentpriority 		= 	fields[4];
			incidentdatecreated 	= 	fields[5].toString();
			incidentdateresolved 	=  fields[6].toString();
			incidentcreateduserid 	= Integer.parseInt (fields[7]);
			incidentresolveduserid 	= fields[8];
			
			
			if(incidentid == incidentsid )
			{
				Object[] incidentline = {incidentid,incidenttitle,incidentdescription,incidentdescriptiondetail, incidentpriority, incidentdatecreated, incidentdateresolved, incidentcreateduserid,incidentresolveduserid, incidentassignedto , incidentcreatedby , incidentseverity_, incidentpriority_};
				this.setincidents(incidentline);
				
			}

			
		}
		
		in.close();
		return incidents;
			
	}
	 

	public String updateIncidentInFile() throws IOException 
	{

		String newline="";
		BufferedReader in =new BufferedReader(
		new FileReader(incidentsfile));
		String line = null;
		while ((line = in.readLine()) != null) 
		{

			String[] fields		=	line.split(",");
			newline 		= 	getincidentid() + "," + 
								getincidenttitle() + "," + 
								getincidentdescription() + "," + 
								getincidentdescriptiondetail() + "," +
								getincidentpriority() + "," + 
								getincidentdatecreated() + "," +
								getincidentdateresolved() + "," +
								getincidentcreateduserid() + "," +
								getincidentresolveduserid() + "," +
								getincidentassignedto() + "," +
								getincidentcreatedby() + "," +
								getincidentseverity_() + "," +
								getincidentpriority_() 
								;
								
			
			if(getincidentid() != Integer.parseInt(fields[0]))
			{				
				lines.add(line);
			} 
		}
		
		try (PrintWriter writer = new PrintWriter(new FileWriter(incidentsfile))) {
		        	
		      	writer.println(newline);
		
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

			out.println(
							getincidentid() + "," + 
							getincidenttitle() + "," + 
							getincidentdescription() + "," + 
							getincidentdescriptiondetail() + "," + 
							getincidentpriority() + "," + 
							getincidentdatecreated() + "," + 
							getincidentdateresolved() + "," + 
							getincidentcreateduserid() + "," + 
							getincidentresolveduserid()	+ "," +	

							
							getincidentassignedto() + "," +											
							getincidentcreatedby()+ "," +
							getincidentseverity_() + "," +
							getincidentpriority_() 

						);
		
			out.close();
			
			return "Successfull message";
			
		}catch(IOException message) {
			return message.toString();
		}
	}

	
}



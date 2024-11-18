
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
import java.io.IOException;

public class Reports {

	private static String incidentsfilepath= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\incidentsfile.txt";

	public Reports() {
		
	}
	
	public int countline() throws FileNotFoundException 
	{
		
		int linecount=0;
		BufferedReader in = new BufferedReader(
				new FileReader(incidentsfilepath));
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

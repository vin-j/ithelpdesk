
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
import java.util.Arrays;
import java.util.List;

//import lab2.Checking4;
//import lab2.Checking5;

public class Accounts {

		protected List<Object[]> accounts = new ArrayList<Object[]>();
		protected List<String[]> account;
		protected int AccountIndex;
		protected int AccountNumber;
		protected float AccountBalance;
		protected String AccountName;
		
		protected String filename= "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\account.txt";
		
		//protected String filename= "C:\\Users\\vjone\\eclipse-workspace\\ithelpdesk\\data\\account.txt";
		
		
		public Accounts() {
			//super();
			
		}
		
		
		public void setName(String name) {
			this.AccountName = name;
		}
		
		public String getName() {
			return AccountName;
		}
		public void setAccNum(int accnum) {
			this.AccountNumber = accnum;
		}
		public int getAccNum(){
			return AccountNumber;
		}
		
		public void setBalance(float balance) {
			this.AccountBalance = balance;
		}
		
		public float getBalance() {
			return AccountBalance;
		}

		
		public List<Object[]> getAccounts() {	
			return accounts;
		}

		public void setAccounts(Object[] accountsdetails) {
			Object[] arr1 = accountsdetails;
		    accounts.add(arr1);
		}


		//@Overloading
		public List<Object[]> ReadAcct() throws IOException{
			//read the file 
			
					BufferedReader in2=new BufferedReader(
					new FileReader(filename));
					String line2 = null;
					while ((line2 = in2.readLine()) != null) {
						
					
					//line2=in2.readLine();
					//parse the line into its fields
					String[] fields=line2.split(",");
					
					int ID=Integer.parseInt(fields[0]);
					int custNu=Integer.parseInt(fields[1]);
					int acctNu=Integer.parseInt(fields[2]);
					String name= (fields[3]);
					float balance= Float.parseFloat(fields[4]);
					
					Object[] checkingaccountdetails = {ID,custNu,acctNu,name,balance};
					this.setAccounts(checkingaccountdetails);
					
					}
					
					in2.close();
					return accounts;
					
		}

		//@Overloading
		public List<Object[]> ReadAcct(int custnu) throws IOException{
			//read the file 
			
					BufferedReader in2=new BufferedReader(
					new FileReader(filename));
					String line2 = null;
					while ((line2 = in2.readLine()) != null) {
						
					
					//line2=in2.readLine();
					//parse the line into its fields
					String[] fields=line2.split(",");
					
					int ID=Integer.parseInt(fields[0]);
					int custNu=Integer.parseInt(fields[1]);
					int acctNu=Integer.parseInt(fields[2]);
					String name= (fields[3]);
					float balance= Float.parseFloat(fields[4]);
					
					if(custnu == custNu) 
					{
						Object[] checkingaccountdetails = {ID,custNu,acctNu,name,balance};
						this.setAccounts(checkingaccountdetails);
					}
					
					/*
					Accounts	getaccounts = new Accounts();
					getaccounts.setName(name);
					getaccounts.setAccNum(acct);
					getaccounts.setBalance(balance);
					
					
					//Checking5 checking5 = new Checking5();

		        	Object[] checkingaccountdetails = {getaccounts.getAccNum(),getaccounts.getBalance(),getaccounts.getName()};
		        	getaccounts.setAccounts(checkingaccountdetails);
		        	
		        	//accounts.add(checkingaccountdetails);
		            
					System.out.println();
					//System.out.println(getaccounts.getName() + "," + getaccounts.getAccNum() + "," + getaccounts.getBalance());
					System.out.println(accounts.size());
					*/
					
			}
					/*
					for(Object[] str: this.getAccounts())	
					{
						System.out.println(str[0]);
					}
					*/
					
					
					in2.close();
					return accounts;
					
		}
		
		/*
		protected void setAccounts(int acct, float balance, String name) {
			// TODO Auto-generated method stub
			
		}

		
		public List<String[]> getAccount(){
			return account;	
		}
		
		public List<String[]> setAccount() {
			
			System.out.println("List of Accounts				");
		       
			List<String[]> account = new ArrayList<String[]>();
			
			String[] arr1 = {"1", "Vinay", "1000"};
			String[] arr2 = {"2", "Jaya", "2000"};
			String[] arr3 = {"3", "Ola", "3000"};
			String[] arr4 = {"4", "Khyati", "4000"};
					
			
			account.add(arr1);
			account.add(arr2);
			account.add(arr3);
			account.add(arr4);
			 
	       for(String[] str: account) {
	    	   System.out.println(Arrays.toString(str));
	       }
	       
	       return account;
		}
		*/
		
	}



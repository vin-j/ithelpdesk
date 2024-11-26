package ithelpdesk;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;

public class files 
{
	    private String fileName;
	    private String contentType;
	    private long fileSize;
	    private String uploadPath;
	    private LocalDateTime uploadTime;

	    // Constructors
	    public files() {}


	    public files(String fileName, String contentType, long fileSize, String uploadPath, LocalDateTime uploadTime) {
	    	
	    	   this.fileName = fileName;
		        this.contentType = contentType;
		        this.fileSize = fileSize;
		        this.uploadPath = uploadPath;
		        this.uploadTime = uploadTime;
		        
		}

		// Getters and Setters
	    public String getFileName() {
	        return fileName;
	    }

	    public void setFileName(String fileName) {
	        this.fileName = fileName;
	    }

	    public String getContentType() {
	        return contentType;
	    }

	    public void setContentType(String contentType) {
	        this.contentType = contentType;
	    }

	    public long getFileSize() {
	        return fileSize;
	    }

	    public void setFileSize(long fileSize) {
	        this.fileSize = fileSize;
	    }

	    public String getUploadPath() {
	        return uploadPath;
	    }

	    public void setUploadPath(String uploadPath) {
	        this.uploadPath = uploadPath;
	    }

	    public LocalDateTime getUploadTime() {
	        return uploadTime;
	    }

	    public void setUploadTime(LocalDateTime uploadTime) {
	        this.uploadTime = uploadTime;
	    }

	    
	    public List<files> viewfile() {
	    	 System.out.println("doGet method called at " + LocalDateTime.now());

	 		String filePath = "C:/xampp/tomcat/webapps/ithelpdesk/data/files.txt";

	         List<files> fileInfoList = new ArrayList<>();

	         try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
	             String line;
	             while ((line = reader.readLine()) != null) {
	                 String[] parts = line.split(",");
	                 if (parts.length >= 3) {
	                     fileInfoList.add(new files(parts[0], parts[1], Long.parseLong( parts[2]), parts[3], LocalDateTime.parse(parts[4].replace(" ", "T"))));
	                 }
	             }                        

	         } catch (IOException e) {
	             e.printStackTrace();
	         }
	         
	    	return fileInfoList;
	    }
	    
	    
	    // toString Method
	    @Override
	    public String toString() {
	        return "FileEntity {" +
	                "fileName='" + fileName + '\'' +
	                ", contentType='" + contentType + '\'' +
	                ", fileSize=" + fileSize +
	                ", uploadPath='" + uploadPath + '\'' +
	                ", uploadTime=" + uploadTime +
	                '}';
	    }
}


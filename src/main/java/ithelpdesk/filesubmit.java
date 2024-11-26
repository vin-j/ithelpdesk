package ithelpdesk;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.time.LocalDateTime;

import javax.servlet.http.*;

/**
 * Servlet implementation class filesubmit
 */
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024, // 1 MB
	    maxFileSize = 1024 * 1024 * 10,  // 10 MB
	    maxRequestSize = 1024 * 1024 * 50 // 50 MB
	)
@WebServlet(description = "files", urlPatterns = { "/filesubmit" })
public class filesubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected String filesubmit = "C:\\xampp\\tomcat\\webapps\\ithelpdesk\\data\\files.txt";
	protected String filelocation = "files";   
 
	/**
     * @see HttpServlet#HttpServlet()
     */
    public filesubmit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	    response.setContentType("text/html");
	    PrintWriter out = response.getWriter();
	    PrintWriter writer = new PrintWriter(new FileWriter(filesubmit,true));
	    
	    try {
	        // Retrieve the uploaded file part
	        Part filePart = request.getPart("file");
	        
	        if (filePart != null) {
	            // Get file details
	            String fileName = filePart.getSubmittedFileName();
	            String contentType = filePart.getContentType();
	            long fileSize = filePart.getSize();
	            
	            // Display file details
	            out.println("<p>File Name: " + fileName + "</p>");
	            out.println("<p>Content Type: " + contentType + "</p>");
	            out.println("<p>File Size: " + fileSize + " bytes</p>");

	            // Save the file
	            String uploadPath = "C:/xampp/tomcat/webapps/ithelpdesk/files/"; // Change to your desired path
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdir();
	            }
	            filePart.write(uploadPath + fileName);
	            
	            //add details to file
	        	writer.println(fileName + ","  + contentType + "," + fileSize + "," + filelocation + "," + LocalDateTime.now());			
	        	writer.close();


	            out.println("<p>File uploaded successfully to: " + uploadPath + fileName + "</p>");

	            
	            
	            request.setAttribute("fileName", fileName);
	            request.setAttribute("contentType", contentType);
	            request.setAttribute("fileSize", fileSize);

	            String redirectUrl = "filesubmit.jsp?fileName=" + URLEncoder.encode(fileName, "UTF-8") +
	                     "&contentType=" + URLEncoder.encode(contentType, "UTF-8") +
	                     "&fileSize=" + fileSize;
	        
	            response.sendRedirect(redirectUrl);

	        } else {
	            out.println("<p>No file uploaded</p>");
	        }
	    } catch (Exception e) {
	        out.println("<p>Error processing file upload: " + e.getMessage() + "</p>");
	    }
		
	}

}



/*
@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
}
*/
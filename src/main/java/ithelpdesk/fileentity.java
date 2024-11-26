package ithelpdesk;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/fileentity")
public class fileentity extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
	public fileentity() {
        super();
        System.out.println("constructor " + LocalDateTime.now());

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
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

        request.setAttribute("fileInfoList", fileInfoList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("files.jsp");
        
        dispatcher.forward(request, response);
        
    
	
	}


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	doGet(request, response);
    	System.out.println("dopost method called at " + LocalDateTime.now());

	}

}

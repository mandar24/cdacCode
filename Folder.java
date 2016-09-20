
package createFolder;

import com.google.drive.utils.Constants;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Folder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = (String) request.getSession().getAttribute("USER");

        String destination = Constants.gdPath+"\\"+username;

        System.out.println("called get username");

        System.out.println("called get directory");
        
        File directory = new File(destination, username);
        //check if the location exists
        if (!directory.exists()) {
            //let's try to create it
            try {
                directory.mkdir();
            } catch (SecurityException secEx) {
                //handle the exception
                secEx.printStackTrace(System.out);
                directory = null;
            }
        }




    }
}